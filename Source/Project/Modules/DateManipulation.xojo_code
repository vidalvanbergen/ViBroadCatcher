#tag Module
Protected Module DateManipulation
	#tag Method, Flags = &h0
		Function DaysFromNow(TheDate as Date) As Integer
		  Return TheDate.DaysFromNow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DaysFromNow(Extends TheDate as Date) As Integer
		  
		  dim Now as new Date
		  dim difference as Integer =  TheDate.TotalSeconds - now.TotalSeconds
		  
		  if difference < 0 then
		    difference = Floor( difference/60/60/24 )
		  else
		    difference = Ceil( difference/60/60/24 )
		  end if
		  
		  Return difference
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IntToDay(Value as Integer, ShortDay as Boolean = True) As String
		  
		  dim Day_Name_Short(7) as string = Array(" ", _
		  Keywords.TimesAndDates.daySundayShort, _
		  Keywords.TimesAndDates.dayMondayShort,_
		  Keywords.TimesAndDates.dayTuesdayShort,_
		  Keywords.TimesAndDates.dayWednesdayShort,_
		  Keywords.TimesAndDates.dayThursdayShort,_
		  Keywords.TimesAndDates.dayFridayShort,_
		  Keywords.TimesAndDates.daySaturdayShort )
		  
		  dim Day_Name_Long(7)  as string = Array(" ", _
		  Keywords.TimesAndDates.daySunday, _
		  Keywords.TimesAndDates.dayMonday,_
		  Keywords.TimesAndDates.dayTuesday,_
		  Keywords.TimesAndDates.dayWednesday,_
		  Keywords.TimesAndDates.dayThursday,_
		  Keywords.TimesAndDates.dayFriday,_
		  Keywords.TimesAndDates.daySaturday )
		  
		  if ShortDay then
		    Return Day_Name_Short( Value )
		  else
		    Return Day_Name_Long( Value )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IntToMonth(Value as Integer, ShortMonth as Boolean = True, Localized as Boolean = True) As String
		  
		  dim Month_Name_Short(12) as string = Array(" ", _
		  Keywords.TimesAndDates.monthJanuaryShort, _
		  Keywords.TimesAndDates.monthFebruaryShort,_
		  Keywords.TimesAndDates.monthMarchShort,_
		  Keywords.TimesAndDates.monthAprilShort,_
		  Keywords.TimesAndDates.monthMayShort,_
		  Keywords.TimesAndDates.monthJuneShort,_
		  Keywords.TimesAndDates.monthJulyShort,_
		  Keywords.TimesAndDates.monthAugustShort,_
		  Keywords.TimesAndDates.monthSeptemberShort,_
		  Keywords.TimesAndDates.monthOctoberShort,_
		  Keywords.TimesAndDates.monthNovemberShort,_
		  Keywords.TimesAndDates.monthDecemberShort )
		  
		  'dim Month_Name_Long(12)  as string = Array(" ", "Januari","Februari","March","April","May","June","July","August","September","October","November","December")
		  dim Month_Name_Long(12)  as string = Array(" ", _
		  Keywords.TimesAndDates.monthJanuaryLong,_
		  Keywords.TimesAndDates.monthFebruaryLong,_
		  Keywords.TimesAndDates.monthMarchLong,_
		  Keywords.TimesAndDates.monthAprilLong,_
		  Keywords.TimesAndDates.monthMayLong,_
		  Keywords.TimesAndDates.monthJuneLong,_
		  Keywords.TimesAndDates.monthJulyLong,_
		  Keywords.TimesAndDates.monthAugustLong,_
		  Keywords.TimesAndDates.monthSeptemberLong,_
		  Keywords.TimesAndDates.monthOctoberLong,_
		  Keywords.TimesAndDates.monthNovemberLong,_
		  Keywords.TimesAndDates.monthDecemberLong )
		  
		  if ShortMonth then
		    Return Month_Name_Short( Value )
		  else
		    Return Month_Name_Long( Value )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isWithinDays(Extends TheDate as Date, WithinDays as Integer) As Boolean
		  
		  dim Today as New DatePro
		  Today.Hour = 0
		  Today.Minute = 0
		  Today.Second = 0
		  
		  dim DaysDifference as Double = Round( ( TheDate.TotalSeconds - Today.TotalSeconds ) / 60 / 60 / 24 )
		  
		  Return DaysDifference > -WithinDays
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MonthToInt(Month as String) As Integer
		  
		  dim Month_Name_Short(12) as string = Array(" ", "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
		  dim Month_Name_Long(12)  as string = Array(" ", "January","February","March","April","May","June","July","August","September","October","November","December")
		  
		  dim Month_Name_Short_Localized(12)  as string = Array(" ", _
		  Keywords.TimesAndDates.monthJanuaryShort,_
		  Keywords.TimesAndDates.monthFebruaryShort,_
		  Keywords.TimesAndDates.monthMarchShort,_
		  Keywords.TimesAndDates.monthAprilShort,_
		  Keywords.TimesAndDates.monthMayShort,_
		  Keywords.TimesAndDates.monthJuneShort,_
		  Keywords.TimesAndDates.monthJulyShort,_
		  Keywords.TimesAndDates.monthAugustShort,_
		  Keywords.TimesAndDates.monthSeptemberShort,_
		  Keywords.TimesAndDates.monthOctoberShort,_
		  Keywords.TimesAndDates.monthNovemberShort,_
		  Keywords.TimesAndDates.monthDecemberShort )
		  
		  dim Month_Name_Long_Localized(12)  as string = Array(" ", _
		  Keywords.TimesAndDates.monthJanuaryLong,_
		  Keywords.TimesAndDates.monthFebruaryLong,_
		  Keywords.TimesAndDates.monthMarchLong,_
		  Keywords.TimesAndDates.monthAprilLong,_
		  Keywords.TimesAndDates.monthMayLong,_
		  Keywords.TimesAndDates.monthJuneLong,_
		  Keywords.TimesAndDates.monthJulyLong,_
		  Keywords.TimesAndDates.monthAugustLong,_
		  Keywords.TimesAndDates.monthSeptemberLong,_
		  Keywords.TimesAndDates.monthOctoberLong,_
		  Keywords.TimesAndDates.monthNovemberLong,_
		  Keywords.TimesAndDates.monthDecemberLong )
		  
		  if Month.Len = 3 then
		    if Month_Name_Short_Localized.IndexOf( Month ) > -1 then
		      Return Month_Name_Short_Localized.IndexOf( Month )
		    else
		      Return Month_Name_Short.IndexOf( Month )
		    end if
		  else
		    if Month_Name_Long_Localized.IndexOf( Month ) > -1 then
		      Return Month_Name_Long_Localized.IndexOf( Month )
		    else
		      Return Month_Name_Long.IndexOf( Month )
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDateAndTime(TheText as String, Byref value as DatePro) As Boolean
		  
		  dim TheRegularDate as new Date
		  
		  // Parse Date
		  if ParseDate(TheText, TheRegularDate) then
		    
		    dim dateSplit() as string = TheText.Split(" ")
		    
		    dim TimeField as string
		    dim GMTField as string
		    
		    for index as Integer = 0 to dateSplit.Ubound
		      if dateSplit(index).Contains(":") then
		        TimeField = dateSplit(index)
		        
		        if dateSplit.Ubound > index then
		          GMTField = dateSplit(index+1)
		        end if
		        Exit
		      end if
		    next
		    
		    
		    if GMTField <> "" and NOT GMTField.Contains(":") then
		      GMTField = GMTField.Left(3) + ":" + GMTField.Right(2)
		    end if
		    
		    
		    
		    dim ISO8601 as string = TheRegularDate.SQLDate + " " + TimeField + GMTField
		    value.ISO8601 = ISO8601
		    
		    
		    Return True
		  else
		    Return False
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrettifyRuntime(runtime as Integer) As String
		  
		  if runtime > 0 then
		    dim days as Integer = Floor( runtime/60/24 )
		    dim hours as Integer = Floor( runtime/60 - (days*24*60) )
		    dim minutes as Integer = runtime - (hours*60) - (days*24*60)
		    
		    if days > 0 then
		      Return Str( days ) + Keywords.TimesAndDates.time_Days.Left(1).Lowercase + " " + _
		      Str( hours ) + Keywords.TimesAndDates.time_Hour.Left(1).Lowercase + " " + _
		      str( minutes ) + Keywords.TimesAndDates.time_Minutes.Left(1).Lowercase
		      
		    elseif hours > 0 then
		      Return Str( hours ) + Keywords.TimesAndDates.time_Hour.Left(1).Lowercase + " " + _
		      str( minutes ) + Keywords.TimesAndDates.time_Minutes.Left(1).Lowercase
		      
		    else
		      Return str( minutes ) + Keywords.TimesAndDates.time_Minutes.Left(1).Lowercase
		    end if
		    
		  else
		    Return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SortMonthsArray(TheArray() as string) As String()
		  
		  dim NewArray() as string
		  
		  for each value as string in TheArray
		    if value = Keywords.TimesAndDates.monthJanuaryLong or value = Keywords.TimesAndDates.monthJanuaryLong( "en" ) then
		      NewArray.Append "01" + value
		    elseif value = Keywords.TimesAndDates.monthFebruaryLong or value = Keywords.TimesAndDates.monthFebruaryLong( "en" ) then
		      NewArray.Append "02" + value
		    elseif value = Keywords.TimesAndDates.monthMarchLong or value = Keywords.TimesAndDates.monthMarchLong( "en" ) then
		      NewArray.Append "03" + value
		    elseif value = Keywords.TimesAndDates.monthAprilLong or value = Keywords.TimesAndDates.monthAprilLong( "en" ) then
		      NewArray.Append "04" + value
		    elseif value = Keywords.TimesAndDates.monthMayLong or value = Keywords.TimesAndDates.monthMayLong( "en" ) then
		      NewArray.Append "05" + value
		    elseif value = Keywords.TimesAndDates.monthJuneLong or value = Keywords.TimesAndDates.monthJuneLong( "en" ) then
		      NewArray.Append "06" + value
		    elseif value = Keywords.TimesAndDates.monthJulyLong or value = Keywords.TimesAndDates.monthJulyLong( "en" ) then
		      NewArray.Append "07" + value
		    elseif value = Keywords.TimesAndDates.monthAugustLong or value = Keywords.TimesAndDates.monthAugustLong( "en" ) then
		      NewArray.Append "08" + value
		    elseif value = Keywords.TimesAndDates.monthSeptemberLong or value = Keywords.TimesAndDates.monthSeptemberLong( "en" ) then
		      NewArray.Append "09" + value
		    elseif value = Keywords.TimesAndDates.monthOctoberLong or value = Keywords.TimesAndDates.monthOctoberLong( "en" ) then
		      NewArray.Append "10" + value
		    elseif value = Keywords.TimesAndDates.monthNovemberLong or value = Keywords.TimesAndDates.monthNovemberLong( "en" ) then
		      NewArray.Append "11" + value
		    elseif value = Keywords.TimesAndDates.monthDecemberLong or value = Keywords.TimesAndDates.monthDecemberLong( "en" ) then
		      NewArray.Append "12" + value
		    end if
		  next
		  
		  
		  NewArray.Sort
		  for index as Integer = 0 to NewArray.Ubound
		    NewArray( index ) = NewArray( index ).Right( NewArray( index ).Len - 2 )
		  next
		  
		  Return NewArray
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
