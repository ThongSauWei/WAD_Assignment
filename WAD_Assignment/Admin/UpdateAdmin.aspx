<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="UpdateAdmin.aspx.cs" Inherits="WAD_Assignment.Admin.UpdateAdmin" %>
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

    <style>
    function updateAdmin() {
        alert("Update successful!");
    }
    </style>
    <div id="registerForm">
        <h2 style="text-align: center;" class="RH1">EDIT</h2>
            <table style="width:100%;">
            <tr>
                    <td>Staff ID</td>
                    <td><asp:TextBox ID="txtStaffID" runat="server" EnableViewState="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Staff Name</td>
                    <td><asp:TextBox ID="txtStaffName" runat="server" EnableViewState="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Staff Email</td>
                    <td><asp:TextBox ID="txtStaffEmail" runat="server" EnableViewState="true"/></td>
                </tr>
                <tr>
                    <td>Staff Phone Number</td>
                    <td><asp:TextBox ID="txtStaffPhoneNo" runat="server" EnableViewState="true"/></td>
                </tr>
                <tr>
                    <td>Staff Password</td>
                    <td><asp:TextBox ID="txtStaffPassword" runat="server" EnableViewState="true"/></td>
                </tr>
                <tr>
                    <td>Staff Position</td>
                    <td><asp:TextBox ID="txtStaffPosition" runat="server" EnableViewState="true"/></td>
                </tr>
                <tr>
                    <td>Staff Salary</td>
                    <td><asp:TextBox ID="txtSalary" runat="server" EnableViewState="true"/></td>
                </tr>
            </table>   
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btnStyleCss" OnClientClick="updateAdmin()" OnClick="btnUpdate_Click" />

        </div>
</asp:Content>