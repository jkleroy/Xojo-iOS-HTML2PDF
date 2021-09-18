#tag Class
Class NSUbiquitousKeyValueStore
Inherits NSObject
	#tag Method, Flags = &h0
		Function ArrayForKey(defaultName as CFStringRef) As NSArray
		  declare function arrayForKey_ lib FoundationLib selector "arrayForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSArray(arrayForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoolForKey(defaultName as CFStringRef) As Boolean
		  declare function boolForKey_ lib FoundationLib selector "boolForKey:" (obj_id as ptr, defaultName as CFStringRef) as Boolean
		  Return boolForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSUbiquitousKeyValueStore")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  declare function init_ lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Super.Constructor( init_(Allocate(ClassRef)) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultStore() As NSUbiquitousKeyValueStore
		  declare function defaultStore_ lib FoundationLib selector "defaultStore" (clsRef as ptr) as ptr
		  Return new NSUbiquitousKeyValueStore(defaultStore_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryForKey(defaultName as CFStringRef) As NSDictionary
		  declare function dictionaryForKey_ lib FoundationLib selector "dictionaryForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSDictionary(dictionaryForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryRepresentation() As NSDictionary
		  declare function dictionaryRepresentation_ lib FoundationLib selector "dictionaryRepresentation" (obj_id as ptr) as ptr
		  Return new NSDictionary(dictionaryRepresentation_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleForKey(defaultName as CFStringRef) As Double
		  declare function doubleForKey_ lib FoundationLib selector "doubleForKey:" (obj_id as ptr, defaultName as CFStringRef) as Double
		  Return doubleForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerForKey(defaultName as CFStringRef) As Integer
		  Break //might not work
		  declare function integerForKey_ lib FoundationLib selector "integerForKey:" (obj_id as ptr, defaultName as CFStringRef) as Integer
		  Return integerForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForKey(defaultName as CFStringRef) As NSObject
		  declare function objectForKey_ lib FoundationLib selector "objectForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSObject(objectForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObjectForKey(defaultName as Text)
		  declare sub removeObjectForKey_ lib FoundationLib selector "removeObjectForKey:" (obj_id as ptr, defaultName as CFStringRef)
		  removeObjectForKey_(self, defaultName)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBoolForKey(value as Boolean, defaultName as CFStringRef)
		  declare sub setBool_ lib FoundationLib selector "setBool:forKey:" (obj_id as ptr, value as Boolean, defaultName as CFStringRef)
		  setBool_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDoubleForKey(value as Double, defaultName as CFStringRef)
		  declare sub setDouble_ lib FoundationLib selector "setDouble:forKey:" (obj_id as ptr, value as Double, defaultName as CFStringRef)
		  setDouble_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIntegerForKey(value as Integer, defaultName as CFStringRef)
		  Break //might not work
		  declare sub setInteger_ lib FoundationLib selector "setInteger:forKey:" (obj_id as ptr, value as Integer, defaultName as CFStringRef)
		  setInteger_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObjectForKey(value as NSobject, defaultName as CFStringRef)
		  declare sub setObject_ lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, value as ptr, defaultName as CFStringRef)
		  setObject_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTextForKey(value as text, defaultName as CFStringRef)
		  
		  If value.Empty Then
		    Dim err As New RuntimeException
		    err.Reason = CurrentMethodName + " value is empty"
		    'jly_Crashcontroller.sharedInstance.setCustomData("defaultName", defaultName)
		    'jly_Crashcontroller.sharedInstance.LogException(err, CurrentMethodName)
		    'jly_Crashcontroller.sharedInstance.removeCustomData("defaultName")
		    
		    
		    Return
		  End If
		  
		  dim s as new NSString(value)
		  SetObjectForKey(s,defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringArrayForKey(defaultName as CFStringRef) As NSArray
		  declare function stringArrayForKey_ lib FoundationLib selector "stringArrayForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSArray(stringArrayForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringForKey(defaultName as CFStringRef) As CFStringRef
		  declare function stringForKey_ lib FoundationLib selector "stringForKey:" (obj_id as ptr, defaultName as CFStringRef) as CFStringRef
		  Return stringForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Synchronize() As Boolean
		  declare function synchronize_ lib FoundationLib selector "synchronize" (obj_id as ptr) as Boolean
		  Return synchronize_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextForKey(defaultName as CFStringRef) As Text
		  Return StringForKey(defaultName)
		End Function
	#tag EndMethod


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
