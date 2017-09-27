#tag Window
Begin WindowPro wndPreferences
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   550
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   593336822
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "#MenuItemPreferences.LocalizedText"
   Visible         =   True
   Width           =   600
   Begin PagePanel ppPrefs
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   550
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin Separator sepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppPrefs"
         Left            =   268
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   485
         Visible         =   False
         Width           =   64
      End
      Begin Separator sepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppPrefs"
         Left            =   268
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   124
         Visible         =   False
         Width           =   64
      End
      Begin SuperListbox lstFeeds
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   3
         ColumnsResizable=   False
         ColumnWidths    =   "150, 150, *"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   24
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   150
         HelpTag         =   ""
         Hierarchical    =   False
         IgnoreChange    =   False
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         InitialValue    =   "#kRSSFeeds"
         IsFocused       =   False
         Italic          =   False
         Left            =   20
         LockBottom      =   False
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
         SelectionType   =   1
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   20
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   560
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      BeginSegmented AddRemoveButton btnAddRemove
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacControlStyle =   6
         RemoveEnabled   =   False
         Scope           =   2
         Segments        =   "+\n\nFalse\r-\n\nFalse"
         SelectionType   =   2
         TabPanelIndex   =   1
         Top             =   182
         Visible         =   True
         Width           =   48
      End
      Begin LabelFor lblArrayFor
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kDownloadsFolder"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin ccBrowsePath ccBrowseDownloadsPath
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         pDialogPrompt   =   ""
         pDialogTitle    =   ""
         pFolderIcon     =   0
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   218
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
      End
      Begin PreferenceCheckbox chkAutomaticUpdates
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kCheckboxAutomaticUpdates"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "KUCheckForUpdatesAtStartUp"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   201
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   84
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   379
      End
      Begin PreferenceTextField edtInterval
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "CheckInterval"
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "###"
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "30"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   410
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin LabelFor lblArrayFor
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kInterval"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   411
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   243
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Keywords.TimesAndDates.time_Minutes"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   411
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin UpDownArrows udInterval
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Left            =   218
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   410
         Visible         =   True
         Width           =   13
      End
      Begin PreferenceCheckbox chkOrganizeByFeed
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kOrganizeInFoldersByFeedTag"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "OrganizeByFeedTag"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   250
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   300
      End
      Begin PreferenceCheckbox chkPreferMagnets
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kPreferMagnets"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "PreferMagnets"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   282
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   300
      End
      Begin PreferenceCheckbox chkShowNotifications
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kShowNotifications"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "ShowNotifications"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   201
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   20
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   379
      End
      BeginSegmented SegmentedControl segExpImp
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Left            =   529
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacControlStyle =   6
         Scope           =   2
         Segments        =   "Import\n\nFalse\rExport\n\nFalse"
         SelectionType   =   2
         TabPanelIndex   =   1
         Top             =   182
         Visible         =   True
         Width           =   48
      End
      Begin CheckBox chManageLoginItem
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAddLoginItem"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   201
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   52
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   379
      End
      Begin PreferenceCheckbox chkAutoOpen
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAutoOpen"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "AutoOpen"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   314
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   379
      End
      Begin PreferenceCheckbox chkPrefixLinkType
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kPrefixLinkType"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "PrefixLinkType"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   1
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   346
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   379
      End
      Begin PreferenceCheckbox chkPrefixFeedTag
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kPrefixFeedTag"
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "PrefixFeedTag"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         State           =   0
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   378
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   379
      End
      Begin LabelFor lblArrayFor
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kShow"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   445
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin PreferenceTextField edtRecentCount
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultsName    =   "RecentCount"
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   182
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "###"
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   16
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "30"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   444
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin UpDownArrows udRecentItems
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Left            =   218
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   444
         Visible         =   True
         Width           =   13
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   243
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kRecentItems"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   445
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   337
      End
   End
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -100
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      BeginSegmented SegmentedControl segNavigation
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "cvsToolbar"
         Left            =   200
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MacControlStyle =   0
         Scope           =   2
         Segments        =   "#Keywords.kGeneral\n\nTrue\r#Keywords.kAdvanced\n\nFalse"
         SelectionType   =   0
         TabPanelIndex   =   0
         Top             =   -88
         Visible         =   True
         Width           =   200
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  HydRaSSCore.StartTimer
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructToolbar(Toolbar as NSToolbar) As Boolean
		  Toolbar.AllowsUserCustomization = False
		  Toolbar.DisplayMode = NSToolbar.NSToolbarDisplayMode.NSToolbarDisplayModeIconAndLabel
		  'Toolbar.AutosavesConfiguration = True
		  
		  // This is an array of items identifiers to specify the default items (and order) in toolbar
		  // this template is used the first time the app is launched and for defining the default set in toolbar customization
		  Toolbar.DefaultItems = Array( _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  "PrefsGeneral", _
		  "PrefsAdvanced", _
		  NSToolbarFlexibleSpaceItemIdentifier )
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array( _
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _  
		  _ 'NSToolbarShowFontsItemIdentifier, _
		  _ 'NSToolbarShowColorsItemIdentifier, _
		  _ 'NSToolbarPrintItemIdentifier, _
		  _
		  "PrefsGeneral", _
		  "PrefsAdvanced" )
		  
		  // This (optional) array define the items which allows selection (as in Preferences panel often is used)
		  Toolbar.SelectableItems = array( _
		  "PrefsGeneral", _
		  "PrefsAdvanced")
		  
		  // Add toolbar button items using simplified extensions
		  Toolbar.AddButton( "PrefsGeneral", NSImage.PreferencesGeneral, Keywords.kGeneral ) // ( Unique Identifier, Button image, toolbar label )
		  Toolbar.AddButton( "PrefsAdvanced", NSImage.Advanced, Keywords.kAdvanced )
		  
		  // Since we want a couple of selecable toolbar buttons
		  // Select one as a starting point
		  Toolbar.SelectedItemIdentifier = AppSettings.Prefs.Value( "LastPrefSelection", "PrefsGeneral" )
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  if AppSettings.Prefs.Value( "KUCheckForUpdatesAtStartUp", False ) then
		    AppSettings.CheckForUpdates
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefFrameName = "wndPreferences"
		  self.PrefToolbarName = "PreferencesToolbar"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  dim index as Integer
		  
		  Select case Identifier
		  case "prefsGeneral"
		    PanelFlipper( 0 )
		  case "prefsAdvanced"
		    PanelFlipper( 1 )
		  End Select
		  
		  AppSettings.Prefs.Value( "LastPrefSelection" ) = Identifier
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddListItem()
		  dim URL as string
		  dim c as new Clipboard
		  if c <> Nil then
		    URL = c.Text
		  end if
		  
		  
		  if URL.StartsWith("http") then
		    lstFeeds.AddRow URLHost( URL ), "", URL
		    SaveList()
		    lstFeeds.EditCell( lstFeeds.LastIndex, 0 )
		  else
		    lstFeeds.AddRow "", "", ""
		    SaveList
		    lstFeeds.EditCell( lstFeeds.LastIndex, 2 )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExportFeeds()
		  
		  if lstFeeds.LastIndex > -1 then
		    
		    dim Feeds as new Dictionary
		    Feeds.Value("Created by " + AppSettings.kAppName) = AppSettings.PrettyVersion
		    
		    dim entries as new Dictionary
		    for row as Integer = 0 to lstFeeds.LastIndex
		      dim entry as new Dictionary
		      entry.Value("name") = lstFeeds.Cell(row,0)
		      entry.Value("tag") = lstFeeds.Cell(row,1)
		      entry.Value("url") = lstFeeds.Cell(row,2)
		      
		      'entries.Append entry
		      entries.Value( row ) = entry
		    next
		    
		    Feeds.Value("items") = entries
		    
		    
		    Dim dlg as New SaveAsDialog
		    Dim f as FolderItem
		    'dlg.InitialDirectory=SpecialFolder.Documents
		    'dlg.promptText="Prompt Text"
		    dlg.SuggestedFileName="Exported feeds.plist"
		    'dlg.Title="Title Property"
		    'dlg.Filter=FileTypes1.Text  //defined as a file type in FileTypes1 file type set
		    f=dlg.ShowModal()
		    If f <> Nil then
		      
		      if Feeds.SaveXML(f,True) then
		        // file saved
		      else
		        // Something went wrong
		        Break
		      End If
		      
		    Else
		      //user canceled
		    End if
		    
		  else
		    // No feeds to export
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ImportFeeds()
		  dim existingFeeds() as string
		  for row as Integer = 0 to lstFeeds.LastIndex
		    existingFeeds.Append lstFeeds.Cell(row,2)
		  next
		  
		  
		  Dim dlg As OpenDialog
		  Dim f As FolderItem
		  dlg = New OpenDialog
		  
		  dlg.Title = "Select a feeds file"
		  'dlg.Filter = FileTypes1.Text  // "text/plain" file type defined in FileTypes1 set
		  dlg.Filter = PlistFile.PlistPlain
		  f = dlg.ShowModal
		  If f <> Nil Then
		    //proceed normally
		    dim feeds as new Dictionary
		    if feeds.LoadXML(f) then
		      
		      if feeds <> Nil and feeds.HasKey("Created by " + AppSettings.kAppName) and feeds.HasKey("items") then
		        dim entries as Dictionary = feeds.Lookup("items",Nil)
		        
		        if entries <> Nil and entries.Count > 0 then
		          for each key as string in entries.Keys
		            dim entry as Dictionary = entries.Value(key)
		            
		            dim name, tag, url as string
		            name = entry.Lookup("name","")
		            tag = entry.Lookup("tag","")
		            url = entry.Lookup("url", "")
		            
		            if NOT existingFeeds.Contains(url) then
		              lstFeeds.AddRow name, tag, url
		            else
		              // Skip
		              dim s as string = "Already in feedlist"
		            end if
		          next
		        End If
		        
		        
		      else
		        MsgBox "Invalid file"
		      end if
		      
		      
		    else
		      MsgBox "Couldn't load feeds File"
		    End If
		    
		    SaveList
		    
		  Else
		    //User Cancelled
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PanelFlipper(Index as Integer, Smooth as boolean = True)
		  // First hide the page panel, do the resize, flip the panel and then show it again, should be easier on the system and eyes.
		  ppPrefs.Visible = False
		  
		  #if TargetMacOS then
		    if Smooth then
		      self.SmoothResize( self.Width, sepArray( index ).top )
		    else
		      self.Height = sepArray( Index ).Top
		    end if
		  #else
		    #Pragma Unused Smooth
		    self.Height = sepArray( index ).Top
		  #endif
		  
		  ppPrefs.Value = Index
		  ppPrefs.Visible = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveListItem()
		  
		  if lstFeeds.SelCount > 0 then
		    for row as Integer = lstFeeds.LastIndex DownTo 0
		      if lstFeeds.Selected(row) then
		        lstFeeds.RemoveRow(row)
		      end if
		    next
		  end if
		  
		  SaveList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveList()
		  'dim TheFeeds as new Dictionary
		  'for row as Integer = 0 to lstFeeds.LastIndex
		  'TheFeeds.Value( lstFeeds.Cell( row, 2 ) ) = lstFeeds.Cell( row, 0 )
		  'next
		  'HydRaSSCore.RSSFeedsDictionary = TheFeeds
		  
		  
		  'Dim TheFeedURLs() as string
		  'for row as Integer = 0 to lstFeeds.LastIndex
		  'TheFeedURLs.Append lstFeeds.Cell(row,0)
		  'next
		  '
		  'HydRaSSCore.RSSFeeds = TheFeedURLs
		  
		  dim TheFeeds as new Dictionary
		  
		  for row as Integer = 0 to lstFeeds.LastIndex
		    dim entry as new Dictionary
		    entry.Value("name") = lstFeeds.Cell(row,0)
		    entry.Value("tag") = lstFeeds.Cell(row,1)
		    entry.Value("url") = lstFeeds.Cell(row,2)
		    
		    if entry.Lookup("url","") <> "" then
		      TheFeeds.Value(entry.Value("url")) = entry
		    end if
		  next
		  
		  HydRaSSCore.RSSFeeds = TheFeeds 'AppSettings.Prefs.Value("AllRSSFeeds") = TheFeeds
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ToolbarPrefs As NSToolbar
	#tag EndProperty


	#tag Constant, Name = kAddLoginItem, Type = String, Dynamic = True, Default = \"Start ViBroadCatcher on system startup", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Start ViBroadCatcher on system startup"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"ViBroadCatcher starten bji het opstarten van het systeem"
	#tag EndConstant

	#tag Constant, Name = kAutoOpen, Type = String, Dynamic = False, Default = \"Open torrent && magnet files automatically", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Open torrent && magnet files automatically"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Open torrent && magneet bestanden automatisch"
	#tag EndConstant

	#tag Constant, Name = kCheckboxAutomaticUpdates, Type = String, Dynamic = True, Default = \"Automatically Check For Updates", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Automatically Check For Updates"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Automatisch zoeken naar updates"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kontrollera uppdateringar automatiskt"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Automatisch nach Updates suchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V\xC3\xA9rifier automatiquement les mises \xC3\xA0 jours"
	#tag EndConstant

	#tag Constant, Name = kDownloadsFolder, Type = String, Dynamic = True, Default = \"Save to", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Save to"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bewaar naar"
	#tag EndConstant

	#tag Constant, Name = kExport, Type = String, Dynamic = True, Default = \"Export", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Export"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Exporteer"
	#tag EndConstant

	#tag Constant, Name = kHelpImportExport, Type = String, Dynamic = True, Default = \"Import / Export feeds", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Import / Export feeds"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Importeer / Exporteer feeds"
	#tag EndConstant

	#tag Constant, Name = kImport, Type = String, Dynamic = True, Default = \"Import", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Import"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Importeer"
	#tag EndConstant

	#tag Constant, Name = kInterval, Type = String, Dynamic = False, Default = \"Check every", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Check every"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Controleer elke"
	#tag EndConstant

	#tag Constant, Name = kOrganizeInFoldersByFeedTag, Type = String, Dynamic = False, Default = \"Organize in folders by feed tag", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Organize in folders by feed tag"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Organiseer in mappen op feed label"
	#tag EndConstant

	#tag Constant, Name = kPreferMagnets, Type = String, Dynamic = True, Default = \"Prefer magnet links", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Prefer magnet links"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Voorkeur geven aan magneet linken"
	#tag EndConstant

	#tag Constant, Name = kPrefixFeedTag, Type = String, Dynamic = True, Default = \"Prefix file name with feed tag", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Prefix file name with feed tag"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Prefix bestandsnaam met feed label"
	#tag EndConstant

	#tag Constant, Name = kPrefixLinkType, Type = String, Dynamic = True, Default = \"Prefix file name with link type", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Prefix file name with link type"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Prefix bestandsnaam met link type"
	#tag EndConstant

	#tag Constant, Name = kRecentItems, Type = String, Dynamic = True, Default = \"Recent links", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Recent links"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Recente links"
	#tag EndConstant

	#tag Constant, Name = kRSSFeeds, Type = String, Dynamic = True, Default = \"Feed Name\tTag\tURL", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Feed Name\tTag\tURL"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Feed Naam\tLabel\tURL"
	#tag EndConstant

	#tag Constant, Name = kShow, Type = String, Dynamic = False, Default = \"Show", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon"
	#tag EndConstant

	#tag Constant, Name = kShowNotifications, Type = String, Dynamic = True, Default = \"Show Notifications", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show notifications"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon meldingen"
	#tag EndConstant


