#tag Class
Protected Class LogTime
	#tag Method, Flags = &h0
		Sub Constructor(TheMethodName as String, ShowLog as Boolean = False)
		  #if DebugBuild then
		    StartTicks = Ticks
		    StartMicroseconds = Microseconds
		    self.MethodName = TheMethodName
		    pShowLog = ShowLog
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if DebugBuild then
		    dim endTicks as Integer = Ticks - StartTicks
		    dim endMicroseconds as Double = Microseconds - StartMicroseconds
		    
		    if pShowLog or AppSettings.ExperimentalMode then
		      DReportTitled MethodName
		      DReport str( endTicks ) + " Ticks"
		      DReport Str( endTicks / 60, "#.##" ) + " Seconds"
		      DReport str( endMicroseconds ) + " Microseconds"
		    else
		      log "<timer name=""" + MethodName + """  ticks=""" + Str( endTicks ) + """  seconds=""" + Str( endTicks / 60, "#.##\s" ) +  """  microseconds=""" + Str( endMicroseconds ) + """ />"
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private MethodName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pShowLog As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartTicks As Integer
	#tag EndProperty


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
			Name="pShowLog"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
End Class
#tag EndClass
