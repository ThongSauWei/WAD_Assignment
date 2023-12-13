<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="AdminMain.aspx.cs" Inherits="WAD_Assignment.Admin.AdminCRUDMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 180px;
        }
        .auto-style2 {
            width: 306px;
        }
    </style>

<div>

    ADMIN PAGE<br />
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">Admin CRUD<br />
            </td>
            <td class="auto-style2">
                <asp:HyperLink ID="HyperLinkAdminCRUD" runat="server" NavigateUrl="~/Admin/AdminCRUD.aspx">Admin CRUD</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Product CRUD<br />
            </td>
            <td class="auto-style2">
                <asp:HyperLink ID="HyperLinkProductCRUD" runat="server" NavigateUrl="~/Admin/ProductCRUD.aspx">Product CRUD</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Refund Status<br />
            </td>
            <td class="auto-style2">
                <asp:HyperLink ID="HyperLinkRefundStatus" runat="server" NavigateUrl="~/Admin/Refund.aspx">Refund Status</asp:HyperLink>
            </td>
        </tr>
    </table>

</div>
</asp:Content>
