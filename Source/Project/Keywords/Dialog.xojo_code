#tag Module
Protected Module Dialog
	#tag Constant, Name = kCantBeUndone, Type = String, Dynamic = True, Default = \"You can\'t undo this action.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"You can\'t undo this action."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"U kunt deze bewerking niet ongedaan maken."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Du kan inte \xC3\xA5ngra detta."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Diese Aktion kann nicht r\xC3\xBCckg\xC3\xA4ngig gemacht werden!"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cette action est irr\xC3\xA9versible."
	#tag EndConstant

	#tag Constant, Name = kErrorMessage, Type = String, Dynamic = True, Default = \"Due to an unexpected error\x2C this application might have become unstable\x2C do you want to continue using it\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Due to an unexpected error\x2C this application might have become unstable\x2C do you want to continue using it\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Door een onverwachte fout is dit programma wellicht onstabiel geworden\x2C wil je toch doorgaan\?"
	#tag EndConstant

	#tag Constant, Name = kErrorMessageDescription, Type = String, Dynamic = True, Default = \"It is recommended to restart this application.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"It is recommended to restart this application."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Het wordt aanbevolen om dit programma opnieuw te starten."
	#tag EndConstant

	#tag Constant, Name = kWantToDeleteSelectedItem, Type = String, Dynamic = True, Default = \"Are you sure you want to move the selected item to the trash\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Are you sure you want to move the selected item to the trash\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Weet je zeker dat je het geselecteerde bestand naar de prullenbak wilt verplaatsen\?"
	#tag EndConstant

	#tag Constant, Name = kWantToDeleteSelectedItems, Type = String, Dynamic = True, Default = \"Are you sure you want to move the selected items to the trash\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Are you sure you want to move the selected items to the trash\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Weet je zeker dat je de geselecteerde bestanden naar de prullenbak wilt verplaatsen\?"
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
