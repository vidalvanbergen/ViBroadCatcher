#tag Class
Protected Class DownloadTimer
Inherits Timer
	#tag Event
		Sub Action()
		  HydRaSSCore.GetLink( TheFeedURL, TheFeedEntry )
		  
		  for index as Integer = HydRaSSCore.DownloadTimers.Ubound DownTo 0
		    if HydRaSSCore.DownloadTimers(index) = self then
		      HydRaSSCore.DownloadTimers.Remove(index)
		      Exit
		    end if
		  next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Start(FeedURL as String, FeedItem as Dictionary)
		  HydRaSSCore.DownloadTimers.Append self
		  TheFeedURL = FeedURL
		  TheFeedEntry = FeedItem
		  
		  me.Period = 0
		  me.Mode = timer.ModeSingle
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected TheFeedEntry As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TheFeedURL As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
