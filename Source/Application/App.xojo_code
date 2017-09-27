#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  Prefs.Sync
		  
		  NSStatusBar.SystemStatusBar.RemoveStatusItem(HydRaStatus) // Remove status item
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  HelpDebug.Visible = Keyboard.AsyncAltKey
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  AppSettings.AppInitialize
		  CreateStatusItem
		  HydRaSSCore.StartTimer
		  
		  if AppSettings.Prefs.Value("FirstBoot",True) then
		    wndPreferences.Show
		    #if TargetMacOS then
		      NSApplication.App.Activate(True)
		    #endif
		    AppSettings.Prefs.Value("FirstBoot") = False
		  else
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Return AppSettings.HandleError( error, "Unknown (caught at app level)" )
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CreateStatusItem()
		  
		  #if TargetMacOS then
		    dim bar as NSStatusBar = NSStatusBar.SystemStatusBar
		    HydRaStatus = bar.CreateStatusItem(NSStatusBar.NSVariableStatusItemLength, AddressOf StatusItemHandler)
		    
		    UpdateStatusIcon(False)
		    'dim statusIcon as NSImage
		    'statusIcon = catcherbutton
		    'statusIcon.Template = True
		    'statusIcon.Size = Cocoa.NSMakeSize( 16, 16 )
		    
		    HydRaStatus.HighlightMode = True
		    'HydRaStatus.Image = statusIcon
		    HydRaStatus.ToolTip = AppSettings.kAppName + " " + AppSettings.PrettyVersion
		    
		    // Create 'Last Update:" menu
		    if MenuLastChecked = Nil then
		      MenuLastChecked = New NSMenuItem
		      MenuLastChecked.Title = kLastUpdate + " - "
		    end if
		    
		    // Create Timer Status menu
		    MenuTimerStatus = New NSMenuItem
		    MenuTimerStatus.Title = kPause
		    
		    'MenuRecentFeedItems = New NSMenuItem
		    'MenuRecentFeedItems.Title = kRecentItems
		    
		    dim mmenu as new NSMenu
		    call mmenu.Append(kCheckNow) // Check Now
		    call mmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		    call mmenu.Append(MenuLastChecked) // Last Update: 00:00
		    call mmenu.Append(MenuTimerStatus) // Timer Status  
		    call mmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		    call mmenu.Append(kRecentItems) // Recent
		    call mmenu.Append(kMarkAsRead) // Mark as Read  
		    call mmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		    call mmenu.Append(kFeedReader) // Feed Reader
		    call mmenu.Append(kFeedFolder) // Open feeds folder
		    call mmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		    call mmenu.Append(MenuItemHelpMenu.LocalizedText) // Help >
		    call mmenu.Append(MenuItemPreferences.LocalizedText) // Preferences
		    call mmenu.Append(kFileQuit) // Quit
		    
		    // Add help menu
		    mmenu.ItemWithTitle(MenuItemHelpMenu.LocalizedText).Submenu = HelpMenu  
		    mmenu.ItemWithTitle(kRecentItems).Submenu = RecentMenu
		    
		    
		    HydRaStatus.Menu = mmenu
		    MenuLastChecked.Enabled = False
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HelpMenu() As NSMenu
		  dim hmenu as New NSMenu
		  hmenu.Title = MenuItemHelpMenu.LocalizedText
		  
		  #if DebugBuild or false then
		    call hmenu.Append("Debug") // Debug
		    call hmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		  #endif
		  call hmenu.Append(MenuItemCheckForUpdates.LocalizedText)
		  call hmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		  call hmenu.Append(HelpMenuItemSendFeedback.LocalizedText)
		  call hmenu.Append(HelpMenuItemVisitWebsite.LocalizedText)
		  call hmenu.Append(MenuItemDonate.LocalizedText)
		  call hmenu.Append(NSMenuItem.CreateSeparatorItem) // -
		  call hmenu.Append(MenuItemAbout.LocalizedText)
		  
		  
		  Return hmenu
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RecentMenu() As NSMenu
		  dim rmenu as New NSMenu
		  rmenu.Title = kRecentItems
		  
		  'rmenu.RemoveAll
		  dim today as New DatePro
		  RecentFeeditems = new Dictionary
		  
		  'dim RecentFeeditems as Dictionary = 
		  RecentFeeditems = HydRaSSCore.GatherArticlesChronologically
		  
		  if RecentFeeditems <> Nil and RecentFeeditems.Count > 0 then
		    for each key as string in RecentFeeditems.Keys
		      dim entry as Dictionary = RecentFeeditems.Value(key)
		      
		      dim title as string = entry.Lookup("title","")
		      dim link as string = entry.Lookup("link","")
		      dim feedname as string = entry.Lookup("feedname","")
		      dim TheDate as string
		      
		      dim pubDate as DatePro = entry.Lookup("date",Nil)
		      if pubDate <> Nil then
		        pubDate.GMTOffset = DatePro.LocalGMTOffset
		        if pubDate.Year = today.Year and pubDate.Month = today.Month and pubDate.Day = today.Day then
		          TheDate = pubDate.ShortTime
		        else
		          TheDate = pubDate.ShortDate
		        end if
		      end if
		      
		      dim menutitle as string = TheDate + " [" + feedname + "]" + " :: " + title
		      
		      dim msitem as new NSMenuItem
		      msitem.Title = menutitle
		      msitem.Tag = 15
		      msitem.ToolTip = link
		      
		      call rmenu.Append(msitem)
		    next
		  else
		    call rmenu.Append( Keywords.kNotAvailable ) '"N/A" )
		  end if
		  
		  
		  Return rmenu
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTimerStatus()
		  
		  if HydRaSSCore.TheTimer.Mode = xojo.core.Timer.Modes.Off then
		    HydRaSSCore.StartTimer
		    MenuTimerStatus.Title = kPause
		  else
		    HydRaSSCore.PauzeTimer
		    MenuTimerStatus.Title = kResume
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StatusItemHandler(hitItem as NSMenuItem)
		  
		  if hitItem <> Nil then
		    if hitItem.Tag = 15 and hitItem.ToolTip <> "" then
		      ShowURL hitItem.ToolTip
		      
		    else
		      Select case hitItem.Title
		        
		      case kCheckNow
		        HydRaSSCore.CheckNow
		        
		      case kResume, kPause
		        SetTimerStatus
		        
		      case "Debug"
		        wndDebug.Show
		        NSApplication.App.Activate(True)
		        
		      case kFeedReader 'kHistory
		        wndHistory.Show
		        NSApplication.App.Activate(True)
		        
		      case kFeedFolder
		        HydRaSSCore.DownloadsFolder.Launch
		        
		      case kMarkAsRead
		        HasNewItems = False
		        HydRaSSCore.MarkNew(False)
		        
		      case MenuItemPreferences.LocalizedText
		        wndPreferences.Show
		        NSApplication.App.Activate(True)
		        
		      case kFileQuit
		        Quit
		        
		        // Check for Updates
		      case MenuItemCheckForUpdates.LocalizedText
		        AppSettings.CheckForUpdates
		        NSApplication.App.Activate(True)
		        
		      case HelpMenuItemSendFeedback.LocalizedText
		        'ShowURL "mailto:vimediamanager@gmail.com"
		        wndFeedback.Show
		        NSApplication.App.Activate(True)
		        
		      case HelpMenuItemVisitWebsite.LocalizedText
		        ShowURL AppSettings.kWebsiteURL
		        
		      case MenuItemDonate.LocalizedText
		        ShowURL AppSettings.kDonationURL
		        
		        
		      case MenuItemAbout.LocalizedText
		        wndAbout.Show
		        NSApplication.App.Activate(True)
		        
		      End Select
		      
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateLastChecked()
		  if MenuLastChecked = Nil then
		    MenuLastChecked = New NSMenuItem
		  end if
		  
		  MenuLastChecked.Enabled = False
		  dim d as new DatePro
		  MenuLastChecked.Title = kLastUpdate + " " + d.ShortTime
		  MenuLastChecked.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRecentMenu()
		  
		  // Populate recent feed items menu
		  dim mmenu as NSMenu = HydRaStatus.Menu
		  mmenu.ItemWithTitle(kRecentItems).Submenu = RecentMenu
		  HydRaStatus.Menu = mmenu
		  'HydRaStatus.Menu.ItemWithTitle(kRecentItems).Submenu = RecentMenu
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateStatusIcon(Active as Boolean = False)
		  
		  #if TargetMacOS then
		    
		    dim TheStatusImage as NSImage
		    
		    dim TheToolTip as String = AppSettings.kAppName + " " + AppSettings.PrettyVersion
		    // Last checked
		    if MenuLastChecked <> Nil then
		      TheToolTip = TheToolTip + EndOfLine + MenuLastChecked.Title
		    else
		      TheToolTip = TheToolTip + EndOfLine + kLastUpdate + " -"
		    end if
		    
		    if Active then
		      TheStatusImage = catcherfeed
		      TheToolTip = TheToolTip + EndOfLine + kNewItemsAvailable
		    else
		      TheStatusImage = catcherbutton
		      TheToolTip = TheToolTip + EndOfLine + kNoNewItemsAvailable
		    end if
		    
		    HydRaStatus.ToolTip = TheToolTip
		    TheStatusImage.Template = True
		    TheStatusImage.Size = Cocoa.NSMakeSize(16,16)
		    
		    App.HydRaStatus.Image = TheStatusImage
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HasNewItems As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		HydRaStatus As NSStatusItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MenuLastChecked As NSMenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MenuTimerStatus As NSMenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RecentFeeditems As Dictionary
	#tag EndProperty


	#tag Constant, Name = kCheckNow, Type = String, Dynamic = True, Default = \"Check Now", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Check Now"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Controleer Nu"
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFeedFolder, Type = String, Dynamic = True, Default = \"Open Feeds Folder", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Open Feeds Folder"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Open feeds map"
	#tag EndConstant

	#tag Constant, Name = kFeedReader, Type = String, Dynamic = True, Default = \"Feed Reader", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Feed Reader"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Feed lezer"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quit"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Afsluiten"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kHistory, Type = String, Dynamic = True, Default = \"History", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"History"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Historie"
	#tag EndConstant

	#tag Constant, Name = kLastUpdate, Type = String, Dynamic = False, Default = \"Last Update:", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Last Update:"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Laatste Update:"
	#tag EndConstant

	#tag Constant, Name = kMarkAsRead, Type = String, Dynamic = True, Default = \"Mark as Read", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Mark as Read"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Markeer als gelezen"
	#tag EndConstant

	#tag Constant, Name = kNewItemsAvailable, Type = String, Dynamic = True, Default = \"New items available", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New items available"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuwe artikelen beschikbaar"
	#tag EndConstant

	#tag Constant, Name = kNoNewItemsAvailable, Type = String, Dynamic = True, Default = \"No new items available", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No new items available"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen nieuwe artikelen beschikbaar"
	#tag EndConstant

	#tag Constant, Name = kPause, Type = String, Dynamic = True, Default = \"Pause", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Pause"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Pauzeer"
	#tag EndConstant

	#tag Constant, Name = kRecentItems, Type = String, Dynamic = True, Default = \"Recent", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Recent"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Recent"
	#tag EndConstant

	#tag Constant, Name = kResume, Type = String, Dynamic = True, Default = \"Resume", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Resume"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Doorgaan"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="HasNewItems"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
