#tag Module
Protected Module Donation
	#tag Constant, Name = kMakeDonationMessage, Type = String, Dynamic = True, Default = \"If you like using #App.kAppName\x2C please consider making a donation. Your donations will allow me to spend more time developing\x2C maintaining and supporting this app.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"If you like using #App.kAppName\x2C please consider making a donation. Your donations will allow me to spend more time developing\x2C maintaining and supporting this app."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als u #App.kAppName handig vindt zou ik u willen vragen om een donatie te maken. Uw donaties zullen mij toestaan me om meer tijd te besteden aan het ontwikkelen\x2C onderhouden en ondersteunen van #App.kAppName."
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
