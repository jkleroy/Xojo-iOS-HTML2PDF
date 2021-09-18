#tag IOSView
Begin iosView vPDFPreview
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "PDF Preview"
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
   Begin iOSSharingPanel Sharing
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Dim tb As iOSToolButton = iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemAction)
		  tb.Tag = "share"
		  Self.Toolbar.Add tb
		  
		  tb =  iOSToolButton.FlexibleSpace
		  self.Toolbar.Add tb
		  
		  tb = iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemCompose)
		  tb.Tag = "email"
		  Self.Toolbar.Add tb
		  
		  
		  tb =  iOSToolButton.FlexibleSpace
		  Self.Toolbar.Add tb
		  
		  tb = iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemTrash)
		  tb.Tag = "trash"
		  Self.Toolbar.Add tb
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  
		  Select Case button.Tag
		    
		  Case "share"
		    
		    Sharing.ShareURL(pdfFile.URLPath, Self, HTMLView)
		    
		  Case "email"
		    
		    If Extensions.MFMailComposeViewController.canSendMail = False Then
		      
		      MessageBox("Can't send email from simulator")
		      Return
		      
		    Else
		      
		      Dim mf As New Extensions.MFMailComposeViewController
		      mf.setMessage(&u0A + "File attached: " + pdfFile.Name)
		      mf.addAttachment(pdfFile, "application/pdf", pdfFile.Name)
		      mf.PresentInView(self)
		      
		    End If
		    
		  Case "trash"
		    
		    pdfFile.Delete
		    Self.Close
		    
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(pdfFile As Xojo.IO.FolderItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  self.pdfFile = pdfFile
		  
		  HTMLView.LoadURL( pdfFile.URLPath )
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pdfFile As Xojo.IO.FolderItem
	#tag EndProperty


#tag EndWindowCode

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
