#tag Class
Protected Class UIAlertController
Inherits UIViewController
	#tag Method, Flags = &h0
		Sub AddAction(action as UIAlertAction)
		  declare sub addAction_ lib UIKitLib selector "addAction:" (obj_id as ptr, action as ptr)
		  addAction_(self, action)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTextField(configBlock As iOSBlock)
		  
		  If Self.preferredStyle <> UIAlertControllerStyle.Alert Then
		    
		    Dim err As New RuntimeException
		    err.Reason = "You can add a Text field only If the preferredStyle Property Is set To UIAlertControllerStyleAlert."
		    Raise err
		    Return
		  End If
		  
		  
		  Declare Sub addTextfield_ Lib UIKitLib selector "addTextFieldWithConfigurationHandler:" (obj_id As ptr, configBlock As ptr)
		  
		  
		  If configBlock Is Nil Then
		    If configBlock = Nil Then configBlock = New iOSBlock (AddressOf ConfigurationHandlerTemplate)
		    
		    AddTextField_(self.id, configBlock.Handle)
		    
		    
		    
		  Else
		    AddTextField_(Self.id, configBlock.Handle)
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlertControllerWithTitleMessagePreferredStyle(title as CFStringRef, message as CFStringRef, preferredStyle as UIAlertControllerStyle) As UIAlertController
		  Declare Function alertControllerWithTitle_ Lib UIKitLib selector "alertControllerWithTitle:message:preferredStyle:" (clsRef As ptr, title As CFStringRef, message As CFStringRef, preferredStyle As UIAlertControllerStyle) As ptr
		  
		  Dim t As Text = title
		  Dim m As Text = message
		  
		  If t.Empty = False And m.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, message, preferredStyle))
		    
		  Elseif t.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, Nil, preferredStyle))
		    
		  Elseif m.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, message, preferredStyle))
		    
		  Else
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, Nil, Nil, preferredStyle))
		    
		  End If
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIAlertController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompHandler()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConfigurationHandler(txtField as ptr)
		  #pragma unused txtField
		  
		  '
		  'Declare Sub setText Lib UIKitLib selector "setText:" (obj_id As ptr, value As CFStringRef)
		  'Declare Sub setPlaceholder Lib UIKitLib selector "setPlaceholder:" (obj_id As ptr, value As CFStringRef)
		  'Declare Sub setSecureTextEntry Lib UIKitLib selector "setSecureTextEntry:" (obj_id As ptr, value As Boolean)
		  '
		  ''Dim txtField As ptr = Foundation.NSObject.Allocate(NSClassFromString("UITextfield"))
		  '
		  ''AddTextField_(Self.id, txtField)
		  '
		  'If txt.Empty = False Then
		  'setText(txtField, txt)
		  'End If
		  'If placeholder.Empty = False Then
		  'setPlaceholder(txtField, placeholder)
		  'End If
		  'If password Then
		  'setSecureTextEntry(txtField, password)
		  'End If
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConfigurationHandlerTemplate(TextFieldPtr as Ptr)
		  #Pragma Unused TextFieldPtr
		  
		  'if me <> nil then
		  'dim textfield as new AppleTextField(TextFieldPtr)
		  'for q as Integer = 1 to me.TextFields.Count
		  'dim curfield as AppleTextField = AppleTextField.MakefromPtr(me.TextFields.PtrAtIndex(q-1))
		  'if textfield.id = curfield.id then
		  'if TextFieldDict <> nil then
		  'if TextFieldDict.HasKey (id) then
		  'dim textfieldarray as AppleArray = AppleArray (TextFieldDict.Value(id))
		  'if textfieldarray.Count >=q then
		  'dim realfield as AppleTextField = AppleTextField.MakefromPtr (textfieldarray.PtrAtIndex(q-1))
		  'textfield.Caption = realfield.Caption
		  'textfield.Placeholder = realfield.Placeholder
		  'textfield.Secure = realfield.Secure
		  'end if
		  'end if
		  'end if
		  'end if
		  'next
		  '// RaiseEvent TextFieldResult (textfield)
		  'end if
		  '// Here, do something with your textfield properties.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  'Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Dismiss()
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(mParentViewController, True, nil)
		  
		  mParentViewController = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInPopover(parentView as iOSView, sourceView As iOSControl, sourceRect As Foundation.NSRect)
		  
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewCtrlr as ptr, animated as Boolean, compHandler as ptr)
		  dim blk as new iOSBlock(AddressOf CompHandler)
		  mParentViewController = parentView.ViewControllerHandle
		  
		  
		  self.modalPresentationStyle = UIModalPresentationStyle.popover
		  
		  parentView.PresentViewController(self, true, blk)
		  
		  Dim popController As UIKit.UIPopoverPresentationController = self.popoverPresentationController()
		  popController.sourceView = new UIKit.UIView(sourceView.Handle)
		  popController.sourceRect = sourceRect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInPopover(parentView as iOSView, barButton as iOSToolButton)
		  
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewCtrlr as ptr, animated as Boolean, compHandler as ptr)
		  dim blk as new iOSBlock(AddressOf CompHandler)
		  mParentViewController = parentView.ViewControllerHandle
		  
		  
		  self.modalPresentationStyle = UIModalPresentationStyle.popover
		  
		  parentView.PresentViewController(self, true, blk)
		  
		  Dim popController As UIKit.UIPopoverPresentationController = self.popoverPresentationController()
		  popController.barButtonItem = barButton.Handle
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(parentView as iOSView)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewCtrlr as ptr, animated as Boolean, compHandler as ptr)
		  dim blk as new iOSBlock(AddressOf CompHandler)
		  mParentViewController = parentViewController
		  presentViewController_(parentView.ViewControllerHandle, self, True, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(parentView as MobileScreen)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewCtrlr as ptr, animated as Boolean, compHandler as ptr)
		  dim blk as new iOSBlock(AddressOf CompHandler)
		  mParentViewController = parentView.ViewControllerHandle
		  
		  presentViewController_(parentView.ViewControllerHandle, self, True, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function actions_ lib UIKitLib selector "actions" (obj_id as ptr) as ptr
			  Return new NSArray(actions_(self))
			End Get
		#tag EndGetter
		actions As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function message_ lib UIKitLib selector "message" (obj_id as ptr) as CFStringRef
			  Return message_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub message_ lib UIKitLib selector "setMessage:" (obj_id as ptr, message as CFStringRef)
			  message_(self, value)
			End Set
		#tag EndSetter
		message As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mParentViewController As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredStyle_ lib UIKitLib selector "preferredStyle" (obj_id as ptr) as UIAlertControllerStyle
			  Return (preferredStyle_(self))
			End Get
		#tag EndGetter
		preferredStyle As UIAlertControllerStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function textFields_ lib UIKitLib selector "textFields" (obj_id as ptr) as ptr
			  Return new NSArray(textFields_(self))
			End Get
		#tag EndGetter
		textFields As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function title_ lib UIKitLib selector "title" (obj_id as ptr) as CFStringRef
			  Return title_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub title_ lib UIKitLib selector "setTitle:" (obj_id as ptr, title as CFStringRef)
			  title_(self, value)
			End Set
		#tag EndSetter
		title As Text
	#tag EndComputedProperty


	#tag Enum, Name = UIAlertControllerStyle, Type = Integer, Flags = &h0
		ActionSheet = 0
		Alert = 1
	#tag EndEnum


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
			Name="message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Name="preferredStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UIAlertControllerStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - ActionSheet"
				"1 - Alert"
			#tag EndEnumValues
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
			Name="title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