#tag EndWindowCode

#tag Events ppPrefs
	#tag Event
		Sub Open()
		  
		  select case AppSettings.Prefs.Value( "LastPrefSelection", "PrefsGeneral" )
		  case "PrefsGeneral"
		    PanelFlipper( 0 )
		  case "PrefsAdvanced"
		    PanelFlipper( 1 )
		  end select
		  
		  
		  #if NOT TargetMacOS then
		    dim navigationItem as SegmentedControlItem = segNavigation.Items(me.Value)
		    navigationItem.Selected = True
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstFeeds
	#tag Event
		Sub Change()
		  btnAddRemove.RemoveEnabled = me.SelCount > 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.ColumnType(0) = ListBox.TypeEditableTextField
		  me.ColumnType(1) = Listbox.TypeEditableTextField
		  me.ColumnType(2) = Listbox.TypeEditableTextField
		  
		  me.AcceptTextDrop
		  
		  lstFeeds.DeleteAllRows
		  
		  dim RSSFeeds as Dictionary = HydRaSSCore.RSSFeeds 'AppSettings.Prefs.Value("AllRSSFeeds", Nil)
		  if RSSFeeds <> Nil then
		    for each key as string in RSSFeeds.Keys
		      dim entry as Dictionary = RSSFeeds.Value(key)
		      
		      lstFeeds.AddRow entry.Lookup("name",""), entry.Lookup("tag",""), entry.Lookup("url","")
		    next
		  end if
		  
		  me.SortedColumn = 0
		  me.ColumnSortDirection(0) = Listbox.SortAscending
		  me.Sort
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  SaveList()
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  
		  if obj <> Nil then
		    if obj.TextAvailable then
		      me.AddRow URLHost( obj.Text ), obj.Text
		    end if
		  end if // @END obj <> Nil
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key as String) As Boolean
		  
		  if me.SelCount > 0 then
		    
		    // Remove item
		    if Keyboard.AsyncCommandKey and Keyboard.AsyncKeyDown( &h33 ) then // Cmd + Del
		      RemoveListItem
		      Return True
		    end if
		    
		    // Reveal folder
		    if Keyboard.AsyncCommandKey and Keyboard.AsyncShiftKey and key = "r" then 'Keyboard.AsyncKeyDown(&h1F) then // Cmd + Shift + R
		      dim TheFolder as FolderItem = ccBrowseDownloadsPath.pFolderItem
		      dim category as string = me.Cell( me.ListIndex, 1 )
		      if category <> "" and TheFolder <> Nil and TheFolder.Exists and TheFolder.Child( category ).Exists then
		        TheFolder.Child(category).Launch
		      end if
		      'dim TheFolder as FolderItem = GetFolderItem( me.Cell(me.ListIndex, 1), FolderItem.PathTypeShell )
		      'if TheFolder <> Nil and TheFolder.Exists then
		      'TheFolder.RevealInFinder
		      'end if
		    end if
		    
		  end if // @END me.ListIndex >-1
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddRemove
	#tag Event
		Sub ActionAdd()
		  AddListItem
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionRemove()
		  RemoveListItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccBrowseDownloadsPath
	#tag Event
		Sub Open()
		  me.SetFolderItem( HydRaSSCore.DownloadsFolder )
		End Sub
	#tag EndEvent
	#tag Event
		Sub FolderChanged(TheFolderItem as FolderItem)
		  HydRaSSCore.DownloadsFolder = TheFolderItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtInterval
	#tag Event
		Sub TextChange()
		  if val( me.Text ) < 5 then
		    me.Text = "5"
		    'MsgBox AppSettings.Prefs.Value("CheckInterval",30)
		    AppSettings.Prefs.Value("CheckInterval") = 5  
		    'MsgBox AppSettings.Prefs.Value("CheckInterval",30)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udInterval
	#tag Event
		Sub Down()
		  if val( edtInterval.Text ) > 5 then
		    edtInterval.Text = Str( Val( edtInterval.Text ) -1 )
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  edtInterval.Text = Str( Val( edtInterval.Text ) +1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events segExpImp
	#tag Event
		Sub Open()
		  'self.SegmentStyle = SegmentedControlExtension.NSSegmentStyle.SmallSquare
		  
		  me.HelpTag = kHelpImportExport
		  
		  #if TargetMacOS then
		    me.LabelForSegment(0) = ""
		    me.ImageForSegment(0) = import 'NSImage.ShareTemplate 'AddTemplate
		    me.ImageForSegment(0).Template = True
		    me.ImageForSegment(0).Size = Cocoa.NSMakeSize( 16, 16 )
		    
		    me.LabelForSegment(1) = ""
		    me.ImageForSegment(1) = export 'NSImage.ShareTemplate 'NSImage.RemoveTemplate
		    me.ImageForSegment(1).Template = True  
		    me.ImageForSegment(1).Size = Cocoa.NSMakeSize( 16, 16 )
		  #else
		    
		    
		    me.Width = 150
		    me.Left = lstFeeds.Left + lstFeeds.Width - me.Width
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(itemIndex as integer)
		  
		  Select case itemIndex
		  case 0
		    ImportFeeds
		  case 1
		    ExportFeeds
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chManageLoginItem
	#tag Event
		Sub Action()
		  
		  if me.Value then
		    Applescripts.CreateLogin(App.ApplicationBundle.NameNoExtension, App.ApplicationBundle.NativePath)
		  else
		    Applescripts.RemoveLogin(App.ApplicationBundle.NameNoExtension)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim loginItems() as string = Applescripts.LoginItems
		  dim AppName as string = App.ApplicationBundle.NameNoExtension
		  if loginItems.Contains(App.ApplicationBundle.NameNoExtension) then
		    me.Value = True
		  else
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtRecentCount
	#tag Event
		Sub TextChange()
		  if val( me.Text ) < 5 then
		    me.Text = "5"
		    'MsgBox AppSettings.Prefs.Value("RecentCount",30)
		    AppSettings.Prefs.Value("RecentCount") = 5  
		    'MsgBox AppSettings.Prefs.Value("RecentCount",30)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udRecentItems
	#tag Event
		Sub Down()
		  if val( edtRecentCount.Text ) > 5 then
		    edtRecentCount.Text = Str( Val( edtRecentCount.Text ) -1 )
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  edtRecentCount.Text = Str( Val( edtRecentCount.Text ) +1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events segNavigation
	#tag Event
		Sub Action(itemIndex as integer)
		  PanelFlipper( itemIndex )// Resize before flipping panels for better experience
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
