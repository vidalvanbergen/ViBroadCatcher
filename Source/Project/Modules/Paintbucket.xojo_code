#tag Module
Protected Module Paintbucket
	#tag Method, Flags = &h0
		Sub DrawStringShadow(Extends g as Graphics, Textcolor as Color, Shadowcolor as Color, Text as String, x as Integer, y as Integer, Width as Integer = 0, Condense as Boolean = False)
		  
		  g.ForeColor = Shadowcolor
		  g.DrawString( Text, x, y + 1, Width, Condense )
		  
		  g.ForeColor = Textcolor
		  g.DrawString( Text, x, y, Width, Condense )
		End Sub
	#tag EndMethod


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
