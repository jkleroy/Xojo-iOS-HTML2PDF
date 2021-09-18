#tag IOSView
Begin iosView vHome
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "HTML 2 PDF"
   Top             =   0
   Begin iOSTable Table
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AutoLayout      =   Table, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   Table, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   503.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      SectionCount    =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  me.BackButtonTitle = " "
		  
		  Dim section As Integer
		  
		  Dim cell As iOSTableCellData
		  
		  section = table.AddSection("Examples")
		  
		  cell = table.CreateCell("Hello World", "", Nil, iOSTableCellData.AccessoryTypes.Disclosure)
		  cell.Tag = "hello"
		  table.AddRow(section, cell)
		  
		  
		  cell = table.CreateCell("Website", "", Nil, iOSTableCellData.AccessoryTypes.Disclosure)
		  cell.Tag = "website"
		  table.AddRow(section, cell)
		  
		  cell = table.CreateCell("Invoice Example", "", Nil, iOSTableCellData.AccessoryTypes.Disclosure)
		  cell.Tag = "invoice"
		  table.AddRow(section, cell)
		  
		  
		  section = table.AddSection("Donate")
		  cell = table.CreateCell("Donate for the PDF class", "", Nil, iOSTableCellData.AccessoryTypes.Disclosure)
		  cell.Tag = "purchase"
		  table.AddRow(section, cell)
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Table
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  
		  Dim cell As iOSTableCellData = Me.RowData(section, row)
		  
		  Select Case cell.Tag
		    
		  Case "hello"
		    
		    //Render some HTML
		    Dim html As Text
		    html = "<!DOCTYPE html>" + _
		    "<html>" +_
		    "<head>" +_
		    "<meta name=""viewport"" content=""initial-scale=1.0"" />" +_
		    "<meta charset=""UTF-8"" />" +_
		    "</head>" +_
		    "<body>" +_
		    "<h1>Hello World!</h1>" +_
		    "<p>This will be exported to PDF</p>" +_
		    "</body>" +_
		    "</html>"
		    
		    Dim v As New vHTMLPreview(html, "hello world.pdf")
		    v.Title = cell.Text
		    self.PushTo(v)
		    
		  Case "website"
		    
		    Dim v As New vHTMLPreview("https://www.google.com", "google.pdf")
		    v.Title = "Google"
		    self.PushTo(v)
		    
		  Case "invoice"
		    
		    
		    Dim inv As New InvoiceGenerator
		    
		    Dim html As Text = inv.GenerateInvoice
		    
		    Dim v As New vHTMLPreview(html, "invoice.pdf")
		    v.Title = cell.Text
		    Self.PushTo(v)
		    
		  Case "purchase"
		    
		    MessageBox("Donate to my Paypal account: contact@jeremieleroy.com")
		    
		    
		    
		  End Select
		  
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
#tag EndViewBehavior
