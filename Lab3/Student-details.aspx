<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Student-details.aspx.cs" Inherits="Week6.student_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Student Details</h1>

    <div class="form-group">
        <label for="txtLastName" class="col-sm-3 control-label">Last Name:</label>
        <asp:TextBox ID="txtLastName" runat="server" required="required" />
        <asp:HiddenField ID="StudentID" runat="server" />
    </div>
    <div class="form-group">
        <label for="txtFirstMidName" class="col-sm-3 control-label">First Name:</label>
        <asp:TextBox ID="txtFirstMidName" runat="server" required="required" />
    </div>
    <div class="form-group">
        <label for="txtEnrollmentDate" class="col-sm-3 control-label">Enrollment Date:</label>
        <asp:TextBox ID="txtEnrollmentDate" runat="server" required="required" type="text"
             step="1" />
    </div>
    <asp:button class="btn btn-success col-sm-offset-3" id="btnSave"
        runat="server" text="Save" OnClick="btnSave_Click" />
     <asp:button class="btn btn-success col-sm-offset-3" id="btnUpdate"
        runat="server" text="Update" OnClick="btnUpdate_Click" Visible="false" />
</asp:Content>
