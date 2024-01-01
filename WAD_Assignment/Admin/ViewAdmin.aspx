<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="ViewAdmin.aspx.cs" Inherits="WAD_Assignment.Admin.ViewAdmin" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       .btnStyleCss{
            background-color: yellow; 
            color: black; 
            padding: 10px 10px; 
            border: 5px solid yellow;
            text-align: center; 
        }
   </style>
    <div id="addAdminForm">
        <h1><b>View Admin</b></h1>
        <div class="ViewAdminForm">
            <br />
            <table style="width:100%;">
                <tr>
                    <td>Staff ID</td>
                    <td><asp:Label ID="lblStaffID" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Name</td>
                    <td><asp:Label ID="lblStaffName" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Email</td>
                    <td><asp:Label ID="lblStaffEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Phone Number</td>
                    <td><asp:Label ID="lblStaffPhoneNo" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Password</td>
                    <td><asp:Label ID="lblStaffPassword" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Position</td>
                    <td><asp:Label ID="lblStaffPosition" runat="server" /></td>
                </tr>
                <tr>
                    <td>Staff Salary</td>
                    <td><asp:Label ID="lblStaffSalary" runat="server" /></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="btnStyleCss" PostBackUrl="~/Admin/AdminCRUD.aspx" />
        </div>
    </div>
</asp:Content>