#tag Class
Class UIEdgeInset
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  value.Left = 0.0
		  value.Right = 0.0
		  value.Top = 0.0
		  value.Bottom = 0.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(top as Double, left As Double, bottom As Double, right As Double)
		  
		  value.top = top
		  value.Left = left
		  value.Bottom = bottom
		  value.Right = right
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as UIEdgeInsets32)
		  
		  value.Left = other.Left
		  value.Top = other.Top
		  value.Bottom = other.Bottom
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as UIEdgeInsets64)
		  
		  value.ByteValue(False) = other.ByteValue(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value32() As UIEdgeInsets32
		  Dim result As UIEdgeInsets32
		  result.Left = self.value.Left
		  result.Top = self.value.Top
		  result.Right = self.value.Right
		  result.Bottom = self.value.Bottom
		  
		  
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value64() As UIEdgeInsets64
		  Dim result As UIEdgeInsets64
		  result.Left = self.value.Left
		  result.Top = self.value.Top
		  result.Right = self.value.Right
		  result.Bottom = self.value.Bottom
		  
		  
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		value As UIEdgeInsets64
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
