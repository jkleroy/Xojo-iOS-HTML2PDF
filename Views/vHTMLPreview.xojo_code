#tag IOSView
Begin iosView vHTMLPreview
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "HTML Preview"
   Top             =   0
   Begin iOSHTMLViewer HTMLView
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   HTMLView, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLView, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   HTMLView, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLView, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      Height          =   503.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
   Begin HTML2PDFXC PDFGenerator
      LockedInPosition=   False
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  me.BackButtonTitle = " "
		  
		  Dim tb As iOSToolButton = iOSToolButton.NewPlain("PDF")
		  
		  tb.Tag = "pdf"
		  
		  Self.RightNavigationToolbar.Add tb
		  
		  
		  
		  'Dim c As Color = &cFF0000
		  '
		  'Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		  'Declare Function colorWithRGBA Lib "UIKit.framework" Selector "colorWithRed:green:blue:alpha:" ( UIColorClassRef As Ptr, red As CGFloat, green As CGFloat, blue As CGFloat, alpha As CGFloat) As Ptr
		  'Declare Function view Lib "UIKit.framework" Selector "view" (UIViewController As Ptr) As Ptr
		  'Declare Sub setBackgroundColor Lib "UIKit.framework" Selector "setBackgroundColor:" (UIView As Ptr, UIColor As Ptr)
		  '
		  'Dim UIColorClassPtr As Ptr =  NSClassFromString("UIColor")
		  'Dim colorPtr As ptr = colorWithRGBA(UIColorClassPtr, (c.red / 255.0), (c.Green / 255.0), (c.Blue / 255.0), (1.0-c.Alpha/255.0))
		  'Dim viewPtr As Ptr = HTMLView.Handle
		  'setBackgroundColor(viewPtr, colorPtr)
		  '
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  
		  Select Case button.Tag
		    
		  Case "pdf"
		    
		    PDFGenerator.SetFilename(filename)
		    
		    if html.Empty then
		      //We are exporting an URL here
		      PDFGenerator.ExportHTMLViewerToPDF(HTMLView)
		      
		    else
		      //We are exporting HTML content here
		      PDFGenerator.ExportHTMLContentToPDF(html)
		      
		      
		    End If
		    
		    
		    
		    'xojo.core.timer.CallLater(100, AddressOf test)
		    
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(data As Text, filename As Text)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.html = data
		  self.filename = filename
		  
		  if data.BeginsWith("http") then
		    
		    HTMLView.LoadURL(data)
		    self.html = ""
		    
		  Else
		    
		    HTMLView.LoadURL( "data:text/html," + URLEncode(data))
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test()
		  Dim xc As New HTML2PDFXC("Invoice.pdf")
		  xc.ExportHTMLContentToPDF(html)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLEncode(url As Text) As Text
		  // Remove newline characters.
		  url = url.ReplaceAll ( &u0A, "" )
		  
		  
		  Declare Function CFURLCreateStringByAddingPercentEscapes Lib "Foundation" (allocator As Ptr, origString As CFStringRef , charactersToLeaveUnescaped As CFStringRef , legalURLCharactersToBeEscaped As cfStringRef,Encoding As UInt32) As CFStringRef
		  
		  url = CFURLCreateStringByAddingPercentEscapes(Nil, url, Nil, Nil, &h08000100)
		  //Extra substitutions
		  url = url.ReplaceAll ( "'", "%27" )
		  
		  Return url
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		filename As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		html As Text
	#tag EndProperty


#tag EndWindowCode

#tag Events PDFGenerator
	#tag Event
		Sub Error(err As RuntimeException)
		  
		  Dim msg As New iOSMessageBox
		  msg.Buttons = Array("OK")
		  msg.Title = "PDF file generation failed"
		  msg.Message = err.Reason
		  msg.Show
		End Sub
	#tag EndEvent
	#tag Event
		Sub PDFAvailable(file As Xojo.IO.FolderItem)
		  
		  if file <> nil then
		    
		    Dim v As New vPDFPreview(file)
		    Self.PushTo(v)
		    
		  Else
		    
		    Dim msg As New iOSMessageBox
		    msg.Buttons = Array("OK")
		    msg.Title = "PDF file generation failed"
		    msg.Message = ""
		    msg.Show
		    
		    
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="html"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
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
#tag EndViewBehavior
