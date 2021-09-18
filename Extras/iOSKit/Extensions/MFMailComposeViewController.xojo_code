#tag Class
Protected Class MFMailComposeViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h0
		Sub addAttachment(attachment as xojo.IO.FolderItem, MIMEType as text, fileName as Text)
		  declare sub addAttachment_ lib MessageUIKitLib selector "addAttachmentData:mimeType:fileName:" _
		  (obj_id as ptr, data as ptr, MIMEType as CFStringRef, fileName as CFStringRef)
		  addAttachment_(self,NSDataFromFolderitem(attachment), MIMEType, fileName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function canSendMail() As Boolean
		  declare function canSendMail_ lib MessageUIKitLib selector "canSendMail" (clsRef as ptr) as Boolean
		  Return canSendMail_(NSClassFromString("MFMailComposeViewController"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(NSClassFromString("MFMailComposeViewController"))))
		  
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  setDelegate(del)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dismiss()
		  'declare sub dismissModalViewController lib UIKitLib selector "dismissViewControllerAnimated:completion:" _
		  '(obj_id as ptr, animated as Boolean, completion as ptr)
		  'dismissModalViewController(mparentViewController.ViewControllerHandle, True, Nil)
		  
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(self, True, nil)
		  
		  'mparentViewController = nil
		  Break
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub FinishDelegate(result As MFMailComposeResult)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub HandleDidFinish(result As MFMailComposeResult)
		  
		  try
		    if FinishCallback <> nil then
		      FinishCallback.Invoke(result)
		    end if
		  Catch
		  end try
		  
		  
		  dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishWithResult(pid as ptr, sel as ptr, composer as ptr, result as MFMailComposeResult, err as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    MFMailComposeViewController(w.Value).HandleDidFinish(result)
		  end if
		  
		  
		  #Pragma Unused sel
		  #Pragma Unused composer
		  #Pragma Unused result
		  #Pragma Unused err
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView As iOSView, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  
		  //Forcing full modal
		  'Declare sub setModalInPresentation lib "UIKit.framework" Selector "setModalInPresentation:" (obj_id as ptr, value as Boolean)
		  'setModalInPresentation(self, true)
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  'mparentViewController = mView //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView As MobileScreen, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  'mparentViewController = mView.ViewControllerHandle //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setBccRecipients(recipients() as Text)
		  declare sub setRecipients Lib MessageUIKitLib selector "setBccRecipients:" (obj_id as ptr, recip as ptr)
		  setRecipients(self,NSArraryFromTextArray(recipients))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCcRecipients(recipients() as Text)
		  declare sub setRecipients Lib MessageUIKitLib selector "setCcRecipients:" (obj_id as ptr, recip as ptr)
		  setRecipients(self,NSArraryFromTextArray(recipients))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setDelegate(del as ptr)
		  declare sub setDelegate_ lib MessageUIKitLib selector "setMailComposeDelegate:" (obj_id as ptr, del as ptr)
		  setDelegate_(self,del)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMessage(msg as Text, isHTML as Boolean = False)
		  declare sub setMessage_ lib MessageUIKitLib selector "setMessageBody:isHTML:" (obj_id as ptr, msg as CFStringRef, isHTML as Boolean)
		  setMessage_(self,msg,isHTML)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSubject(subject as Text)
		  declare sub setSubject_ lib MessageUIKitLib selector "setSubject:" (obj_id as ptr, subject as CFStringRef)
		  setSubject_(self,subject)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setToRecipients(recipients() as Text)
		  declare sub setRecipients Lib MessageUIKitLib selector "setToRecipients:" (obj_id as ptr, recip as ptr)
		  setRecipients(self,NSArraryFromTextArray(recipients))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Add new TargetClassMethodHelper("mailComposeController:didFinishWithResult:error:", AddressOf impl_didFinishWithResult, "v@:@i@")
		    targetID = BuildTargetClass("NSObject","MFMailComposeDelegate",methods)
		  end if
		  Return targetID
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		FinishCallback As FinishDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController_ As iOSView
	#tag EndProperty


	#tag Constant, Name = MessageUIKitLib, Type = Text, Dynamic = False, Default = \"MessageUI.framework", Scope = Public
	#tag EndConstant


	#tag Enum, Name = MFMailComposeResult, Type = Integer, Flags = &h0
		cancelled = 0
		  saved
		  sent
		failed
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
