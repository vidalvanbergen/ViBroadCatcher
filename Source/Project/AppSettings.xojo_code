#tag Module
Protected Module AppSettings
	#tag Method, Flags = &h1
		Protected Sub AppInitialize()
		  ExperimentalMode = Keyboard.AsyncShiftKey
		  
		  #if TargetMacOS then
		    NotificationCenter.Register
		  #endif
		  
		  InitializeKaju
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckForUpdates(AllowInteraction as Boolean = True)
		  
		  Dim Interaction As Integer
		  If AllowInteraction Then
		    Interaction = Kaju.UpdateChecker.kAllowUpdateWindow + Kaju.UpdateChecker.kAllowErrorDialog '= 136
		  Else
		    Interaction = 0
		  End If
		  
		  UpdateChecker.Execute
		  
		  Dim status As String
		  
		  Select Case UpdateChecker.Result
		  Case Kaju.UpdateChecker.ResultType.UpdateAlreadyInProgress
		    status = "Update already in progress"
		    MsgBox status
		    
		  Case Kaju.UpdateChecker.ResultType.UnsupportedOS
		    status = "This OS is not supported (missing required tools)"
		    MsgBox status
		    
		  Case Kaju.UpdateChecker.ResultType.NoWritePermission
		    status = "Aborted (no write permission)"
		    MsgBox status
		    
		  Case Kaju.UpdateChecker.ResultType.Error
		    status = "Error, user chose to try later"
		    
		  Case Kaju.UpdateChecker.ResultType.IgnoredUpdateAvailable
		    status = "Updates available, but ignored"
		    
		  Case Kaju.UpdateChecker.ResultType.NoUpdateAvailable
		    status = "No updates available"
		    
		  Case Kaju.UpdateChecker.ResultType.UpdateAvailable
		    status = "Updates available"
		    
		  Case Kaju.UpdateChecker.ResultType.RequiredUpdateAvailable
		    status = "Required update available"
		    
		  Else
		    status = "UNKNOWN RESULT"
		    MsgBox status
		    
		  End
		  Log "Kaju.CheckForUpdates :: " + status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HandleError(error as RuntimeException, Location as string) As Boolean
		  Log Location, error, 3
		  
		  #if False And DebugBuild then
		    Return False
		  #else
		    dim w as new wndFeedback
		    w.AddErrorLog( error, Location )
		    w.ShowModal // Just for good measure
		    
		    Dim d as New MessageDialog                  //declare the MessageDialog object
		    Dim b as MessageDialogButton                //for handling the result
		    d.icon=MessageDialog.GraphicCaution         //display warning icon
		    d.ActionButton.Caption = App.kFileQuit
		    
		    d.CancelButton.Visible=True                 //show the Cancel button
		    d.CancelButton.Caption = Keywords.Dialog.Buttons.kContinue
		    
		    d.Message=Keywords.Dialog.kErrorMessage
		    d.Explanation=Keywords.Dialog.kErrorMessageDescription
		    
		    b=d.ShowModal                              //display the dialog
		    Select Case b                              //determine which button was pressed.
		      
		    Case d.ActionButton
		      Quit
		      Return True
		      
		    else
		      Return True
		      
		    End select
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitializeKaju()
		  if UpdateChecker = Nil then
		    UpdateChecker = new Kaju.UpdateChecker( SupportFolder )
		  end if
		  
		  UpdateChecker.ServerPublicRSAKey = kPublicRSAKey
		  UpdateChecker.UpdateURL = kUpdateFileURL
		  
		  'UpdateChecker.DefaultImage = AppIcon
		  UpdateChecker.DefaultUseTransparency = true
		  
		  dim Interaction as Integer = Kaju.UpdateChecker.kAllowUpdateWindow + Kaju.UpdateChecker.kAllowErrorDialog '= 136
		  
		  UpdateChecker.HonorIgnored = True
		  UpdateChecker.AllowedInteraction = Interaction
		  UpdateChecker.AllowedStage = 0
		  UpdateChecker.AllowRedirection = True
		End Sub
	#tag EndMethod


	#tag Note, Name = Gmail Password
		
		kgmailEncPassword is a simple hex encoded version of your gmail password, this is used in the feedback window to send you emails without having to open the user's e-mail client.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected ExperimentalMode As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Static gPrefs as TTsSmartPreferences
			  if gPrefs = Nil then
			    gPrefs = New TTsSmartPreferences( kAppName )
			  end if
			  Return gPrefs
			End Get
		#tag EndGetter
		Protected Prefs As TTsSmartPreferences
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Static gPrettyVersion as String
			  
			  if gPrettyVersion = "" then
			    
			    gPrettyVersion = App.MajorVersion.ToText + "." + App.MinorVersion.ToText
			    
			    if App.BugVersion > 0 then
			      gPrettyVersion = gPrettyVersion + "." + App.BugVersion.ToText
			    end if
			    
			    select case App.StageCode
			    case App.Beta
			      gPrettyVersion = gPrettyVersion + "b" + App.NonReleaseVersion.ToText
			    case App.Alpha
			      gPrettyVersion = gPrettyVersion + "a" + App.NonReleaseVersion.ToText
			    case App.Development
			      gPrettyVersion = gPrettyVersion + "dev" + App.NonReleaseVersion.ToText
			    else
			      '
			    end select
			    
			  end if
			  
			  // v0.0(.0)(α/β0)
			  Return gPrettyVersion
			End Get
		#tag EndGetter
		Protected PrettyVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Static gSupportFolder as FolderItem
			  if gSupportFolder = Nil then
			    gSupportFolder = SpecialFolder.ApplicationData.Child( kAppName )
			    
			    if NOT gSupportFolder.Exists then
			      gSupportFolder.CreateAsFolder
			    end if
			  end if
			  
			  Return gSupportFolder
			End Get
		#tag EndGetter
		SupportFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected UpdateChecker As Kaju.UpdateChecker
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UpdateInitiater As Kaju.UpdateInitiater
	#tag EndProperty


	#tag Constant, Name = Identifier, Type = String, Dynamic = False, Default = \"com.vidalvanbergen.vibroadcatcher", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppName, Type = String, Dynamic = False, Default = \"ViBroadCatcher", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCopyright, Type = String, Dynamic = False, Default = \"\xC2\xA9 2017 Vidal van Bergen\x2C All Rights Reserved", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDonationURL, Type = String, Dynamic = False, Default = \"https://www.paypal.com/cgi-bin/webscr\?cmd\x3D_donations&business\x3Dvidal%2evanbergen%40gmail%2ecom&lc\x3DGB&item_name\x3DSupport%20ViBroadCatcher%20development&currency_code\x3DEUR&bn\x3DPP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPublicRSAKey, Type = String, Dynamic = False, Default = \"30820120300D06092A864886F70D01010105000382010D00308201080282010100AA545B2F741C01EE00278B50AFCE8BC3EFFF08814160F1C930E25394BC6CF13A6AF1F7BF9122CC154BC482D5CACAC04D7B0DBC82491D248BFDF7C74A52D38943153B977F06E50FAC7C045F037546CB98202E29A08323CA5DE3C4CA17725D06662F6B89B83DF679F1EC6AE24DC7D67023F4CF8C99974DB6D8EBBC77FF9DD9542CF7A26A2160C59784062328EC8276D1A65C2AFF78DA64639CAA63DCDA8253E7047177FDB308958116115F96860263701B217030D99B51DA80137708C2E35E966EFADF7C8BCC06F9B8028CBC28035484054AC45DE8F4B29CACACA5E24CBB101CE01472064A8470A97108C3A9ECD81B1206505137BF53E0C206FD20CDDA04E02685020111", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpdateFileURL, Type = String, Dynamic = False, Default = \"http://vitalis.heliohost.org/vibroadcatcher/updates/appcast.json", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWebsiteURL, Type = String, Dynamic = False, Default = \"http://vitalis.heliohost.org/vibroadcatcher", Scope = Protected
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
