#tag Class
Protected Class HTML2PDFXC
	#tag Method, Flags = &h1
		Protected Shared Function Allocate(clsRef as ptr) As ptr
		  Declare Function alloc Lib FoundationLib selector "alloc" (clsRef As ptr) As ptr
		  Return alloc(clsRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function CGRectMake(x As CGFloat, y As CGFloat, width As CGFloat, height As CGFloat) As CGRect
		  
		  Dim xr As new Xojo.Core.Rect(x, y, width, height)
		  
		  Dim origin As CGPoint
		  origin.x = x
		  origin.y = y
		  
		  Dim size As CGSize
		  size.width = width
		  size.height = height
		  
		  Dim rect As CGRect
		  rect.origin = origin
		  rect.rsize = size
		  
		  Return rect
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  
		  Declare Function NSClassFromString Lib FoundationLib (clsName As CFStringRef) As ptr
		  
		  Dim c As ptr = NSClassFromString("UIPrintPageRenderer")
		  Dim a As ptr = Allocate(c)
		  Dim i As ptr = Initialize(a)
		  
		  
		  m_id = i
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(filename As Text)
		  
		  self.Constructor
		  
		  mfilename = filename
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  
		  Release(m_id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawDemo(rect As Xojo.Core.Rect)
		  
		  
		  Declare Function UIGraphicsGetCurrentContext Lib UIKitLib() As ptr
		  Declare Sub CGContextSetRGBStrokeColor Lib CoreGraphicsLib (context As ptr, red As CGFloat, green As CGFloat, blue As CGFloat, alpha As CGFloat)
		  
		  
		  Declare Sub CGContextMoveToPoint Lib CoreGraphicsLib (context As ptr, x As CGFloat, y As CGFloat)
		  Declare Sub CGContextAddLineToPoint Lib CoreGraphicsLib (context As ptr, w As CGFloat, h As CGFloat)
		  Declare Sub CGContextStrokePath Lib CoreGraphicsLib (context As ptr)
		  
		  
		  
		  Dim context As ptr = UIGraphicsGetCurrentContext
		  
		  //Red color
		  CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0)
		  
		  
		  'For y as Integer = 50 to PageHeight-50 step 50
		  '
		  '// Draw a horizontal line.
		  'CGContextMoveToPoint(context, 20, y)
		  'CGContextAddLineToPoint(context, rect.Width - 20, y)
		  'CGContextStrokePath(context)
		  '
		  '
		  'Next
		  
		  Declare Function stringWithString Lib FoundationLib selector "stringWithString:" ( cls As Ptr, value As CFStringRef ) As Ptr
		  Declare Function boldSystemFontOfSize Lib UIKitLib selector "boldSystemFontOfSize:" (obj_ref As ptr, size As CGFloat) as ptr
		  Declare Sub CGContextSetRGBFillColor Lib CoreGraphicsLib (context As ptr, red As CGFloat, green As CGFloat, blue As CGFloat, alpha As CGFloat)
		  declare Sub drawInRect lib FoundationLib selector "drawInRect:withFont:" (obj_id As Ptr, rect As CGRect, attribs As Ptr)
		  
		  CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0)
		  
		  
		  Dim demoString As Ptr = stringWithString( NSClassFromString("NSString" ), "DEMO")
		  
		  
		  Dim fontPtr As ptr = boldSystemFontOfSize(NSClassFromString("UIFont"), 48)
		  Dim strRect As CGRect = CGRectMake(rect.Center.x-150, rect.Center.y, 300, 150)
		  
		  drawInRect(demoString, strRect, fontPtr)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawPDFUsingPrintPageRenderer() As ptr
		  Declare Function initWithLength_ Lib FoundationLib selector "initWithLength:" (obj_id As ptr, length As UInteger) As ptr
		  Dim data As ptr //NSMutableData
		  
		  data = (initWithLength_(self.Allocate(NSClassFromString("NSMutableData")), 0))
		  
		  //The declares needed for PDF Generation
		  Declare Sub UIGraphicsBeginPDFContextToData Lib UIKitLib (data As ptr, bounds As CGRect, documentInfo As ptr)
		  Declare Sub UIGraphicsBeginPDFPage Lib UIKitLib ()
		  Declare Sub UIGraphicsEndPDFContext Lib UIKitLib ()
		  Declare Function UIGraphicsGetPDFContextBounds Lib UIKitLib As CGRect
		  Declare Sub drawPageAtIndex Lib UIKitLib selector "drawPageAtIndex:inRect:" (obj_id As ptr, index As Integer, rect As CGRect)
		  
		  
		  UIGraphicsBeginPDFContextToData(data, CGRectMake(0, 0, 0, 0), Nil)
		  
		  UIGraphicsBeginPDFPage
		  
		  Dim bnds As CGRect = UIGraphicsGetPDFContextBounds
		  
		  
		  Dim rect As new Xojo.Core.Rect(bnds.origin.x, bnds.origin.y, bnds.rsize.width, bnds.rsize.height)
		  
		  
		  drawPageAtIndex(Self.id, 0, UIGraphicsGetPDFContextBounds)
		  
		  
		  //Remove this when decrypting the class
		  'DrawDemo(rect)
		  
		  
		  UIGraphicsEndPDFContext
		  
		  
		  
		  Return data
		  
		  
		  
		  'let data = NSMutableData
		  '
		  'UIGraphicsBeginPDFContextToData(data, CGRectZero, Nil)
		  '
		  'UIGraphicsBeginPDFPage
		  '
		  'printPageRenderer.drawPageAtIndex(0, inRect: UIGraphicsGetPDFContextBounds)
		  '
		  'UIGraphicsEndPDFContext
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4578706F72747320746865207061737365642048544D4C436F6E74656E7420746F2061205044462066696C652E
		Sub ExportHTMLContentToPDF(HTMLContent As Text)
		  
		  Prepare()
		  
		  Declare Function initMarkupText Lib FoundationLib selector "initWithMarkupText:" (obj_id As ptr, content as CFStringRef) As ptr
		  
		  //we instantiate a UIMarkupTextPrintFormatter Object, where we pass the HTML content As a parameter
		  Dim printFormatter As ptr
		  
		  Dim content As CFStringRef = HTMLContent
		  
		  printFormatter = (initMarkupText(self.Allocate(NSClassFromString("UIMarkupTextPrintFormatter")), content))
		  
		  //The page formatter Is added To the Print page renderer Object
		  Declare Sub addPrintFormatter Lib UIKitLib selector "addPrintFormatter:startingAtPageAtIndex:" (obj_id As ptr, formatter As ptr, index As Integer)
		  
		  addPrintFormatter(self.id, printFormatter, 0)
		  
		  //Getting the data
		  
		  Dim pdfData As ptr = DrawPDFUsingPrintPageRenderer
		  
		  
		  Dim block As Xojo.Core.MemoryBlock = Self.SmartMemoryBlock(pdfData)
		  
		  
		  
		  //Writing the PDF in the App's document folder
		  Dim file As Xojo.IO.FolderItem = xojo.io.SpecialFolder.Documents.Child(filename)
		  
		  Dim stream As Xojo.IO.BinaryStream = xojo.io.BinaryStream.Create(file)
		  stream.Write(block)
		  stream.Close
		  
		  mPDFFile = file
		  
		  
		  RaiseEvent PDFAvailable(mPDFFile)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4578706F72747320746865207061737365642048544D4C436F6E74656E7420746F2061205044462066696C652E
		Sub ExportHTMLViewerToPDF(HTMLViewer As iOSHTMLViewer)
		  
		  Prepare()
		  
		  Declare Function initMarkupText Lib FoundationLib selector "initWithMarkupText:" (obj_id As ptr, content as CFStringRef) As ptr
		  
		  //we instantiate a UIMarkupTextPrintFormatter Object, where we pass the HTML content As a parameter
		  Dim printFormatter As ptr
		  
		  'Dim content As CFStringRef = HTMLContent
		  
		  Declare function viewPrintFormatter lib "UIKit.framework" selector "viewPrintFormatter" (obj_id as ptr) as ptr
		  
		  printFormatter = viewPrintFormatter(HTMLViewer.Handle)
		  
		  'printFormatter = (initMarkupText(self.Allocate(NSClassFromString("UIMarkupTextPrintFormatter")), content))
		  
		  //The page formatter Is added To the Print page renderer Object
		  Declare Sub addPrintFormatter Lib UIKitLib selector "addPrintFormatter:startingAtPageAtIndex:" (obj_id As ptr, formatter As ptr, index As Integer)
		  
		  addPrintFormatter(self.id, printFormatter, 0)
		  
		  //Getting the data
		  
		  Dim pdfData As ptr = DrawPDFUsingPrintPageRenderer
		  
		  
		  Dim block As Xojo.Core.MemoryBlock = Self.SmartMemoryBlock(pdfData)
		  
		  
		  
		  //Writing the PDF in the App's document folder
		  Dim file As Xojo.IO.FolderItem = xojo.io.SpecialFolder.Documents.Child(filename)
		  
		  Dim stream As Xojo.IO.BinaryStream = xojo.io.BinaryStream.Create(file)
		  stream.Write(block)
		  stream.Close
		  
		  mPDFFile = file
		  
		  
		  RaiseEvent PDFAvailable(mPDFFile)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function id() As ptr
		  Return self.m_id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Initialize(obj_id as ptr) As ptr
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Return init(obj_id)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib FoundationLib (clsName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0, Description = 43616C6C656420746F207072657061726520504446206F7574707574207768656E206368616E67696E672050616765576964746820616E6420506167654865696768742070726F706572746965732E
		Sub Prepare()
		  Declare Sub setValue_ Lib FoundationLib selector "setValue:forKey:" (obj_id As ptr, value As ptr, key As CFStringRef)
		  
		  Declare Function valueWithCGRect Lib UIKitLib  selector "valueWithCGRect:" (id As ptr, value As CGRect) As ptr
		  
		  
		  Dim pageFrame As CGRect = Self.CGRectMake(0, 0, PageWidth, PageHeight)
		  
		  setValue_(self.id, valueWithCGRect(NSClassFromString("NSValue"), pageFrame), "paperRect")
		  
		  
		  //Inset by 10px
		  Dim printFrame As CGRect = self.CGRectMake(10, 10, PageWidth-10, PageHeight-10)
		  
		  setValue_(self.id, valueWithCGRect(NSClassFromString("NSValue"), printFrame), "printableRect")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub Release(obj As ptr, needsExtraRelease As Boolean = False)
		  
		  Declare Sub release Lib UIKitLib selector "release" (obj_id As ptr)
		  release(obj)
		  
		  If needsExtraRelease Then release(obj)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Retain(ref as ptr) As ptr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetContents()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFilename(filename As Text)
		  
		  mfilename = filename
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SmartMemoryBlock(data As ptr) As Xojo.Core.MemoryBlock
		  
		  Declare Function length_ Lib FoundationLib selector "length" (obj_id As ptr) As UInteger
		  Dim length as UInteger = length_(data)
		  
		  Dim buffer As New Xojo.Core.MemoryBlock(length)
		  Declare Sub getBytes_ Lib FoundationLib selector "getBytes:length:" (obj_id As ptr, buffer As ptr, length As UInteger)
		  getBytes_(data, buffer.Data, length)
		  
		  Return buffer
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Error(err As RuntimeException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PDFAvailable(file As Xojo.IO.FolderItem)
	#tag EndHook


	#tag Note, Name = About
		
		Inspired by
		https://www.appcoda.com/pdf-generation-ios/
		
		
		Donate on Paypal to contact@jeremieleroy.com
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mfilename
			End Get
		#tag EndGetter
		filename As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mfilename As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPDFFile As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_id As ptr
	#tag EndProperty

	#tag Property, Flags = &h0
		PageHeight As Double = 841.8
	#tag EndProperty

	#tag Property, Flags = &h0
		PageWidth As Double = 595.2
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865205044462066696C6520637265617465642E2057696C6C206265206E696C206966207468652063616C6C20746F204578706F727448544D4C436F6E74656E74546F504446206661696C65642E
		#tag Getter
			Get
			  return mPDFFile
			End Get
		#tag EndGetter
		PDFFile As Xojo.IO.FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = CoreGraphicsLib, Type = Text, Dynamic = False, Default = \"CoreGraphics.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = Text, Dynamic = False, Default = \"Foundation.Framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = Double, Dynamic = False, Default = \"1.1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIKitLib, Type = Text, Dynamic = False, Default = \"UIKit.Framework", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CGPoint, Flags = &h21
		x As CGFloat
		y as CGFloat
	#tag EndStructure

	#tag Structure, Name = CGRect, Flags = &h21
		origin as CGPoint
		rsize as CGSize
	#tag EndStructure

	#tag Structure, Name = CGSize, Flags = &h21
		width As CGFloat
		height As CGFloat
	#tag EndStructure


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
		#tag ViewProperty
			Name="filename"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageWidth"
			Visible=false
			Group="Behavior"
			InitialValue="595.2"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageHeight"
			Visible=false
			Group="Behavior"
			InitialValue="841.8"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
