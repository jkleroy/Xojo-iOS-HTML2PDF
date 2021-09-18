#tag Class
 Attributes ( untested = true ) Class UIGestureRecognizerDelegate
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(TargetClass)))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(self.id) = self
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleShouldRecognizeSimultaneouslyWithGestureRecognizer(other As ptr) As Boolean
		  
		  try
		    Return RaiseEvent RecognizeSimultaneously(other)
		    
		  Catch
		    
		  end try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_ShouldLoad(pid as ptr, sel as ptr, view as ptr, request as ptr, navigationtype as Integer) As Boolean
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused view
		  #Pragma Unused navigationtype
		  
		  declare function URL_ lib FoundationLib selector "URL" (obj_id as ptr) as ptr
		  
		  dim nsurlref as ptr = URL_(request)
		  
		  declare Function absoluteString lib FoundationLib selector "absoluteString" (obj_id as ptr) as CFStringRef
		  Dim url As Text
		  url = absoluteString(nsurlref)
		  
		  'Return UIWebViewDelegate(dispatch.Value(pid)).HandleShouldLoad(url, navigationtype=0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_ShouldRecognizeSimultaneouslyWithGestureRecognizer(pid as ptr, sel as ptr, gesture as ptr, other as ptr) As Boolean
		  #Pragma Unused sel
		  #pragma Unused gesture
		  
		  Return UIGestureRecognizerDelegate(dispatch.Value(pid)).HandleShouldRecognizeSimultaneouslyWithGestureRecognizer(other)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = nil then
		    using Extensions
		    dim methods() as UIKit.TargetClassMethodHelper
		    'methods.Add new UIKit.TargetClassMethodHelper("webView:shouldStartLoadWithRequest:navigationType:", AddressOf impl_ShouldLoad, "B@:@@i")
		    methods.Add New UIKit.TargetClassMethodHelper("gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", _
		    AddressOf impl_ShouldRecognizeSimultaneouslyWithGestureRecognizer, "B@:@@")
		    
		    
		    
		    targetID = BuildTargetClass("NSObject","MyUIGestureRecognizerDelegate", methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RecognizeSimultaneously(otherGesture As ptr) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
