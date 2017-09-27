#tag Module
Protected Module ViXMLExtensions
	#tag Method, Flags = &h0
		Function Children(Extends xNode as XmlNode) As XmlNode()
		  dim xChildren() as XmlNode
		  
		  if xNode.ChildCount > 0 then
		    for index as Integer = 0 to xNode.ChildCount -1
		      xChildren.Append xNode.Child(index)
		    next
		  end if
		  
		  Return xChildren
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValuesArray(Extends xNode as XmlNode) As String()
		  if xNode <> Nil and xNode.ChildCount > -1 then
		    dim stringArray() as String
		    
		    for index as Integer = 0 to xNode.ChildCount -1
		      dim xItem as XmlNode = xNode.Child(index)
		      
		      if xItem <> Nil and xItem.FirstChild <> Nil and _
		        xItem.FirstChild.Value <> "" and NOT stringArray.Contains( xItem.FirstChild.Value )then
		        stringArray.Append xItem.FirstChild.Value
		      end if
		      
		    next
		    
		    Return stringArray
		    
		  end if
		End Function
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
