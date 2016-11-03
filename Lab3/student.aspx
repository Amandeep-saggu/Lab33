
<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="Week6.students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" src="site1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Students</h1>
    <a href="student-details.aspx">Add a Student</a>
    <asp:GridView ID="grdStudents" runat="server" CssClass="table table-striped" AutoGenerateColumns = "false" 
       >
        <Columns>
            <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "ID">
    <ItemTemplate>
        <asp:Label ID="lblID" runat="server"  Text='<%# Eval("StudentID")%>'></asp:Label>
    </ItemTemplate>
   </asp:TemplateField>
            

            <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "FirstName">
    <ItemTemplate>
        <asp:Label ID="lblfname" runat="server"  Text='<%# Eval("FirstMidName")%>'></asp:Label>
    </ItemTemplate>


   </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "LastName">
    <ItemTemplate>
        <asp:Label ID="lbllastname" runat="server"  Text='<%# Eval("LastName")%>'></asp:Label>
    </ItemTemplate></asp:TemplateField>

            
            <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "EnrollmentDate">
    <ItemTemplate>
        <asp:Label ID="lbldate" runat="server"  Text='<%# Eval("EnrollmentDate")%>'></asp:Label>
    </ItemTemplate></asp:TemplateField>

            <asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton ID="lnkRemove" runat="server"
            CommandArgument = '<%# Eval("StudentID")%>'
         OnClientClick = "return confirm('Do you want to delete?')"
        Text = "Delete" OnClick = "DeleteStudent"></asp:LinkButton>
    </ItemTemplate>
    
</asp:TemplateField>
            

             <asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton ID="lnkEdit" runat="server"
            CommandArgument = '<%# Eval("StudentID")%>'
         
        Text = "Edit" OnClick = "EditStudent"></asp:LinkButton>
    </ItemTemplate>
    
</asp:TemplateField>

           <%-- <asp:BoundField DataField="StudentID" HeaderText="ID" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="FirstMidName" HeaderText="First Name" />
            <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" DataFormatString="{0:d}" />--%>
         
        </Columns>
    </asp:GridView>
</asp:Content>