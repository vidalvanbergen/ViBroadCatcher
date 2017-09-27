#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Function CharacterLimitations(t as String) As String
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  't = DefineEncoding( t, Encodings.UTF8 )
		  Dim TheSource as String = t
		  
		  Dim TheText as String
		  Dim CurChr as Integer = 1
		  
		  Do Until CurChr -1 = TheSource.Len'gth
		    
		    'dim t as string = Mid( s, CurChr, 1 )
		    'dim i as Integer = Asc( Mid( s, CurChr, 1 ) )
		    'dim n as Integer = Asc( Mid( s, CurChr, 2 ) )
		    'dim e as string = "0" + Hex( Asc( Mid( s, CurChr, 1 ) ) )
		    
		    Select Case Asc( TheSource.Mid( CurChr, 1 ) )
		    Case Is < 10000 '32, 48 To 57, 65 To 90, 97 To 122', Is > 255 // Allowed characters
		      TheText = TheText + TheSource.Mid( CurChr, 1 )
		    Else
		      'TheText = TheText + "%" + Right( "0" + Hex( Asc( t.Mid( CurChr, 1 ) ) ), 2 ).ToText
		    End Select
		    
		    CurChr = CurChr + 1
		  Loop
		  
		  Return TheText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeHTML(Extends HTMLString as String) As String
		  Return DecodeHTML(  HTMLString )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeHTML(HTMLString as String) As String
		  
		  // Simplify quotes
		  HTMLString = HTMLString.ReplaceAll( "“", """" )
		  HTMLString = HTMLString.ReplaceAll( "”", """" )
		  HTMLString = HTMLString.ReplaceAll( "‘", "'" )
		  HTMLString = HTMLString.ReplaceAll( "’", "'" )
		  HTMLString = HTMLString.ReplaceAll( "â€™", "'" )
		  'HTMLString = HTMLString.ReplaceAll( "‚Äî", "—" )
		  
		  HTMLString = HTMLString.ReplaceAll( "<br />", EndOfLine )
		  HTMLString = HTMLString.ReplaceAll( "<br/>", EndOfLine )
		  HTMLString = HTMLString.ReplaceAll( "<br /]", EndOfLine ) // I don't even...
		  
		  Return HTMLString.UnescapeHTML
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DownloadFile(URL as String, DownloadFolder as FolderItem, FileName as String, ByRef sckt as HTTPSocket) As FolderItem
		  
		  dim URLAbsoluteString, URLPathExtension, URLLastPathComponent as string
		  
		  URLAbsoluteString = URL
		  URLPathExtension = URLAbsoluteString.NthField( ".", URLAbsoluteString.CountFields( "." ) ).NthField( "?", 1 )
		  URLLastPathComponent = URLAbsoluteString.NthField( "/", URLAbsoluteString.CountFields( "/" ) )
		  
		  
		  'dim sckt as New HTTPSocket
		  if sckt = Nil then
		    sckt = New HTTPSocket
		  end if
		  sckt.Yield = True
		  
		  if URL <> "" and URLAbsoluteString <> "" and URLPathExtension <> "" and URLLastPathComponent <> "" then
		    
		    // Set definitive Filename
		    if FileName = "" then
		      FileName = URLLastPathComponent
		    end if
		    if NOT FileName.EndsWith( URLPathExtension ) then
		      FileName = FileName + "." + URLPathExtension
		    end if
		    
		    // Set definitive download destination
		    dim DownloadDestination as FolderItem
		    if DownloadFolder <> Nil then
		      DownloadDestination = DownloadFolder.Child( FileName )
		    else
		      DownloadDestination = SpecialFolder.Temporary.Child( AppSettings.Identifier ).Child( FileName )
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete
		      end if
		    end if
		    
		    // Download file if destination doesn't exist already
		    dim FileSaved as Boolean
		    if DownloadDestination <> Nil then
		      
		      if DownloadDestination.Exists then // Don't overwrite
		        FileSaved = True
		        #If DebugBuild then
		          log "Couldn't download image because a previous one already exists at download destination" + chr( 13 ) + FileManager.NativePath( DownloadDestination )
		        #Endif
		      elseif System.Network.IsConnected then
		        FileSaved = sckt.Get( URLAbsoluteString, DownloadDestination, AppSettings.Prefs.Value( "TimeOut", 120 ) )
		        sckt.Close
		      end if
		      
		    end if // @END DownloadDestination <> Nil
		    
		    
		    if NOT FileSaved then
		      dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete // Remove partially downloaded file.
		      end if
		      
		      if DownloadDestination <> Nil then
		        NotificationCenter.Notify( DownloadDestination.Parent.Name + " Error: " + Str( FileSystemErrorCode ), "", "Connection Time Out" )
		      end if
		      
		      log "Failed to download image, Error: " + Str( FileSystemErrorCode )
		    end if
		    
		    Return DownloadDestination
		    
		  else
		    //
		    #if DebugBuild then
		      log "Nothing to download"
		    #endif
		    
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DownloadFileDeprecated(URL as NSURL, DownloadFolder as FolderItem = Nil, FileName as String = "") As FolderItem
		  
		  dim sckt as New HTTPSocket
		  sckt.Yield = True
		  
		  if URL <> Nil and URL.absoluteString <> "" and URL.PathExtension <> "" then
		    
		    // Set definitive Filename
		    if FileName = "" then
		      FileName = URL.LastPathComponent
		    else
		      dim Extension as string = URL.PathExtension
		      FileName = FileName + "." + Extension
		    end if
		    
		    // Set definitive download destination
		    dim DownloadDestination as FolderItem
		    if DownloadFolder <> Nil then
		      DownloadDestination = DownloadFolder.Child( FileName )
		    else
		      DownloadDestination = SpecialFolder.Temporary.Child( AppSettings.Identifier ).Child( FileName )
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete
		      end if
		    end if
		    
		    // Download file if destination doesn't exist already
		    dim FileSaved as Boolean
		    if DownloadDestination <> Nil then
		      
		      if DownloadDestination.Exists then // Don't overwrite
		        FileSaved = True
		        #If DebugBuild then
		          log "Couldn't download image because a previous one already exists at download destination" + chr( 13 ) + FileManager.NativePath( DownloadDestination )
		        #Endif
		      elseif System.Network.IsConnected then
		        FileSaved = sckt.Get( URL.absoluteString, DownloadDestination, AppSettings.Prefs.Value( "TimeOut", 120 ) )
		        sckt.Close
		      end if
		      
		    end if // @END DownloadDestination <> Nil
		    
		    
		    if NOT FileSaved then
		      dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete // Remove partially downloaded file.
		      end if
		      
		      if DownloadDestination <> Nil then
		        NotificationCenter.Notify( DownloadDestination.Parent.Name + " Error: " + Str( FileSystemErrorCode ), "", "Connection Time Out" )
		      end if
		      
		      log "Failed to download image '" + FileName +"', Error: " + Str( FileSystemErrorCode )
		    end if
		    
		    Return DownloadDestination
		    
		  else
		    //
		    #if DebugBuild then
		      log "Nothing to download"
		    #endif
		    
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DownloadFileDeprecated(URL as NSURL, DownloadFolder as FolderItem = Nil, FileName as String, ByRef sckt as HTTPSecureSocket) As FolderItem
		  
		  'dim sckt as New HTTPSocket
		  if sckt = Nil then sckt = New HTTPSecureSocket
		  sckt.Yield = True
		  
		  if URL <> Nil and URL.absoluteString <> "" and URL.PathExtension <> "" then
		    
		    // Set definitive Filename
		    if FileName = "" then
		      FileName = URL.LastPathComponent
		    else
		      dim Extension as string = URL.PathExtension
		      FileName = FileName + "." + Extension
		    end if
		    
		    // Set definitive download destination
		    dim DownloadDestination as FolderItem
		    if DownloadFolder <> Nil then
		      DownloadDestination = DownloadFolder.Child( FileName )
		    else
		      DownloadDestination = SpecialFolder.Temporary.Child( AppSettings.Identifier ).Child( FileName )
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete
		      end if
		    end if
		    
		    // Download file if destination doesn't exist already
		    dim FileSaved as Boolean
		    if DownloadDestination <> Nil then
		      
		      if DownloadDestination.Exists then // Don't overwrite
		        FileSaved = True
		        #If DebugBuild then
		          log "Couldn't download image because a previous one already exists at download destination" + chr( 13 ) + FileManager.NativePath( DownloadDestination )
		        #Endif
		      elseif System.Network.IsConnected then
		        FileSaved = sckt.Get( URL.absoluteString, DownloadDestination, AppSettings.Prefs.Value( "TimeOut", 120 ) )
		        sckt.Close
		      end if
		      
		    end if // @END DownloadDestination <> Nil
		    
		    
		    if NOT FileSaved then
		      dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete // Remove partially downloaded file.
		      end if
		      
		      if DownloadDestination <> Nil then
		        NotificationCenter.Notify( DownloadDestination.Parent.Name + " Error: " + Str( FileSystemErrorCode ), "", "Connection Time Out" )
		      end if
		      
		      log "Failed to download image, Error: " + Str( FileSystemErrorCode )
		    end if
		    
		    Return DownloadDestination
		    
		  else
		    //
		    #if DebugBuild then
		      log "Nothing to download"
		    #endif
		    
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DownloadFileDeprecated(URL as NSURL, DownloadFolder as FolderItem = Nil, FileName as String, ByRef sckt as HTTPSocket) As FolderItem
		  
		  'dim sckt as New HTTPSocket
		  if sckt = Nil then sckt = New HTTPSocket
		  sckt.Yield = True
		  
		  if URL <> Nil and URL.absoluteString <> "" and URL.PathExtension <> "" then
		    
		    // Set definitive Filename
		    if FileName = "" then
		      FileName = URL.LastPathComponent
		    else
		      dim Extension as string = URL.PathExtension
		      FileName = FileName + "." + Extension
		    end if
		    
		    // Set definitive download destination
		    dim DownloadDestination as FolderItem
		    if DownloadFolder <> Nil then
		      DownloadDestination = DownloadFolder.Child( FileName )
		    else
		      DownloadDestination = SpecialFolder.Temporary.Child( AppSettings.Identifier ).Child( FileName )
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete
		      end if
		    end if
		    
		    // Download file if destination doesn't exist already
		    dim FileSaved as Boolean
		    if DownloadDestination <> Nil then
		      
		      if DownloadDestination.Exists then // Don't overwrite
		        FileSaved = True
		        #If DebugBuild then
		          log "Couldn't download image because a previous one already exists at download destination" + chr( 13 ) + FileManager.NativePath( DownloadDestination )
		        #Endif
		      elseif System.Network.IsConnected then
		        FileSaved = sckt.Get( URL.absoluteString, DownloadDestination, AppSettings.Prefs.Value( "TimeOut", 120 ) )
		        sckt.Close
		      end if
		      
		    end if // @END DownloadDestination <> Nil
		    
		    
		    if NOT FileSaved then
		      dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      
		      if DownloadDestination <> Nil and DownloadDestination.Exists then
		        DownloadDestination.Delete // Remove partially downloaded file.
		      end if
		      
		      if DownloadDestination <> Nil then
		        NotificationCenter.Notify( DownloadDestination.Parent.Name + " Error: " + Str( FileSystemErrorCode ), "", "Connection Time Out" )
		      end if
		      
		      log "Failed to download image, Error: " + Str( FileSystemErrorCode )
		    end if
		    
		    Return DownloadDestination
		    
		  else
		    //
		    #if DebugBuild then
		      log "Nothing to download"
		    #endif
		    
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontAvailable(FontName as String) As Boolean
		  for i as Integer = 0 to FontCount -1
		    if Font(i) = FontName then
		      Return True
		    else
		      Continue
		    end if
		  next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameSaveGet(Extends w as Window, Name as String)
		  dim Frame as String = AppSettings.Prefs.Value( "FramePosition " + Name, "" )
		  
		  if Frame <> "" then
		    dim framePoints() as string = Frame.Split( " " )
		    
		    if framePoints.Ubound = 3 then
		      w.Left = Val( framePoints( 0 ) )
		      w.Top = Val( framePoints( 1 ) )
		      w.Width = Val( framePoints( 2 ) )
		      w.Height = Val( framePoints( 3 ) )
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameSaveSet(Extends w as Window, Name as String)
		  AppSettings.Prefs.Value( "FramePosition " + Name ) = Str( w.Left ) + " " + Str( w.Top ) + " " + Str( w.Width ) + " " + Str( w.Height )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGet(URL as String, RandomIP as Boolean = False) As String
		  dim sckt as New HTTPSocket
		  sckt.Yield = True
		  
		  // Set header information IP/User-Agent
		  if RandomIP then
		    dim r as New Random
		    sckt.SetRequestHeader( "REMOTE_ADDR", Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) )
		  end if
		  
		  'sckt.SetRequestHeader("Accept-Encoding", "gzip, deflate, sdch")
		  sckt.SetRequestHeader("Accept-Language", "en-US,en;q=0.8,nl-NL;q=0.6,nl;q=0.4")
		  sckt.SetRequestHeader("X-Requested-With", "XMLHttpRequest")
		  sckt.SetRequestHeader("X-Prototype-Version", "1.7.1")
		  sckt.SetRequestHeader("DNT", "1")
		  sckt.SetRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17")
		  sckt.SetRequestHeader("Connection", "keep-alive")
		  sckt.SetRequestHeader("Accept", "text/html,text/javascript,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		  
		  
		  // Get content
		  dim Content as String = sckt.Get( URL, 120 )  'Trim( DefineEncoding( sckt.Get( URL, 60 ), Encodings.UTF8 ) )
		  
		  // unzip GZIPped page
		  if sckt.PageHeaders <> Nil and sckt.PageHeaders.Source <> "" and sckt.PageHeaders.Source.Contains( "Content-Encoding: gzip" ) then
		    dim gzipstring as new _gzipstring
		    Content = gzipstring.Decompress( Content )
		  end if
		  
		  Content = DefineEncoding( Content, Encodings.UTF8 )
		  Content = Trim( Content )
		  
		  
		  // Redirected
		  if sckt <> Nil and sckt.HTTPStatusCode = 301 and sckt.PageHeaders <> Nil then
		    URL = sckt.PageHeaders.Value( "Location" )
		    Content = trim( DefineEncoding( sckt.Get( URL, 60 ), Encodings.UTF8 ) )
		    
		    // unzip GZIPped page
		    if sckt.PageHeaders <> Nil and sckt.PageHeaders.Source <> "" and sckt.PageHeaders.Source.Contains( "Content-Encoding: gzip" ) then
		      dim gzipstring as new _gzipstring
		      Content = gzipstring.Decompress( Content )
		    end if
		  end if
		  
		  sckt.Close
		  sckt = Nil // Destroy socket
		  
		  Return Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGetImage(URL as String) As Picture
		  dim memblock as string = HTTPGet( URL )
		  if memblock <> "" then
		    Return Picture.FromData( memblock )
		  else
		    log "HTTPGetImage( " + URL + ") :: Couldn't fetch image."
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGetImageSecure(URL as String) As Picture
		  dim memblock as string = HTTPGetSecure( URL )
		  if memblock <> "" then
		    Return Picture.FromData( memblock )
		  else
		    log "HTTPGetImageSecure( " + URL + ") :: Couldn't fetch image."
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGetSecure(URL as String, RandomIP as Boolean = False) As String
		  dim sckt as new HTTPSecureSocket
		  sckt.Yield = True
		  
		  // Set header information IP/User-Agent
		  if RandomIP then
		    dim r as New Random
		    sckt.SetRequestHeader( "REMOTE_ADDR", Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) )
		  end if
		  
		  sckt.SetRequestHeader("Accept-Language", "en-US,en;q=0.8,nl-NL;q=0.6,nl;q=0.4")
		  sckt.SetRequestHeader("X-Requested-With", "XMLHttpRequest")
		  'sckt.SetRequestHeader("Accept-Encoding", "gzip, deflate, sdch")
		  sckt.SetRequestHeader("X-Prototype-Version", "1.7.1")
		  sckt.SetRequestHeader("DNT", "1")
		  sckt.SetRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.7 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.7")
		  sckt.SetRequestHeader("Connection", "keep-alive")
		  sckt.SetRequestHeader("Accept", "text/html,text/javascript,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		  
		  // Get content
		  dim Content as String = sckt.Get( URL, 120 )
		  
		  
		  // unzip GZIPped page
		  if sckt.PageHeaders <> Nil and sckt.PageHeaders.Source <> "" and sckt.PageHeaders.Source.Contains( "Content-Encoding: gzip" ) then
		    dim gzipstring as new _gzipstring
		    Content = gzipstring.Decompress( Content )
		  end if
		  
		  Content = DefineEncoding( Content, Encodings.UTF8 )
		  Content = Trim( Content )
		  
		  
		  // Redirected
		  if sckt <> Nil and sckt.HTTPStatusCode = 301 and sckt.PageHeaders <> Nil then
		    URL = sckt.PageHeaders.Value( "Location" )
		    Content = trim( DefineEncoding( sckt.Get( URL, 60 ), Encodings.UTF8 ) )
		  end if
		  
		  sckt.Close
		  sckt = Nil // Destroy socket
		  
		  Return Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MemoryBlockToString(content as Xojo.Core.MemoryBlock) As String
		  if content.Size > 0 then
		    Return CType(content.Data, MemoryBlock).StringValue(0, content.Size)
		  else
		    Break
		    Return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MemoryBlockToText(content as Xojo.Core.MemoryBlock) As Text
		  Return xojo.Core.TextEncoding.UTF8.ConvertDataToText( Content )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SavePictureTo(Extends image as Picture, Destination as FolderItem, Type as FileType, Quality as Integer = 65) As Boolean
		  
		  if image <> Nil then
		    
		    if Destination <> Nil and Destination.IsWriteable then
		      
		      if Type = FileTypeImages.Jpeg then
		        Destination.Name = Destination.NameNoExtension + ".jpg"
		        image.Save( Destination, Picture.SaveAsJPEG, Quality )
		        Return True
		      elseif type = FileTypeImages.Png then
		        Destination.Name = Destination.NameNoExtension + ".png"
		        image.Save( Destination, Picture.SaveAsPNG, Quality )
		        Return True
		      end if
		      
		    else
		      Return False
		    end if
		    
		  else
		    Return False
		  end if
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRequestHeaders(Extends sckt as xojo.Net.HTTPSocket)
		  sckt.RequestHeader("Accept-Language") = "en-US,en;q=0.8,nl-NL;q=0.6,nl;q=0.4"
		  sckt.RequestHeader("X-Requested-With") = "XMLHttpRequest"
		  sckt.RequestHeader("X-Prototype-Version") = "1.7.1"
		  sckt.RequestHeader("DNT") = "1"
		  sckt.RequestHeader("User-Agent") = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17"
		  sckt.RequestHeader("Connection") = "keep-alive"
		  sckt.RequestHeader("Accept") = "text/html,text/javascript,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArrayToStrings(theObjects as Variant) As String()
		  
		  if theObjects <> Nil then
		    dim theStringArray() as string
		    
		    if theObjects.IsArray and theObjects.ArrayElementType = Variant.TypeString then
		      theStringArray = theObjects
		      
		    elseif theObjects.IsArray then
		      dim theVariantArray() as Variant = theObjects
		      for each obj as Variant in theVariantArray
		        theStringArray.Append obj.StringValue
		      next
		      
		    else
		      //
		    end if
		    
		    Return theStringArray
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteBinaryFile(Content as Variant, Destination as FolderItem)
		  
		  if Destination <> Nil and Destination.Parent.Exists and Destination.Parent.IsWriteable then
		    dim bs as BinaryStream
		    bs = BinaryStream.Create( Destination, True )
		    
		    if bs <> Nil then
		      bs.Write( Content )
		      bs.Close
		    end if
		    
		  else
		    log "Couldn't write binary stream"
		  end if
		  
		  
		  Exception err as IOException
		    log "Cannot write binary file: " + str( err.ErrorNumber ) + " :: " + err.Message
		    
		  Exception err as NilObjectException
		    log "Cannot write binary file: " + str( err.ErrorNumber ) + " :: " + err.Message
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pShellHolder() As Shell
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
	#tag EndViewBehavior
End Module
#tag EndModule
