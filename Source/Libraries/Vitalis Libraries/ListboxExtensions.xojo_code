#tag Module
Protected Module ListboxExtensions
	#tag Method, Flags = &h0
		Function PopUpCellChoices(extends lb As Listbox, row As Integer, column As Integer, choices() As String, celltags() As String) As Boolean
		  // Pop up the menu of choices for this cell.  If the user picks one,
		  // store it in that cell and return True.  Otherwise, return False.
		  
		  Dim menu As New MenuItem
		  For Each choice As String In choices
		    If choice = "-" Then
		      menu.Append New MenuItem(MenuItem.TextSeparator)
		    Else
		      Dim item As New MenuItem(choice)
		      menu.Append item
		      If choice = lb.Cell(row, column) Then item.Checked = True
		    End If
		  Next
		  
		  Dim choice As MenuItem = menu.PopUp
		  If choice Is Nil Then Return False
		  
		  lb.Cell(row, column) = choice.Text
		  lb.CellTag(row, column) = celltags(choices.IndexOf(choice.Text))
		  Return True
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
