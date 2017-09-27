#tag Window
Begin WindowPro wndHistory
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   593336822
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "#App.kHistory"
   Visible         =   True
   Width           =   600
   Begin CanvasToolbar cvsToolbar
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   48
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -110
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      Begin PushButton btnMagnet
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   ""
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Italic          =   False
         Left            =   56
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -98
         Underline       =   False
         Visible         =   True
         Width           =   24
      End
      Begin PushButton btnFile
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   ""
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Italic          =   False
         Left            =   92
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -98
         Underline       =   False
         Visible         =   True
         Width           =   24
      End
      Begin PushButton btnWebLink
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   ""
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Italic          =   False
         Left            =   128
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -98
         Underline       =   False
         Visible         =   True
         Width           =   24
      End
      Begin Cocoa.NSSearchField srchField
         AcceptFocus     =   False
         AcceptTabs      =   False
         Alignment       =   ""
         AllowsExpansionToolTips=   False
         AutoDeactivate  =   True
         autoresizesSubviews=   False
         Backdrop        =   0
         Bold            =   False
         Description     =   ""
         DoubleBuffer    =   False
         DoubleValue     =   0.0
         Enabled         =   True
         EraseBackground =   True
         FloatValue      =   0.0
         FocusRing       =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         IntegerValue    =   0
         IsFlipped       =   False
         Italic          =   False
         Left            =   430
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaxRecentSearches=   0
         PlaceholderText =   ""
         Scope           =   0
         SendSearchStringImmediately=   False
         SendWholeSearchString=   False
         ShowMenu        =   False
         StringValue     =   ""
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   -98
         Transparent     =   True
         Underlined      =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   150
      End
      Begin PushButton btnShowBrowser
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   ""
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Italic          =   False
         Left            =   394
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -98
         Underline       =   False
         Visible         =   True
         Width           =   24
      End
      Begin PushButton btnRefreshFeeds
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   ""
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -98
         Underline       =   False
         Visible         =   True
         Width           =   24
      End
   End
   Begin SuperListbox lstFeeds
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   24
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   378
      HelpTag         =   ""
      Hierarchical    =   False
      IgnoreChange    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IsFocused       =   False
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaxWidth        =   600
      MinWidth        =   200
      PrefName        =   ""
      RequiresSelection=   False
      Resizable       =   False
      RestoreOnChange =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin SuperListbox lstFeedItems
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
      ColumnsResizable=   False
      ColumnWidths    =   "100%, *"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   32
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   378
      HelpTag         =   ""
      Hierarchical    =   False
      IgnoreChange    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IsFocused       =   False
      Italic          =   False
      Left            =   199
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaxWidth        =   600
      MinWidth        =   200
      PrefName        =   ""
      RequiresSelection=   False
      Resizable       =   False
      RestoreOnChange =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   401
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin HTMLViewerPro WebBrowserView
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   219
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   199
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   2
      Source          =   ""
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   429
      Visible         =   False
      Width           =   401
   End
   Begin Label lblFeedItemCount
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   376
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  'Quit
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructToolbar(Toolbar as NSToolbar) As Boolean
		  
		  // Default toolbar settings
		  Toolbar.AllowsUserCustomization = False
		  Toolbar.AutosavesConfiguration = True
		  Toolbar.DisplayMode = NSToolbar.NSToolbarDisplayMode.NSToolbarDisplayModeIconOnly
		  
		  
		  // This is an array of items identifiers to specify the default items (and order) in toolbar
		  // this template is used the first time the app is launched and for defining the default set in toolbar customization
		  Toolbar.DefaultItems = Array( _
		  btnRefreshFeeds.Name, btnMagnet.Name, btnFile.Name, btnWebLink.Name, NSToolbarFlexibleSpaceItemIdentifier, btnShowBrowser.Name, srchField.Name )
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array ( _
		  _ // Commonly used toolbar items
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  _ // Your toolbar items
		  btnRefreshFeeds.Name, btnMagnet.Name, btnFile.Name, btnWebLink.Name, btnShowBrowser.Name, srchField.Name )
		  
		  
		  // Add toolbar items
		  Toolbar.AddControl( btnRefreshFeeds, Keywords.kRefresh, Keywords.kRefresh )
		  Toolbar.AddControl( btnMagnet, kMagnet, kOpenMagnet ) // Simplified method to add customtoolbar items with controls
		  Toolbar.AddControl( btnFile, kTorrent, kOpenFile ) // Simplified method to add customtoolbar items with controls
		  Toolbar.AddControl( btnWebLink, kWebLink, kOpenWeb ) // Simplified method to add customtoolbar items with controls
		  Toolbar.AddControl( btnShowBrowser, kShowBrowser ) // Simplified method to add customtoolbar items with controls
		  Toolbar.AddControl( srchField, Keywords.kSearch ) // Simplified method to add customtoolbar items with controls
		  
		  'Toolbar.AddButton( "mainAdvanced", NSImage.Advanced, "Advanced", "", "", False )
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  // Check for updates at start-up
		  'if AppSettings.Prefs.Value( "KUCheckForUpdatesAtStartUp", False ) then
		  'AppSettings.CheckForUpdates
		  'end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefFrameName = "wndHistory"
		  self.PrefToolbarName = "NSToolbarHistory"
		  self.BorderBottomThickness = 24
		  self.TitleVisible = False
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub BuildList()
		  lstFeedItems.DeleteAllRows
		  
		  if CurrentHistory <> Nil and CurrentHistory.Count > 0 then
		    for each hash as string in CurrentHistory.Keys
		      dim entry as Dictionary = CurrentHistory.Value(hash)
		      
		      dim title as string = entry.Lookup("title","")
		      
		      if srchField.StringValue <> "" and NOT title.Contains(srchField.StringValue) then
		        Continue
		      else
		        
		        
		        
		        dim magnetURI, FileLink, WebLink as string
		        for each key as string in entry.keys
		          dim TheValue as string = entry.Value(key)
		          dim fileName as string = FileNameFromURL( TheValue )
		          
		          if TheValue.StartsWith("magnet:") then
		            magnetURI = TheValue
		          elseif TheValue.StartsWith("http") and (TheValue.EndsWith(".torrent") or fileName.EndsWith(".torrent"))then
		            FileLink = TheValue
		          elseif TheValue.StartsWith("http") then
		            WebLink = TheValue
		          end if
		        next
		        if entry.HasKey("enclosure") and NOT entry.Lookup("enclosure", "").StringValue.StartsWith("magnet:") then
		          FileLink = entry.Value("enclosure")
		        end if
		        
		        dim pubDate as DatePro
		        if entry.Lookup("pubDate","") <> "" then
		          pubDate = new DatePro
		          pubDate.ISO8601 = entry.Lookup("pubDate","")
		        end if
		        
		        dim downloadDate as DatePro
		        if entry.Lookup("downloaded","") <> "" then
		          downloadDate = new DatePro
		          downloadDate.ISO8601 = entry.Lookup("downloaded","")
		        end if
		        
		        
		        if pubDate <> Nil then
		          lstFeedItems.AddRow title, pubDate.ISO8601, magnetURI, FileLink, WebLink
		        else
		          lstFeedItems.AddRow title, "", magnetURI, FileLink, WebLink
		        end if
		        
		        lstFeedItems.CellTag( lstFeedItems.LastIndex, 1 ) = pubDate
		        'lstFeedItems.RowTag(lstFeedItems.LastIndex) = entry.Lookup
		        
		      end if // @END search
		    next
		  end if
		  
		  lblFeedItemCount.Text = Str( lstFeedItems.LastIndex-1 ) + " Items"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadFeed(FeedHash as String)
		  dim TheHistoryFiles() as FolderItem = HydRaSSCore.HistoryFolder.Items
		  
		  if TheHistoryFiles <> Nil then
		    for each file as FolderItem in TheHistoryFiles
		      if file.NameNoExtension = FeedHash then
		        
		        dim History as new Dictionary
		        
		        if History.LoadXML(file) then
		          // Success!
		          CurrentHistory = History
		          Exit
		          
		        else
		          lstFeedItems.AddRow "Unable to read history of the selected feed."
		        end if
		        
		      end if
		    next
		    
		  else
		    lstFeedItems.AddRow "Unable to read history of the selected feed."
		  end if
		  
		  BuildList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SwitchView()
		  
		  
		  if WebBrowserView.Visible then
		    lstFeedItems.Height = self.Height+2 - 24
		    lstFeedItems.LockBottom = True
		    
		    WebBrowserView.Visible = False
		    WebBrowserView.Top = -1000
		  else
		    if lstFeedItems.ListIndex > -1 and lstFeedItems.Cell( lstFeedItems.ListIndex, 4 ) <> "" then
		      WebBrowserView.LoadURL lstFeedItems.Cell(lstFeedItems.ListIndex,4)
		    end if
		    
		    lstFeedItems.Height = 150
		    lstFeedItems.LockBottom = False
		    
		    WebBrowserView.Top = lstFeedItems.Top + lstFeedItems.Height
		    WebBrowserView.Left = lstFeeds.Left + lstFeeds.Width
		    WebBrowserView.Width = self.Width - WebBrowserView.Left
		    WebBrowserView.Height = self.Height - WebBrowserView.Top - 24
		    
		    WebBrowserView.Visible = True
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentHistory As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ToolbarMain As NSToolbar
	#tag EndProperty


	#tag Constant, Name = kCopyFile, Type = String, Dynamic = True, Default = \"Copy File Link", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Torrent Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer bestands link"
	#tag EndConstant

	#tag Constant, Name = kCopyMagnet, Type = String, Dynamic = True, Default = \"Copy Magnet Link", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Magnet Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer magneet link"
	#tag EndConstant

	#tag Constant, Name = kCopyWeb, Type = String, Dynamic = True, Default = \"Copy Web Link", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Web Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer web link"
	#tag EndConstant

	#tag Constant, Name = kFile, Type = String, Dynamic = False, Default = \"File", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"File"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bestand"
	#tag EndConstant

	#tag Constant, Name = kMagnet, Type = String, Dynamic = True, Default = \"Magnet", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Magnet"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Magneet"
	#tag EndConstant

	#tag Constant, Name = kOpenFile, Type = String, Dynamic = True, Default = \"Download File", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download File"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download bestand"
	#tag EndConstant

	#tag Constant, Name = kOpenMagnet, Type = String, Dynamic = True, Default = \"Open Magnet Link", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Open Magnet Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Open magneet link"
	#tag EndConstant

	#tag Constant, Name = kOpenWeb, Type = String, Dynamic = True, Default = \"Open Web Link", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Open Web Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Open web link"
	#tag EndConstant

	#tag Constant, Name = kShowBrowser, Type = String, Dynamic = True, Default = \"Show Browser", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Browser"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon Browser"
	#tag EndConstant

	#tag Constant, Name = kTorrent, Type = String, Dynamic = True, Default = \"Torrent", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Torrent"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Torrent"
	#tag EndConstant

	#tag Constant, Name = kWebLink, Type = String, Dynamic = True, Default = \"Web Link", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Web Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Web Link"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnMagnet
	#tag Event
		Sub Open()
		  
		  me.Width = 28
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  // button icon
		  #if TargetCocoa then
		    me.Image = toolicon_magnet
		    me.Image.Template = True
		    me.Image.Size = Cocoa.NSMakeSize( 14, 14 )
		  #else
		    me.Caption = "Magnet"
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  if lstFeedItems.ListIndex > -1 then
		    if lstFeedItems.Cell( lstFeedItems.ListIndex, 2 ) <> "" then
		      ShowURL lstFeedItems.Cell( lstFeedItems.ListIndex, 2 )
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnFile
	#tag Event
		Sub Open()
		  
		  me.Width = 28
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  // button icon
		  #if TargetCocoa then
		    me.Image = toolicon_file 'torrentfile
		    me.Image.Template = True
		    me.Image.Size = Cocoa.NSMakeSize( 14, 14 )
		  #else
		    me.Caption = "Magnet"
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  if lstFeedItems.ListIndex > -1 then
		    if lstFeedItems.Cell( lstFeedItems.ListIndex, 3 ) <> "" then
		      ShowURL lstFeedItems.Cell( lstFeedItems.ListIndex, 3 )
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnWebLink
	#tag Event
		Sub Open()
		  
		  me.Width = 28
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  // button icon
		  #if TargetCocoa then
		    me.Image = toolicon_link
		    me.Image.Template = True
		    me.Image.Size = Cocoa.NSMakeSize( 14, 14 )
		  #else
		    me.Caption = "Magnet"
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  if lstFeedItems.ListIndex > -1 then
		    if lstFeedItems.Cell( lstFeedItems.ListIndex, 4 ) <> "" then
		      ShowURL lstFeedItems.Cell( lstFeedItems.ListIndex, 4 )
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events srchField
	#tag Event
		Sub Action()
		  BuildList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnShowBrowser
	#tag Event
		Sub Open()
		  
		  me.Width = 28
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  // button icon
		  #if TargetCocoa then
		    me.Image = toolicon_layout
		    me.Image.Template = True
		    me.Image.Size = Cocoa.NSMakeSize( 14, 14 )
		  #else
		    me.Caption = "Magnet"
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  SwitchView
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRefreshFeeds
	#tag Event
		Sub Open()
		  
		  me.Width = 28
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  // button icon
		  #if TargetCocoa then
		    me.Image = NSImage.RefreshTemplate 'toolicon_layout
		    me.Image.Template = True
		    me.Image.Size = Cocoa.NSMakeSize( 10, 14 )
		  #else
		    me.Caption = "Magnet"
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  HydRaSSCore.CheckNow
		  lstFeeds.ListIndex = lstFeeds.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstFeeds
	#tag Event
		Sub Change()
		  
		  if me.ListIndex > -1 then
		    ReadFeed(me.RowTag(me.ListIndex).StringValue)
		  else
		    lstFeedItems.DeleteAllRows
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim historyFiles() as FolderItem = HydRaSSCore.HistoryFolder.Items
		  dim TheFeeds as Dictionary = HydRaSSCore.RSSFeeds
		  
		  dim HashedFeeds as new Dictionary
		  for each feed as string in TheFeeds.Keys
		    HashedFeeds.Value(feed.StringMD5) = feed
		  next
		  
		  if historyFiles <> Nil and historyFiles.Ubound > -1 then
		    for each file as FolderItem in historyFiles
		      dim FileName as string = file.NameNoExtension
		      dim Feed as string = HashedFeeds.Lookup(FileName, "")
		      dim entry as dictionary = TheFeeds.Lookup(Feed,"")
		      dim FeedName as string = entry.Lookup("name","")
		      
		      me.AddRow FeedName
		      me.RowTag(me.LastIndex) = FileName
		      'Break
		    next
		  end if
		  
		  me.SortedColumn = 0
		  me.ColumnSortDirection(0) = Listbox.SortAscending
		  me.Sort
		  
		  if me.ListCount > 0 then
		    me.ListIndex = 0
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  #if DebugBuild then
		    base.Append New MenuItem( FileMenuItemShowInFinder.LocalizedText )
		    
		    Return True
		  #endif
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  if hitItem <> Nil then
		    
		    Select case hitItem.Text
		      
		    case FileMenuItemShowInFinder.LocalizedText
		      if me.ListIndex > -1 then
		        dim TheFile as FolderItem = HydRaSSCore.HistoryFolder.Child( me.RowTag(me.ListIndex).StringValue + ".plist" )
		        
		        if TheFile <> Nil and TheFile.Exists then
		          TheFile.RevealInFinder
		        else
		          Break
		        end if
		      end if
		      
		    End Select
		    
		    
		    Return True
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lstFeedItems
	#tag Event
		Sub Change()
		  
		  if me.ListIndex > -1 then
		    btnMagnet.Enabled = ( me.Cell( me.ListIndex, 2 ) <> "" )
		    btnFile.Enabled = ( me.Cell( me.ListIndex, 3 ) <> "" )
		    btnWebLink.Enabled = ( me.Cell( me.ListIndex, 4 ) <> "" )
		    
		    if WebBrowserView.Visible = True then
		      if me.Cell( me.ListIndex, 4 ) <> "" then
		        WebBrowserView.LoadURL me.Cell(me.ListIndex,4)
		      else
		        WebBrowserView.LoadURL ""
		      end if
		    end if
		    
		  else
		    btnMagnet.Enabled = False
		    btnFile.Enabled = False
		    btnWebLink.Enabled = False
		    WebBrowserView.LoadURL ""
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  dim MagnetURI, FileURL, WebLink as string
		  MagnetURI = me.Cell(me.ListIndex,2)
		  FileURL = me.Cell(me.ListIndex,3)
		  WebLink = me.Cell(me.ListIndex,4)
		  
		  
		  if MagnetURI <> "" then
		    base.Append new MenuItem(kOpenMagnet)
		  end if
		  if FileURL <> "" then
		    base.Append new MenuItem(kOpenFile) 'Torrent)
		  end if
		  if WebLink <> "" then
		    base.Append new MenuItem(kOpenWeb)
		  end if
		  
		  if MagnetURI <> "" OR FileURL <> "" or WebLink <> "" then
		    base.Append new MenuItem("-")
		  end if
		  
		  if MagnetURI <> "" then
		    base.Append new MenuItem(kCopyMagnet)
		  end if
		  if FileURL <> "" then
		    base.Append new MenuItem(kCopyFile) 'Torrent)
		  end if
		  if WebLink <> "" then
		    base.Append new MenuItem(kCopyWeb)
		  end if
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  dim c as new Clipboard
		  
		  if hitItem <> Nil then
		    
		    Select case hitItem.Text
		      
		    case kOpenMagnet
		      ShowURL me.Cell( me.ListIndex, 2 )
		    case kOpenFile 'kOpenTorrent
		      ShowURL me.Cell( me.ListIndex, 3 )
		    case kOpenWeb
		      ShowURL me.Cell( me.ListIndex, 4 )
		      
		    case kCopyMagnet
		      c.Text = me.Cell( me.ListIndex, 2 )
		    case kCopyFile 'kCopyTorrent
		      c.Text = me.Cell( me.ListIndex, 3 )
		    case kCopyWeb
		      c.Text = me.Cell( me.ListIndex, 4 )
		      
		    End Select
		    
		    Return True
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  
		  if row > -1 and column = 0 then
		    dim FeedItemDate as String
		    dim LineOneTop as Integer = g.TextAscent + (g.Height/2) - (g.TextHeight/2)
		    
		    dim PubDate as DatePro = me.CellTag( row, 1 )
		    
		    if PubDate <> Nil then
		      PubDate.GMTOffset = DatePro.LocalGMTOffset
		      if PubDate.isWithinDays(1) then
		        FeedItemDate = PubDate.ShortTime
		      else
		        FeedItemDate = PubDate.AbbreviatedDate
		      end if
		    end if // @END PubDate <> Nil
		    
		    dim PubDateWidth as Integer = g.StringWidth(FeedItemDate)
		    dim Padding as Integer = 4
		    
		    g.Bold = me.Selected(row)
		    
		    // Draw Title
		    g.DrawString me.Cell(row, column), Padding, LineOneTop, g.Width - Padding*4 - PubDateWidth, True
		    
		    // Draw date
		    if NOT me.Selected(row) then
		      'g.Bold = True
		      g.ForeColor = HSL(211, 97, 58)
		    end if
		    g.DrawString FeedItemDate, g.Width - Padding*2 - PubDateWidth, LineOneTop
		    
		    Return True
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key as String) As Boolean
		  
		  if key = " " then
		    Return True
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  if key = " " then
		    SwitchView
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
