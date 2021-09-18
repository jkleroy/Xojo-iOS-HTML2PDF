#tag Module
Protected Module Extensions
	#tag Method, Flags = &h0
		Sub AddControlAtPoint(extends mView as iOSView, ctrl as iOSControl, pt as xojo.Core.Point)
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  pt.x)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  pt.y)
		  mView.AddConstraint(top)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlCenter(extends mView as iOSContainerControl, ctrl as iOSControl, size as xojo.Core.size)
		  mView.AddControl(ctrl)
		  
		  Dim centerX As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.CenterX, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.CenterX, _
		  1, 0)
		  mView.AddConstraint(centerX)
		  
		  Dim centerY As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.CenterY, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.CenterY, _
		  1, 0)
		  mView.AddConstraint(centerY)
		  
		  Dim Width As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Width, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  nil, _
		  iOSLayoutConstraint.AttributeTypes.None, _
		  1, _
		  size.Width)
		  mView.AddConstraint(width)
		  
		  Dim Height As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Height, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  nil, _
		  iOSLayoutConstraint.AttributeTypes.none, _
		  1, size.Height)
		  mView.AddConstraint(height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlCenter(extends mView as iOSView, ctrl as iOSControl, size as xojo.Core.size)
		  mView.AddControl(ctrl)
		  
		  Dim centerX As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.CenterX, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.CenterX, _
		  1, 0)
		  mView.AddConstraint(centerX)
		  
		  Dim centerY As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.CenterY, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.CenterY, _
		  1, 0)
		  mView.AddConstraint(centerY)
		  
		  Dim Width As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Width, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  Nil, _
		  iOSLayoutConstraint.AttributeTypes.None, _
		  1, _
		  size.Width)
		  mView.AddConstraint(width)
		  
		  Dim Height As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Height, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  Nil, _
		  iOSLayoutConstraint.AttributeTypes.none, _
		  1, size.Height)
		  mView.AddConstraint(height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlFullScreen(extends mView as iOSView, ctrl as iOSControl, bottomBound As Boolean = False)
		  
		  
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  0)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  0)
		  mView.AddConstraint(top)
		  
		  Dim width As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Width, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.width, _
		  1, _
		  0)
		  mView.AddConstraint(width)
		  
		  If bottomBound Then
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		    
		  Else
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Top, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		  End If
		  
		  'Dim height As New iOSLayoutConstraint(ctrl, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  'iOSLayoutConstraint.RelationTypes.Equal, _
		  'mView, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  '1, _
		  '0)
		  'mView.AddConstraint(height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlFullScreen(extends mView As MobileScreen, ctrl As iOSControl, bottomBound As Boolean = False)
		  
		  
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  0)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  0)
		  mView.AddConstraint(top)
		  
		  Dim width As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Width, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.width, _
		  1, _
		  0)
		  mView.AddConstraint(width)
		  
		  If bottomBound Then
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		    
		  Else
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Top, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		  End If
		  
		  'Dim height As New iOSLayoutConstraint(ctrl, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  'iOSLayoutConstraint.RelationTypes.Equal, _
		  'mView, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  '1, _
		  '0)
		  'mView.AddConstraint(height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlFullScreen(extends mView As MobileScreen, ctrl As MobileUIControl, bottomBound As Boolean = False)
		  
		  
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  0)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  0)
		  mView.AddConstraint(top)
		  
		  Dim width As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Width, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.width, _
		  1, _
		  0)
		  mView.AddConstraint(width)
		  
		  If bottomBound Then
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		    
		  Else
		    
		    Dim bottom As New iOSLayoutConstraint(ctrl, _
		    iOSLayoutConstraint.AttributeTypes.Bottom, _
		    iOSLayoutConstraint.RelationTypes.Equal, _
		    mView.BottomLayoutGuide, _
		    iOSLayoutConstraint.AttributeTypes.Top, _
		    1, _
		    0)
		    mView.AddConstraint(bottom)
		  End If
		  
		  'Dim height As New iOSLayoutConstraint(ctrl, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  'iOSLayoutConstraint.RelationTypes.Equal, _
		  'mView, _
		  'iOSLayoutConstraint.AttributeTypes.height, _
		  '1, _
		  '0)
		  'mView.AddConstraint(height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlWithBounds(extends mView as iOSContainerControl, ctrl as iOSControl, bounds as xojo.Core.Rect)
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  bounds.left)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  bounds.top)
		  mView.AddConstraint(top)
		  
		  Dim right As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Trailing, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  bounds.right)
		  mView.AddConstraint(right)
		  
		  Dim bottom As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.bottom, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.top, _
		  1, _
		  bounds.bottom)
		  mView.AddConstraint(bottom)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControlWithBounds(extends mView as iOSView, ctrl as iOSControl, bounds as xojo.Core.Rect)
		  mView.AddControl(ctrl)
		  
		  Dim left As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  bounds.left)
		  mView.AddConstraint(left)
		  
		  Dim top As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Top, _
		  1, _
		  bounds.top)
		  mView.AddConstraint(top)
		  
		  Dim right As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.Trailing, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.Leading, _
		  1, _
		  bounds.Right)
		  mView.AddConstraint(right)
		  
		  
		  Dim bottom As New iOSLayoutConstraint(ctrl, _
		  iOSLayoutConstraint.AttributeTypes.bottom, _
		  iOSLayoutConstraint.RelationTypes.Equal, _
		  mView, _
		  iOSLayoutConstraint.AttributeTypes.top, _
		  1, _
		  bounds.bottom)
		  mView.AddConstraint(bottom)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddGestureRecognizer(extends mview as iosView, recognizer as UIGestureRecognizer)
		  declare sub addGestureRecognizer lib UIKitLib selector "addGestureRecognizer:" _
		  (view as ptr, recognizer as ptr)
		  
		  
		  Dim viewPtr As Ptr
		  #if XojoVersion >= 2020.02 then
		    
		    viewPtr = mview.Handle
		    
		  #else
		    declare function view_ lib UIKitLib selector "view" (obj_id as ptr) as ptr
		    
		    viewPtr = view_(mview.Handle)
		  #endif
		  
		  declare function view lib UIKitLib selector "view" (obj_id as ptr) as ptr
		  addGestureRecognizer(viewPtr, recognizer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeBase64(extends aText as text) As Text
		  declare function initWithBase64EncodedString lib FoundationLib selector "initWithBase64EncodedString:options:" _
		  (obj_id as ptr, str as CFStringRef, options as Integer) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  
		  dim mData as ptr = initWithBase64EncodedString(alloc(NSClassFromString("NSData")), aText, 1)
		  
		  const NSUTF8StringEncoding = 4
		  
		  declare function initWithData lib FoundationLib selector "initWithData:encoding:" (obj_id as ptr, data as ptr, encoding as Integer) as CFStringRef
		  Return initWithData(alloc(NSClassFromString("NSString")), mData, NSUTF8StringEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeviceOrientation() As Integer
		  
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function currentDevice_ lib UIKitLib selector "currentDevice" (clsRef as ptr) as ptr
		  declare function orientation_ lib UIKitLib selector "orientation" (obj_id as ptr) as integer
		  Dim ori As Integer = orientation_(currentDevice_(NSClassFromString("UIDevice")))
		  Select Case ori
		  Case 0
		    //unknown
		  Case 1
		    //portrait
		  Case 2
		    //protraitUpsideDown
		  Case 3
		    //landscapeleft
		  Case 4
		    //landscapeRight
		  Case 5
		    //faceUp
		  Case 6
		    //faceDown
		    
		  End Select
		  
		  Return ori
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncodeBase64(extends aText as Text) As Text
		  declare function dataUsingEncoding lib FoundationLib selector "dataUsingEncoding:" (obj_id as ptr, encoding as Integer) as ptr
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (obj_id as ptr, str as CFStringRef) as ptr
		  
		  const NSUTF8StringEncoding = 4
		  dim str as Ptr = stringWithString(NSClassFromString("NSString"), aText)
		  dim mData as ptr = dataUsingEncoding(str,NSUTF8StringEncoding)
		  
		  declare function base64EncodedStringWithOptions lib FoundationLib selector "base64EncodedStringWithOptions:" _
		  (obj_id as ptr, options as Integer) as CFStringRef
		  
		  Return base64EncodedStringWithOptions(mData,1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame(extends mView as iOSView) As NSRect
		  #if Target32Bit
		    declare function frame_ lib UIKitLib selector "frame" (view as ptr) as NSRect32
		  #Elseif Target64Bit
		    declare function frame_ lib UIKitLib selector "frame" (view as ptr) as NSRect64
		  #Endif
		  
		  Return frame_(mView.View)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAppVersion() As Text
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function mainBundle lib FoundationLib selector "mainBundle" (clsRef as ptr) as ptr
		  declare function objectForInfoDictionaryKey lib FoundationLib selector "objectForInfoDictionaryKey:" _
		  (obj_id as ptr, key as CFStringRef) as CFStringRef
		  
		  '#if DebugBuild
		  'Dim v As Text = objectForInfoDictionaryKey(mainBundle(NSClassFromString("NSBundle")), "CFBundleVersionKey")
		  'v = v
		  '#endif
		  
		  Return objectForInfoDictionaryKey(mainBundle(NSClassFromString("NSBundle")), "CFBundleShortVersionString")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getGUID() As Text
		  declare function NSClassFromString lib "Foundation" (clsName as cfstringref) as ptr
		  dim UIDevicePtr as ptr = NSClassFromString("UIDevice")
		  declare function currentDevice lib "UIKit" selector "currentDevice" (clsRef as ptr) as ptr
		  dim currentDevicePtr as ptr = currentDevice(UIDevicePtr)
		  
		  declare function identifierForVendor lib "UIKit" selector "identifierForVendor" (obj_id as ptr) as ptr
		  Dim NSUUIDPtr As ptr = identifierForVendor(currentDevicePtr)
		  
		  declare function UUIDString lib "Foundation" selector "UUIDString" (obj_id as ptr) as cfstringref
		  dim GUID as Text = UUIDString(NSUUIDPtr)
		  
		  return GUID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getiOSVersion() As Double
		  
		  Static sSystemVersion As Double
		  
		  //Get sSystemVersion only once
		  If sSystemVersion = 0.0 Then
		    
		    Declare Function currentDevice_ Lib UIKitLib selector "currentDevice" (clsRef As ptr) As ptr
		    Declare Function systemversion_ Lib UIKitLib selector "systemVersion" (obj_id As ptr) As CFStringRef
		    Dim device As Ptr = currentDevice_(NSClassFromString("UIDevice"))
		    Dim systemVersion As Text = systemversion_(device)
		    
		    Try
		      sSystemVersion = Double.FromText(systemVersion)
		    Catch
		    End Try
		    
		  End If
		  
		  Return sSystemVersion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSystemSoundNames() As Text()
		  static systemSounds as Foundation.NSArray
		  
		  if systemSounds = nil then
		    
		    dim returnArray as new Foundation.NSMutableArray
		    
		    dim librarySourcesEnumerator as Ptr
		    
		    declare function NSSearchPathForDirectoriesInDomains lib FoundationLib (dir as Integer, mask as Integer, yesNo as Boolean) as ptr
		    declare function objectEnumerator lib FoundationLib selector "objectEnumerator" (obj_id as ptr) as ptr
		    const NSAllDomainsMask = 65535
		    const NSLibraryDirectory = 5
		    
		    librarySourcesEnumerator = objectEnumerator(NSSearchPathForDirectoriesInDomains( NSLibraryDirectory, NSAllDomainsMask, True))
		    
		    declare function nextObject lib FoundationLib selector "nextObject" (obj_id as ptr) as ptr
		    
		    dim sourcePath as Foundation.NSString
		    
		    Declare function defaultManager lib FoundationLib selector "defaultManager" (clsRef as ptr) as ptr
		    declare function enumeratorAtPath lib FoundationLib selector "enumeratorAtPath:" (obj_id as ptr, path as ptr) as ptr
		    Declare Function stringByAppendingPathComponent lib FoundationLib selector "stringByAppendingPathComponent:" (obj_id as ptr, component as CFStringRef) as ptr
		    declare function stringByDeletingPathExtension lib FoundationLib selector "stringByDeletingPathExtension" (obj_id as Ptr) as ptr
		    declare function soundNamed lib FoundationLib selector "soundNamed:" (clsRef as ptr, name as ptr) as ptr
		    
		    Break
		    dim sourcePathPtr as ptr = nextObject(librarySourcesEnumerator)
		    
		    while sourcePathPtr <> nil
		      sourcePath = new NSString(sourcePathPtr)
		      
		      dim tmp as Ptr = defaultManager(NSClassFromString("NSFileManager"))
		      dim tmpStr as new NSString(stringByAppendingPathComponent(sourcePath, "Sounds"))
		      
		      dim soundSource as ptr = enumeratorAtPath(tmp, tmpStr)
		      dim soundFile as Foundation.NSString
		      dim soundFilePtr as ptr = nextObject(soundSource)
		      while soundFilePtr <> nil
		        soundFile = new NSString(soundFilePtr)
		        if soundNamed(NSClassFromString("NSSound"), stringByDeletingPathExtension(soundFile)) <> nil then
		          returnArray.Append new NSString(stringByDeletingPathExtension(soundFile))
		        end if
		        soundFilePtr = nextObject(soundSource)
		      wend
		      sourcePathPtr = nextObject(librarySourcesEnumerator)
		    wend
		    
		    declare function sortedArrayUsingSelector lib FoundationLib selector "sortedArrayUsingSelector:" (obj_id as ptr, sel as ptr) as ptr
		    systemSounds = new NSArray(sortedArrayUsingSelector(returnArray, NSSelectorFromString("compare:")))
		  end if
		  
		  Return systemSounds.TextArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isIPad() As Boolean
		  declare function currentDevice_ lib UIKitLib selector "currentDevice" (clsRef as ptr) as ptr
		  declare function model_ lib UIKitLib selector "model" (obj_id as ptr) as CFStringRef
		  dim model as Text = model_(currentDevice_(NSClassFromString("UIDevice")))
		  dim isPad as boolean = model.BeginsWith("iPad")
		  
		  
		  
		  Return isPad
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isiPhoneX() As Boolean
		  
		  Static value As Boolean
		  if value then Return True
		  
		  Declare Function mainScreen Lib UIKitLib selector "mainScreen" (clsRef As ptr) As ptr
		  
		  #If Target32Bit
		    Return False
		    
		  #ElseIf Target64Bit
		    Declare Function nativebounds Lib UIKitLib selector "nativeBounds" (obj_id As Ptr) As CGRect64
		    Dim sz As CGSize64 = nativeBounds(mainScreen(NSClassFromString("UIScreen"))).rsize
		    
		    If sz.w = 1125 And sz.h = 2436 Then 
		      value = True
		      Return True
		    End If
		    
		    if sz.h / sz.w >= 2 then
		      value = True
		      Return True
		    end if
		    
		  #EndIf
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MsgBox(title as Text, message as text = "")
		  Dim msg As New iOSMessageBox
		  msg.Buttons = Array("OK")
		  msg.Title = title
		  msg.Message = message
		  msg.Show
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NetworkActivityIndicatorVisible(visible as Boolean)
		  Declare function NSClassFromString lib "Foundation" (clsName as cfstringref) as ptr
		  Declare function sharedApplication_ lib "UIKit" selector "sharedApplication" (clsRef as ptr) as ptr
		  Declare sub setNetworkActivityIndicatorVisible_ lib "UIKit" selector "setNetworkActivityIndicatorVisible:" (obj_id as ptr, yesNo as Boolean)
		  
		  setNetworkActivityIndicatorVisible_(sharedApplication_(NSClassFromString("UIApplication")), visible)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSArraryFromTextArray(strings() as Text) As ptr
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  
		  dim NSMutableArrayRef as ptr = init(alloc(NSClassFromString("NSMutableArray")))
		  
		  declare sub addObject lib FoundationLib selector "addObject:" (obj_id as ptr, obj as CFStringRef)
		  for i as Integer = 0 to Strings.LastIndex
		    if not Strings(i).Empty then
		      addObject(NSMutableArrayRef, strings(i))
		    end if
		  next
		  
		  Return NSMutableArrayRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSDataFromFolderitem(f as xojo.IO.FolderItem) As ptr
		  Declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  declare function dataWithContentsOfFile lib FoundationLib selector "dataWithContentsOfFile:" (clsRef as Ptr, path as CFStringRef) as Ptr
		  
		  if f = nil then
		    dim r as NilObjectException = new NilObjectException
		    r.Reason = "An NSData object can only be created from a valid folderitem."
		    Raise r
		    Return nil
		  end if
		  dim NSDataRef as ptr = dataWithContentsOfFile(NSClassFromString("NSData"), f.Path)
		  
		  Return NSDataRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentViewController(extends aView as iOSView, viewControllerToPresent as UIViewController, animated as Boolean, completion as iOSBlock)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		  if completion <> nil then
		    presentViewController_(aView.ViewControllerHandle, viewControllerToPresent, animated, completion.Handle)
		  else
		    presentViewController_(aView.ViewControllerHandle, viewControllerToPresent, animated, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentViewController(extends aView as MobileScreen, viewControllerToPresent as UIViewController, animated as Boolean, completion as iOSBlock)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		  if completion <> nil then
		    presentViewController_(aView.ViewControllerHandle, viewControllerToPresent, animated, completion.Handle)
		  else
		    presentViewController_(aView.ViewControllerHandle, viewControllerToPresent, animated, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveGestureRecognizer(extends view as iosView, recognizer as UIGestureRecognizer)
		  declare sub removeGestureRecognizer lib UIKitLib selector "removeGestureRecognizer:" _
		  (viewHandle as ptr, recognizer as ptr)
		  removeGestureRecognizer(view.Handle, recognizer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveToCameraRoll(extends img as iOSImage)
		  declare sub UIImageWriteToSavedPhotosAlbum lib UIKitLib (img as ptr, target as ptr, sel as ptr, info as ptr)
		  UIImageWriteToSavedPhotosAlbum(img.Handle,nil,nil,nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScaleImage(extends img as iOSImage, scaleFactor as Double, mode as InterpolationQuality = InterpolationQuality.Default) As iOSImage
		  dim UIImageRef as ptr = img.Handle
		  
		  declare function size lib UIKitLib selector "size" (obj_id as ptr) as CGSize64
		  dim sz as CGSize64 = size(UIImageRef)
		  dim newSize as CGSize64
		  
		  
		  newSize.w = sz.w * scaleFactor
		  newSize.h = sz.h * scaleFactor
		  
		  
		  declare sub UIGraphicsBeginImageContext lib UIKitLib (mSize as CGSize64)
		  
		  UIGraphicsBeginImageContext(newSize)
		  
		  declare function UIGraphicsGetCurrentContext lib UIKitLib () as ptr
		  dim CGContextRef as ptr = UIGraphicsGetCurrentContext
		  
		  declare sub CGContextSetInterpolationQuality lib CoreGraphicsLib (context as ptr, quality as InterpolationQuality)
		  CGContextSetInterpolationQuality(CGContextRef, mode)
		  
		  
		  declare sub drawInRect lib UIKitLib selector "drawInRect:" (obj_id as ptr, rect as CGRect64)
		  dim r as CGRect64
		  
		  
		  r.origin.x = 0
		  r.origin.y = 0
		  r.rsize.w = newSize.w
		  r.rsize.h = newSize.h
		  
		  drawInRect(UIImageRef,r)
		  
		  declare function UIGraphicsGetImageFromCurrentImageContext lib UIKitLib () as ptr
		  dim newUIImage as Ptr = UIGraphicsGetImageFromCurrentImageContext
		  
		  declare sub UIGraphicsEndImageContext lib UIKitLib ()
		  UIGraphicsEndImageContext
		  
		  Return iOSImage.FromHandle(newUIImage)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenShot(extends aView as iOSView, Retina as Boolean = False) As iOSImage
		  Declare Function mainScreen Lib UIKitLib selector "mainScreen" (clsRef As ptr) As ptr
		  #if Target32Bit
		    declare function bounds lib UIKitLib selector "bounds" (obj_id as Ptr) as CGRect32
		  #Elseif Target64Bit
		    declare function bounds lib UIKitLib selector "bounds" (obj_id as Ptr) as CGRect64
		  #Endif
		  
		  #if Target32Bit
		    dim sz as CGSize32 = bounds(mainScreen(NSClassFromString("UIScreen"))).rsize
		  #Elseif Target64Bit
		    dim sz as CGSize64 = bounds(mainScreen(NSClassFromString("UIScreen"))).rsize
		  #Endif
		  
		  If not Retina then
		    #if Target32Bit
		      declare sub UIGraphicsBeginImageContext lib UIKitLib (mSize as CGSize32)
		    #Elseif Target64Bit
		      declare sub UIGraphicsBeginImageContext lib UIKitLib (mSize as CGSize64)
		    #Endif
		    UIGraphicsBeginImageContext(sz)
		    
		  Else
		    
		    #if Target32Bit
		      declare sub UIGraphicsBeginImageContextWithOptions lib UIKitLib (mSize as CGSize32, opaque as boolean, scale as double)
		    #Elseif Target64Bit
		      declare sub UIGraphicsBeginImageContextWithOptions lib UIKitLib (mSize as CGSize64, opaque as boolean, scale as double)
		    #Endif
		    UIGraphicsBeginImageContextWithOptions(sz, true, 0.0) //0.0 uses current screen scale
		  End If
		  
		  declare function view_ lib UIKitLib selector "view" (obj_id as ptr) as ptr
		  dim viewRef as ptr = view_(aView.ViewControllerHandle)
		  
		  declare function window_ lib UIKitLib selector "window" (obj_id as ptr) as ptr
		  dim windowRef as ptr = window_(viewRef)
		  
		  declare function layer lib UIKitLib selector "layer" (obj_id as ptr) as ptr
		  declare sub renderInContext lib UIKitLib selector "renderInContext:" (obj_id as ptr, ctx as ptr)
		  declare function UIGraphicsGetCurrentContext lib UIKitLib () as ptr
		  renderInContext(layer(windowRef), UIGraphicsGetCurrentContext)
		  
		  declare function UIGraphicsGetImageFromCurrentImageContext lib UIKitLib () as ptr
		  dim newUIImage as Ptr = UIGraphicsGetImageFromCurrentImageContext
		  
		  declare sub UIGraphicsEndImageContext lib UIKitLib ()
		  UIGraphicsEndImageContext
		  
		  Return iOSImage.FromHandle(newUIImage)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNumberOnIcon(badgeNum As Integer)
		  Declare Function sharedApplication Lib UIKitLib Selector "sharedApplication" (obj As Ptr) As Ptr
		  Dim sharedApp As Ptr = sharedApplication(NSClassFromString("UIApplication"))
		  
		  Declare Sub applicationIconBadgeNumber Lib UIKitLib Selector "setApplicationIconBadgeNumber:" (id As Ptr, value As Integer)
		  
		  applicationIconBadgeNumber(sharedApp, badgeNum)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextArray(extends arr as Foundation.NSArray) As Text()
		  dim cnt as Integer = arr.Count-1
		  dim result() as Text
		  for i as Integer = 0 to cnt
		    dim str as new Foundation.NSString(arr.Value(i))
		    result.Add str
		  next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Vibrate()
		  const kSystemSoundID_Vibrate = 4095
		  declare sub AudioServicesPlaySystemSound lib "AudioToolbox.framework" (snd as Integer)
		  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function View(extends cc as iOSContainerControl) As UIView
		  declare function view_ lib UIKitLib selector "view" (obj_id as ptr) as ptr
		  Return new UIView(view_(cc.Handle))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function View(extends piOSView as iOSView) As UIView
		  
		  
		  
		  #if XojoVersion >= 2020.02
		    Return new UIView((piOSView.Handle))
		    
		  #else
		    
		    declare function view_ lib UIKitLib selector "view" (obj_id as ptr) as ptr
		    Return new UIView(view_(piOSView.Handle))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function View(extends piOSView as MobileScreen) As UIView
		  
		  
		  Return new UIView((piOSView.Handle))
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function x_isiPhoneXx() As Boolean
		  
		  Static value As Boolean
		  if value then Return True
		  
		  Declare Function mainScreen Lib UIKitLib selector "mainScreen" (clsRef As ptr) As ptr
		  
		  #If Target32Bit
		    Return False
		    
		  #ElseIf Target64Bit
		    Declare Function nativebounds Lib UIKitLib selector "nativeBounds" (obj_id As Ptr) As CGRect64
		    Dim sz As CGSize64 = nativeBounds(mainScreen(NSClassFromString("UIScreen"))).rsize
		    
		    if sz.h / sz.h >= 2 then
		      value = True
		      Return True
		    end if
		    
		    'If sz.w = 1125 And sz.h = 2436 Then 
		    'value = True
		    'Return True
		    'End If
		    
		  #EndIf
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = CoreGraphicsLib, Type = Text, Dynamic = False, Default = \"CoreGraphics.framework", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CGAffineTransform32, Flags = &h0
		a as single
		  b as single
		  c as single
		  d as single
		  tx as single
		ty as single
	#tag EndStructure

	#tag Structure, Name = CGAffineTransform64, Flags = &h0
		a as double
		  b as double
		  c as double
		  d as double
		  tx as double
		ty as double
	#tag EndStructure

	#tag Structure, Name = CGPoint32, Flags = &h0
		x as single
		y as single
	#tag EndStructure

	#tag Structure, Name = CGPoint64, Flags = &h0
		x as double
		y as double
	#tag EndStructure

	#tag Structure, Name = CGRect32, Flags = &h0
		origin as CGPoint32
		rsize as CGSize32
	#tag EndStructure

	#tag Structure, Name = CGRect64, Flags = &h0
		origin as CGPoint64
		rsize as CGSize64
	#tag EndStructure

	#tag Structure, Name = CGSize32, Flags = &h0
		w as single
		h as single
	#tag EndStructure

	#tag Structure, Name = CGSize64, Flags = &h0
		w as double
		h as double
	#tag EndStructure


	#tag Enum, Name = InterpolationQuality, Type = Integer, Flags = &h0
		Default = 0
		  None = 1
		  Low = 2
		  Medium = 4
		High = 3
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
End Module
#tag EndModule
