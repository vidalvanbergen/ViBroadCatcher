#tag Module
Protected Module HydRaSSCore
	#tag Method, Flags = &h1
		Protected Sub CheckNow()
		  dim ConnectionTest as new HTTPSocket // Internet connection test socket
		  ConnectionTest.Yield = True
		  dim IsConnected as Boolean = ConnectionTest.Get("http://www.google.nl/",30) <> ""
		  
		  App.UpdateStatusIcon(True)
		  
		  if IsConnected then
		    
		    dim TheFeeds as Dictionary = RSSFeeds
		    
		    if TheFeeds <> Nil and TheFeeds.Count > 0 then
		      
		      for each key as string in TheFeeds.Keys
		        if key.StartsWith("http") then
		          dim sckt as new HydRaSocket
		          sckt.Send("GET", key.ToText)
		          TheSockets.Append sckt
		        end if
		      next
		      
		    end if
		    
		    CleanUnusedHistory
		    
		  else
		    MsgBox kConnectToInternet
		    App.UpdateStatusIcon(False)
		    
		    App.SetTimerStatus
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CleanUnusedHistory()
		  dim TheFeeds as Dictionary = RSSFeeds
		  Dim HashedFeeds() as string
		  
		  if TheFeeds <> Nil then
		    for each key as string in TheFeeds.Keys
		      HashedFeeds.Append key.StringMD5
		    next
		    
		    dim historyItems() as FolderItem = HistoryFolder.Items
		    
		    for each item as FolderItem in historyItems
		      if HashedFeeds.Contains( item.NameNoExtension ) then
		        // Fine, continue
		      else
		        item.Delete
		        'Break
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileNameFromURL(TheURL as String) As String
		  if NOT TheURL.EndsWith( "/" ) then
		    dim Name as String = TheURL.NthField("/", TheURL.CountFields("/"))
		    if name.Contains("?") then
		      Name = Name.NthField("?",1)
		    end if
		    
		    Return Name
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GatherArticlesChronologically() As Dictionary
		  
		  dim CompleteHistory as new Dictionary
		  dim historyFiles() as FolderItem = HydRaSSCore.HistoryFolder.Items
		  'dim TheFeeds as Dictionary = HydRaSSCore.RSSFeeds
		  
		  // Gather complete history
		  if historyFiles <> Nil and historyFiles.Ubound > -1 then
		    for each file as FolderItem in historyFiles
		      if file <> Nil and file.IsReadable then
		        
		        dim History as new Dictionary
		        
		        if History.LoadXML(file) then
		          
		          if History <> Nil and History.Keys.Ubound > -1 then
		            for each key as string in History.Keys
		              dim feedName as string = GetFeedNameByHash( file.NameNoExtension )
		              
		              dim entry as Dictionary = History.Value(key)
		              entry.Value("feedname") = feedName
		              
		              CompleteHistory.Value(key) = entry
		            next
		          end if
		          
		          
		        else
		          log "Couldn't load history"
		          Break
		        end if // @END History.LoadXML(file)
		        
		      end if // @END file <> Nil
		    next // @NEXT File
		  end if // @END historyFiles <> Nil
		  
		  // Sort by Date
		  dim link(), title(), feedname(), source as string
		  dim totalseconds() as Int64
		  dim pubDate() as DatePro
		  
		  for each key as string in CompleteHistory.Keys
		    dim entry as Dictionary = CompleteHistory.Value(key)
		    
		    
		    if entry.Lookup("pubDate","") <> "" then
		      dim EntryDate as new DatePro
		      EntryDate.ISO8601 = entry.Value("pubDate")
		      EntryDate.GMTOffset = DatePro.LocalGMTOffset
		      
		      dim now as new DatePro
		      
		      pubDate.Append EntryDate
		      link.Append entry.Lookup("link","")
		      title.Append entry.Lookup("title","")
		      feedname.Append entry.Lookup("feedname","")
		      totalseconds.Append entrydate.TotalSeconds
		    else
		      Break
		    end if
		    
		    
		  next
		  
		  totalseconds.SortWith(link,title,feedname,pubDate)
		  
		  dim sortedHistory as new Dictionary
		  for index as Integer = totalseconds.Ubound DownTo 0
		    if index <= (totalseconds.Ubound - Val( AppSettings.Prefs.Value("RecentCount",30) ) ) then
		      Exit
		    else
		      dim entry as new Dictionary
		      entry.Value("title") = title(index)
		      entry.Value("link") = link(index)
		      entry.Value("date") = pubDate(index)
		      entry.Value("feedname") = feedname(index)
		      
		      sortedHistory.Value(link(index)) = entry
		    end if
		  next
		  
		  Return sortedHistory 'Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFeedName(FeedURL as String) As String
		  dim TheFeeds as Dictionary = RSSFeeds
		  if TheFeeds <> Nil and TheFeeds.HasKey(FeedURL) then
		    dim entry as Dictionary = TheFeeds.Value(FeedURL)
		    Return entry.Lookup("name", URLHost(FeedURL) )'TheFeeds.Value(FeedURL)
		  else
		    Return URLHost(FeedURL)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFeedNameByHash(FeedHash as String) As String
		  dim TheFeeds as Dictionary = RSSFeeds
		  
		  if TheFeeds <> Nil and TheFeeds.Count > 0 then
		    for each key as string in TheFeeds.Keys
		      
		      if key.StringMD5 = FeedHash then
		        dim entry as Dictionary = TheFeeds.Value(key)
		        Return entry.Lookup("name", URLHost(key))
		      end if
		      
		    next
		  end if
		  
		  'Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFeedTag(FeedURL as String) As String
		  dim TheFeeds as Dictionary = RSSFeeds
		  if TheFeeds <> Nil and TheFeeds.HasKey(FeedURL) then
		    dim entry as Dictionary = TheFeeds.Value(FeedURL)
		    Return entry.Lookup("tag", "" )'TheFeeds.Value(FeedURL)
		  else
		    Return URLHost(FeedURL)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetLink(FeedURL as string, FeedItem as Dictionary)
		  dim destination as FolderItem = DownloadsFolder
		  
		  dim PreferMagnets as Boolean = AppSettings.Prefs.Value("PreferMagnets", False)
		  dim OrganizeByFeedTag as Boolean = AppSettings.Prefs.Value("OrganizeByFeedTag", False)
		  dim PrefixLinkType as Boolean = AppSettings.Prefs.Value("PrefixLinkType", False)
		  dim AutoOpen as Boolean = AppSettings.Prefs.Value("AutoOpen", False)
		  
		  
		  // Filter out the different links
		  dim torrentURL, magnetURI, webpageLink, enclosureLink as string
		  enclosureLink = FeedItem.Lookup("enclosure","")
		  
		  for each key as string in FeedItem.Keys
		    dim TheValue as string = FeedItem.Value(key)
		    
		    if TheValue.StartsWith("http") and TheValue.EndsWith(".torrent") then
		      torrentURL = TheValue
		    elseif TheValue.StartsWith("magnet:") then
		      magnetURI = TheValue
		    elseif TheValue.StartsWith("http") then
		      webpageLink = TheValue
		    end if
		    
		  next
		  
		  
		  // Get a simple name
		  dim name as string = FeedItem.Lookup("title","")
		  name = name.ReplaceAll(":", "-")
		  while name.StartsWith(".")
		    name = name.Replace(".","")
		  wend
		  dim FileName, FileExtension as string
		  
		  // Get a save feed name
		  'dim feedName as string = GetFeedName(FeedURL)
		  'feedName = feedName.ReplaceAll(":","-")
		  'while feedName.StartsWith(".")
		  'feedName = feedName.Replace(".","")
		  'wend
		  
		  dim feedTag as string = GetFeedTag(FeedURL)
		  feedTag = feedTag.ReplaceAll(":","-")
		  while feedTag.StartsWith(".")
		    feedTag = feedTag.Replace(".","")
		  wend
		  
		  
		  // Create Feed folders if necesairy
		  if OrganizeByFeedTag then
		    
		    if NOT destination.Child(feedTag).Exists then
		      destination.Child(feedTag).CreateAsFolder
		    end if
		    
		    destination = destination.Child(feedTag)
		    
		    // These shouldn't happen
		    if destination = Nil then
		      Break
		    elseif NOT destination.Exists then
		      Break
		      destination.CreateAsFolder
		    end if
		  end if
		  
		  
		  dim DownloadURL as String // The URL as NSURL
		  dim webloc as new Dictionary // The .webloc file to be
		  dim PreFix as string // Handy dandy prefix's
		  
		  
		  if preferMagnets and magnetURI <> "" then
		    webloc.Value("URL") = magnetURI
		    if PrefixLinkType then
		      PreFix = "[Magnet] "
		    end if
		    
		    
		  else
		    
		    if enclosureLink <> "" and NOT enclosureLink.StartsWith("magnet:") then // Enclosure
		      if PrefixLinkType then
		        PreFix = "[Enclosure] "
		      end if
		      DownloadURL = enclosureLink
		      FileName = FileNameFromURL(enclosureLink)
		      if FileName = "" then
		        FileName = name
		      end if
		      
		    elseif torrentURL <> "" then // Torrent File
		      if PrefixLinkType then
		        PreFix = "[Torrent] "
		      end if
		      DownloadURL = torrentURL    
		      FileName = FileNameFromURL(torrentURL)
		      if FileName = "" then
		        FileName = name
		      end if
		      
		    elseif magnetURI <> "" then // magnetURI
		      if PrefixLinkType then
		        PreFix = "[Magnet] "
		      end if
		      webloc.Value("URL") = magnetURI
		      
		    elseif webpageLink <> "" then // Webpage Link
		      if PrefixLinkType then
		        PreFix = "[WebLink] "
		      end if
		      webloc.Value("URL") = webpageLink
		      
		    end if // @END select URL
		    
		  end if // @END preferMagnets
		  
		  
		  // Get file extension if available.
		  if FileName <> "" then
		    FileExtension = FileName.NthField(".", FileName.CountFields("."))
		  end if
		  
		  
		  // Handy dandy prefix
		  if AppSettings.Prefs.Value("PrefixFeedTag", False) and feedTag <> "" then'NOT organiseByFeed
		    PreFix = PreFix + "[" + feedTag + "] "
		  end if
		  
		  
		  if DownloadURL <> "" then
		    // Download URL
		    dim outputFile as New Xojo.IO.FolderItem( destination.NativePath.ToText )
		    outputFile = outputFile.Child( PreFix.ToText + name.ToText + "." + FileExtension.ToText )
		    
		    if DownloadURL.Contains("?") then
		      DownloadURL = DownloadURL.NthField("?",1)
		    end if
		    
		    if outputFile <> Nil and NOT outputFile.Exists then // Don't RE-Download
		      dim sckt as new HydRaSocket
		      try
		        sckt.Send("GET", DownloadURL.ToText, outputFile)
		      Catch e as xojo.io.IOException
		        'Break
		        dim downloadsckt as new HTTPSocket
		        dim DownloadedFile as FolderItem = Globals.DownloadFile( DownloadURL, destination, PreFix + name + "." + FileExtension, downloadsckt )
		        'Break
		      end try
		    end if
		    
		  elseif webloc <> Nil and webloc.Count > 0 then
		    if NOT destination.Child(PreFix + Name + ".webloc").Exists and _ // Don't RE-Create
		      webloc.SaveXML( destination.Child(PreFix + name + ".webloc"), True ) then
		      // Create .webloc
		      if magnetURI <> "" and AutoOpen then
		        destination.Child(PreFix + Name + ".webloc").Launch
		      end if
		    end if
		    
		  else
		    log "Failed to download or create link"
		    Break
		  end if
		  
		  // Show notification
		  if AppSettings.Prefs.Value("ShowNotifications", True) then
		    NotificationCenter.Notify "New item", "", FeedItem.Lookup("title","") + " has been added!"
		  end if
		  
		  Exception err as NilObjectException
		    MsgBox "Failed to download item" + EndOfLine + EndOfLine + name
		    'Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MarkNew(NewItemsAvailable as Boolean)
		  
		  dim TheImage as NSImage
		  if NewItemsAvailable then
		    TheImage = import
		  else  
		    TheImage = catcherbutton
		  end if
		  
		  TheImage.Size = Cocoa.NSMakeSize( 16, 16 )
		  TheImage.Template = True
		  
		  App.HydRaStatus.Image = TheImage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PauzeTimer()
		  TheTimer.Mode = Xojo.Core.Timer.Modes.Off
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StartTimer()
		  TheTimer = New HydRaTimer
		  TheTimer.Period = val( AppSettings.Prefs.Value("CheckInterval",30) ) * 1000 * 60
		  TheTimer.Mode = xojo.core.timer.Modes.Multiple
		  CheckNow
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  dim path as string = AppSettings.Prefs.Value("DownloadsFolder", "")
			  dim TheFolder as FolderItem
			  
			  if path <> "" then
			    TheFolder = GetFolderItem( path, FolderItem.PathTypeNative )
			    
			    if TheFolder <> Nil and NOT TheFolder.Exists then
			      TheFolder.CreateAsFolder
			    end if
			  else
			    TheFolder = SpecialFolder.Documents
			  end if
			  
			  Return TheFolder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> Nil then
			    AppSettings.Prefs.Value("DownloadsFolder") = value.NativePath
			  end if
			End Set
		#tag EndSetter
		Protected DownloadsFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DownloadTimers() As DownloadTimer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DownloadURLs() As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  dim TheHistoryFolder as FolderItem = AppSettings.SupportFolder.Child("History")
			  if NOT TheHistoryFolder.Exists then
			    TheHistoryFolder.CreateAsFolder
			  end if
			  Return TheHistoryFolder
			End Get
		#tag EndGetter
		Protected HistoryFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return AppSettings.Prefs.Value("RSSFeeds", Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  AppSettings.Prefs.Value("RSSFeeds") = value
			End Set
		#tag EndSetter
		Protected RSSFeeds As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected TheSockets() As HydRaSocket
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TheTimer As HydRaTimer
	#tag EndProperty


	#tag Constant, Name = kConnectToInternet, Type = String, Dynamic = True, Default = \"The Internet connection appears to be offline.", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The Internet connection appears to be offline."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De internetverbinding is offline."
	#tag EndConstant


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
	#tag EndViewBehavior
End Module
#tag EndModule
