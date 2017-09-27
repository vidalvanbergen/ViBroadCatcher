#tag Window
Begin ContainerControl ccBrowsePath
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   22
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   300
   Begin Label lblName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "..."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   208
   End
   Begin PushButton btnBrowse
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kBrowse"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   220
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  base.Append New MenuItem( FileMenuItemShowInFinder.LocalizedText, "ShowInFinder" )
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  if hitItem <> Nil then
		    
		    Select case hitItem.Text
		      
		      // Reveal in finder
		    case FileMenuItemShowInFinder.LocalizedText
		      if pFolderItem <> Nil and pFolderItem.Exists then
		        pFolderItem.RevealInFileBrowser
		      end if
		      
		      //
		      
		    End Select
		    
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim lblWidth as Integer = self.Width - btnBrowse.Width - 10
		  
		  #if TargetMacOS then
		    lblName.Width = lblWidth - 22
		    lblName.Left = 22
		  #else
		    lblName.Width = lblWidth
		    lblName.Left = 0
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  #if TargetMacOS then
		    if pFolderItem <> Nil and pFolderItem.Exists then
		      
		      dim folderIcon as Picture = pFolderItem.Icon
		      if folderIcon <> Nil then
		        g.DrawPicture folderIcon, 2, 2, 16, 16, 0, 0, folderIcon.Width, folderIcon.Height
		      end if
		      
		    end if
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetDialogSettings(Title as String, Prompt as String = "")
		  pDialogTitle = Title
		  pDialogPrompt = Prompt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFolderItem(TheFolderItem as FolderItem)
		  if TheFolderItem <> Nil and TheFolderItem.Exists then
		    pFolderItem = TheFolderItem
		    
		    #if TargetMacOS then
		      pFolderIcon = pFolderItem.Icon( 16 )
		    #endif
		    
		    lblName.Text = TheFolderItem.Name
		    lblName.HelpTag = TheFolderItem.NativePath
		    self.Invalidate
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FolderChanged(TheFolderItem as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		pDialogPrompt As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pDialogTitle As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pFolderIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pFolderItem As FolderItem
	#tag EndProperty


	#tag Constant, Name = kBrowse, Type = String, Dynamic = True, Default = \"Browse", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Browse"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnBrowse
	#tag Event
		Sub Action()
		  dim dlg as new SelectFolderDialog
		  dlg.ActionButtonCaption = Keywords.Dialog.Buttons.kOK
		  dlg.CancelButtonCaption = Keywords.Dialog.Buttons.kCancel
		  'dlg.InitialDirectory = SpecialFolder.Documents
		  
		  if pDialogTitle <> "" then
		    dlg.Title = pDialogTitle
		  end if
		  
		  if pDialogPrompt <> "" then
		    dlg.PromptText = pDialogPrompt
		  end if
		  
		  dim f as FolderItem = dlg.ShowModal
		  if f <> Nil and f.Exists then
		    SetFolderItem( f )
		    FolderChanged( f )
		  else
		    'MsgBox "Couldn't select folder item."
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pDialogPrompt"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pDialogTitle"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pFolderIcon"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
