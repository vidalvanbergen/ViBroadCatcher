#tag Class
Protected Class HydRaSocket
Inherits Xojo.Net.HTTPSocket
	#tag Event
		Function AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Error(err as RuntimeException)
		  
		  if err.ErrorNumber = -1009 then
		    MsgBox err.Message
		    
		    RemoveFromQue
		  end if
		  
		  'if AppSettings.HandleError( err, "Unknown (caught at HydRaSocket)" ) then
		  '
		  'end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  dim TheURL as new NSURL( URL )
		  if TheURL <> Nil then
		    dim FileName as string = TheURL.LastPathComponent
		    dim TheFile as FolderItem = GetFolderItem( TheURL.Path, FolderItem.PathTypeNative )
		    'dim FilePath as string = file.Path
		    'dim s as string
		    
		    if FileName.EndsWith( ".torrent" ) and AppSettings.Prefs.Value("AutoOpen", False) then
		      TheFile.Launch
		    end if
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(URL as Text, HTTPStatus as Integer)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  
		  dim PageContent as String = MemoryBlockToText( Content )
		  PageContent = DefineEncoding( PageContent, Encodings.UTF8 )
		  
		  ProcessPage( URL, PageContent )
		  
		  RemoveFromQue
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(BytesReceived as Int64, TotalBytes as Int64, NewData as xojo.Core.MemoryBlock)
		  TheBytesReceived = BytesReceived
		  TheBytesTotal = TotalBytes
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendProgress(BytesSent as Int64, BytesLeft as Int64)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CompareHistory(feedURL as String, FeedItems as Dictionary)
		  dim DownloadedItems as new Dictionary
		  
		  dim feedHash as string = feedURL.StringMD5
		  dim historyFile as FolderItem = HydRaSSCore.HistoryFolder.Child(feedHash + ".plist")
		  dim history as new Dictionary
		  
		  dim IsNewFeed as Boolean = ( historyFile = Nil OR NOT historyFile.Exists )
		  dim counter as Integer = 1
		  
		  
		  if historyFile <> Nil and historyFile.Exists and history.LoadXML( historyFile ) then
		    
		  else
		    log "No history file found for " + feedURL
		    history = new Dictionary
		  end if
		  
		  
		  if FeedItems <> Nil and FeedItems.Count > 0 then
		    
		    for each key as string in FeedItems.Keys
		      
		      dim entry as Dictionary = FeedItems.Value(key)
		      
		      if history.HasKey(key) then      
		        // Already downloaded
		        DownloadedItems.Value(key) = history.Value(key)
		      else
		        // Downloading now
		        'HydRaSSCore.GetLink(feedURL, entry)
		        App.HasNewItems = True
		        
		        dim pubDate as new DatePro
		        if entry.Lookup("pubDate","") <> "" then
		          pubDate.ISO8601 = entry.Lookup("pubDate","").StringValue
		        end if
		        
		        dim LocalDate as new DatePro
		        pubDate.GMTOffset = LocalDate.GMTOffset
		        LocalDate.TotalSeconds = LocalDate.TotalSeconds - (24*60*60)
		        
		        dim dlTimer as new DownloadTimer
		        if IsNewFeed and ( counter < 4 or pubDate.TotalSeconds > LocalDate.TotalSeconds )  then
		          dlTimer.Start( feedURL, entry )
		        elseif NOT IsNewFeed then
		          dlTimer.Start( feedURL, entry )
		        end if
		        
		        dim d as new DatePro
		        entry.Value("downloaded") = d.ISO8601
		        DownloadedItems.Value(key) = entry
		      end if
		      
		      counter = counter + 1
		    next
		    
		  else
		    log "No feeditems available in " + feedURL
		    'Break
		  end if
		  
		  
		  // Keep last 200 items
		  for each key as string in history.Keys
		    if DownloadedItems.HasKey(key) then
		      Continue
		    elseif DownloadedItems.Count < 200 then
		      DownloadedItems.Value(key) = history.Value(key)
		    end if
		  next
		  
		  // Keep for a week
		  'for each key as string in history.Keys
		  'dim entry as Dictionary = history.Value(key)
		  'if DownloadedItems.HasKey(key) then
		  'Continue
		  'else
		  'dim PubDate as new DatePro
		  'if entry.Lookup("pubDate","") <> "" then
		  'PubDate.ISO8601 = entry.Value("pubDate")
		  'PubDate.GMTOffset = DatePro.LocalGMTOffset
		  '
		  'dim WithinLastWeek as new DatePro
		  'WithinLastWeek.AddDays(-7)
		  '
		  'if PubDate.TotalSeconds > WithinLastWeek.TotalSeconds then
		  'DownloadedItems.Value(key) = entry
		  'end if
		  '
		  'end if
		  'end if
		  'next
		  
		  
		  if DownloadedItems <> Nil and DownloadedItems.Count > 0 and DownloadedItems.SaveXML( historyFile, True ) then
		    // Successfully saved history
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessFeedItem(xRoot as XmlNode) As Dictionary
		  
		  dim entry as new Dictionary
		  
		  for each xNode as XmlNode in xRoot.Children
		    
		    if xNode <> Nil then
		      
		      Select case xNode.Name
		        
		      case "title", "link", "description"
		        if xNode.FirstChild <> Nil then
		          entry.Value(xNode.Name) = xNode.FirstChild.Value.ReplaceAll("<![CDATA[","").ReplaceAll("]]>","")
		        end if
		        
		      case "enclosure"
		        if xNode.GetAttribute("url") <> "" then
		          entry.Value(xNode.Name) = xNode.GetAttribute("url").ReplaceAll("<![CDATA[","").ReplaceAll("]]>","")
		        end if
		        
		      case "magnetURI"
		        if xNode.FirstChild <> Nil then
		          entry.Value(xNode.Name) = xNode.FirstChild.Value.ReplaceAll("<![CDATA[","").ReplaceAll("]]>","")
		        end if
		        
		        
		      case "pubDate"
		        dim theParsedDate as new DatePro
		        if DateManipulation.ParseDateAndTime( xNode.FirstChild.Value, theParsedDate ) then
		          // Yay!
		          entry.Value(xNode.Name) = theParsedDate.ISO8601
		        end if
		        
		        
		        
		      End Select // @SELECT xNode.Name
		      
		    end if // @END xNode <> Nil
		    
		  next // @NEXT xNode
		  
		  Return entry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessPage(feedURL as String, Content as String)
		  
		  dim feedName as string = URLHost( feedURL )
		  dim feedInfo as new Dictionary
		  dim feedItems as new Dictionary
		  
		  
		  if Trim( content ).Contains("<?xml") then 'and Trim( content.EndsWith(">") ) then
		    dim xDoc as new XmlDocument
		    xDoc.LoadXml( Content )
		    xDoc.PreserveWhitespace = False
		    
		    if xDoc <> Nil then
		      dim xRoot as XmlNode
		      dim nodelist as XmlNodeList = xDoc.Xql("//channel")
		      
		      if nodelist <> Nil and nodelist.Length > 0 then
		        xRoot = nodelist.Item(0)
		      else
		        xRoot = xDoc.FirstChild.FirstChild
		      end if
		      
		      'if xDoc.FirstChild.FirstChild <> Nil then
		      'xRoot = xDoc.FirstChild.FirstChild
		      'elseif xDoc.FirstChild.Name = "#comment" then
		      'xRoot = xDoc.FirstChild.NextSibling.FirstChild
		      'end if
		      
		      for each xNode as XmlNode in xRoot.Children
		        
		        if xNode <> Nil then
		          
		          Select case xNode.Name
		            
		          case "title", "link", "description"
		            if xNode.FirstChild <> Nil then
		              feedInfo.Value( xNode.Name.Lowercase ) = xNode.FirstChild.Value.ReplaceAll("<![CDATA[", "").ReplaceAll("]]>","")
		            end if
		            
		          case "item"
		            dim entry as new Dictionary
		            entry = ProcessFeedItem(xNode)
		            if entry <> Nil and entry.Lookup("link","") <> "" then
		              feedItems.Value( entry.Lookup("link","").StringValue.StringMD5 ) = entry
		            end if
		            'feedItems.Append ProcessFeedItem( xNode )
		            
		          End Select
		          
		        end if // @END xNode <> Nil
		        
		      next // @NEXT xNode
		      
		    end if // @END xDoc <> Nil
		    
		    
		    
		  elseif Trim( Content ).StartsWith("{") and trim( Content ).EndsWith("}") then
		    // JSON feed
		    dim jFeed as new JSONItem
		    jFeed.Load( Content )
		    
		    feedInfo.Value("title") = jFeed.Lookup("title","")
		    feedInfo.Value("link") = jFeed.Lookup("home_page_url","")
		    
		    dim jFeedItems as JSONItem = jFeed.Lookup("items",nil)
		    if jFeedItems.IsArray then
		      
		      for index as Integer = 0 to jFeedItems.Count-1
		        dim jItem as JSONItem = jFeedItems.Child(index)
		        
		        dim entry as new Dictionary
		        if jItem.Lookup("id","") <> "" then entry.Value("id") = jItem.Value("id")
		        if jItem.Lookup("title","") <> "" then entry.Value("title") = jItem.Value("title")
		        if jItem.Lookup("published","") <> "" then entry.Value("pubDate") = jItem.Value("published")
		        if jItem.Lookup("date_published","") <> "" then entry.Value("pubDate") = jItem.Value("date_published")
		        if jItem.Lookup("date_modified","") <> "" then entry.Value("modified") = jItem.Value("date_modified")
		        if jItem.Lookup("content","") <> "" then entry.Value("description") = jItem.Value("content")
		        if jItem.Lookup("summary","") <> "" then entry.Value("description") = jItem.Value("summary")
		        if jItem.Lookup("content_html","") <> "" then entry.Value("description_html") = jItem.Value("content_html")
		        if entry.Lookup("description","") = "" and entry.Lookup("description_html","") <> "" then
		          entry.Value("description") = entry.Value("description_html").StringValue.RemoveTags
		        end if
		        if jItem.Lookup("url","") <> "" then entry.Value("link") = jItem.Value("url")
		        if jItem.Lookup("external_url","") <> "" then entry.Value("url") = jItem.Value("external_url")
		        if jItem.Lookup("magnetURI","") <> "" then entry.Value("magnetURI") = jItem.Value("magnetURI")
		        if jItem.Lookup("enclosure","") <> "" then entry.Value("enclosure") = jItem.Value("enclosure")
		        
		        
		        dim jAttachment as JSONItem = jItem.Lookup("attachment",Nil)
		        if jAttachment <> Nil then
		          if jAttachment.Lookup("url","") <> "" then entry.Value("enclosure") = jAttachment.Value("url")
		          if jAttachment.Lookup("mime_type","") <> "" then entry.Value("enclosure_type") = jAttachment.Value("mime_type")
		        end if
		        
		        
		        feedItems.Value(jItem.Lookup("id","").StringValue.StringMD5) = entry
		      next
		      
		    end if
		    
		    
		  else
		    Log( "HydRaSocket.ProcessPage :: Invalid XML" )
		  end if
		  
		  
		  CompareHistory( feedURL, feedItems )
		  App.UpdateLastChecked
		  
		  Exception err as XmlException
		    'call AppSettings.HandleError(err, "ProcessPage( " + feedURL + ", content )" )
		    MsgBox "Could not process feed due to malformed XML" + EndOfLine + EndOfLine + feedURL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveFromQue()
		  for index as Integer = HydRaSSCore.TheSockets.Ubound DownTo 0
		    if HydRaSSCore.TheSockets(index) = self then
		      HydRaSSCore.TheSockets.Remove(index)
		    end if
		  next
		  
		  if HydRaSSCore.TheSockets.Ubound <= -1 then
		    log "Finished!"
		    App.UpdateRecentMenu
		    
		    if App.HasNewItems then
		      HydRaSSCore.MarkNew(True)
		    else
		      App.UpdateStatusIcon(False)
		    end if
		    'dim TheStatusImage as NSImage
		    'TheStatusImage = catcherbutton 'NSImage.ApplicationIcon
		    'TheStatusImage.Template = True
		    'TheStatusImage.Size = Cocoa.NSMakeSize(16,16)
		    
		    'App.HydRaStatus.Image = TheStatusImage
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private TheBytesReceived As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TheBytesTotal As Int64
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
