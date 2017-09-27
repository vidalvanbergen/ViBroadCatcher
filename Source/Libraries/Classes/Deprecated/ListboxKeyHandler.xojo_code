#tag Class
Private Class ListboxKeyHandler
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  // Alternating Row colors
		  if AlternatingRowColors then
		    if row < me.ListCount and NOT me.Selected( row ) then
		      
		      #if TargetMacOS then
		        dim AlternatingRowBackgroundColors() as NSColor = NSColor.ControlAlternatingRowBackgroundColors
		        
		        g.ForeColor = AlternatingRowBackgroundColors(row mod 2)
		      #else
		        if row mod 2 = 0 then
		          g.ForeColor = HSL( 0, 0, 0, 5 )
		        else
		          g.ForeColor = HSL( 0, 0, 100 )
		        end if
		      #endif
		      
		      g.FillRect 0, 0, g.Width, g.Height
		    end if
		    
		  end if
		  
		  Return CellBackgroundPaint( g, row, column ) or AlternatingRowColors
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  if RaiseEvent CellClick(row, column, x, y) then
		    Return True
		  else
		    
		    'if NOT Keyboard.ShiftKey and NOT Keyboard.OptionKey and NOT Keyboard.AltKey and NOT Keyboard.CommandKey and NOT Keyboard.ControlKey then
		    'end if
		    
		    if IsContextualClick then
		      if me.SelCount > 1 and me.Selected(row) then
		        
		        RecordSelection
		        RestoreOnChange = True
		        
		      end if
		    end if
		    
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Change()
		  '
		  if NOT IgnoreChange then
		    if RestoreOnChange then
		      RestoreSelection
		    else
		      
		    end if
		    
		    // Only raise the change() event if something has changed
		    'if me.ListIndex <> Me.LastSelectedIndex or me.SelCount <> me.LastSelectionCount then
		    'me.LastSelectedIndex = me.ListIndex
		    'me.LastSelectionCount = me.SelCount
		    RaiseEvent Change()
		    'end if
		    
		  end if
		  
		  RestoreOnChange = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  EditSelectAll.Enabled = True
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  // If user customized keydown...
		  if KeyDown( key ) then
		    Return True
		  end if
		  
		  dim AscKey as Integer = Asc( key )
		  
		  // Let the system handle 'up', 'down' and 'tab' keys.
		  if AscKey = 30 or AscKey = 31 or AscKey = 9 then
		    Return False
		  end if
		  
		  // Handle hierarchical folder rows.
		  if ListIndex > -1 and RowIsFolder( ListIndex ) then
		    if AscKey = 29 then
		      Expanded( ListIndex ) = True
		      Return True
		    elseif AscKey = 28 then
		      Expanded( ListIndex ) = False
		      Return True
		    end if
		  end if
		  
		  // Pressed 'Enter' or Pressed 'Return'
		  if AscKey = 13 or AscKey = 3 then
		    RaiseEvent Action
		    Return True
		  end if
		  
		  // record last keys pressed within 30 ticks intervals.
		  if ticks - LastKeyPressedAt <= 30 then
		    LastKeyPressed = LastKeyPressed + key
		  else
		    LastKeyPressed = key
		  end if
		  LastKeyPressedAt = Ticks
		  
		  // Search the list
		  if not Keyboard.AsyncControlKey and NOT Keyboard.AsyncAltKey and NOT Keyboard.AsyncCommandKey then // But not of cmd/ctrl/alt keys are pressed
		    for row as Integer = 0 to ListCount -1
		      for col as Integer = 0 to ColumnCount-1
		        
		        if Cell( row, col ).Left( LastKeyPressed.Len ).Lowercase = LastKeyPressed.Lowercase then
		          ListIndex = row
		          Return True
		        end if
		        
		      next // @END ColumnCount
		      
		    next // @END rowcount
		  end if
		  
		  'Return b
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RecordSelection()
		  if LastSelection = Nil then LastSelection = new Dictionary
		  LastSelection.Clear
		  for row as Integer = 0 to me.LastIndex
		    if me.Selected(row) then
		      LastSelection.Value( Cell( row, 1 ) ) = row
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreSelection()
		  dim prev as Boolean = IgnoreChange
		  IgnoreChange = True
		  
		  if LastSelection <> Nil then
		    
		    for row as Integer = 0 to me.LastIndex
		      dim sel as Boolean = LastSelection.HasKey( Cell( row, 1 ) )
		      
		      if me.Selected(row) <> sel then
		        me.Selected(row) = sel
		      else
		        Continue
		      end if
		      
		    next // @NEXT row
		    
		  end if
		  
		  IgnoreChange = prev
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedFolders() As FolderItem()
		  
		  dim folders() as FolderItem
		  for row as Integer = 0 to me.LastIndex
		    dim f as FolderItem
		    if me.Selected( row ) and me.Cell( row, 1 ) <> "" then
		      f = FileManager.GetFolderItemFromPOSIXPath( me.Cell( row, 1 ) ) 'GetFolderItem( me.Cell( row, 1 ), FolderItem.PathTypeNative )
		      
		      if f <> Nil and f.Exists then
		        folders.Append f
		      end if
		      
		    end if
		  next
		  
		  Return folders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRows() As Integer()
		  
		  dim selection() as Integer
		  for row as Integer = 0 to me.LastIndex
		    if me.Selected( row ) then
		      selection.Append row
		    end if
		  next
		  
		  Return selection
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key as String) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		AlternatingRowColors As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreChange As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastKeyPressed As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastKeyPressedAt As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastSelectedIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastSelection As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastSelectionCount As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		RestoreOnChange As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlternatingRowColors"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoreChange"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RestoreOnChange"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
