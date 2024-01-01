<%@ Page Language="C#" MasterPageFile="AdminHeader.Master" AutoEventWireup="true" CodeBehind="ViewRefund.aspx.cs" Inherits="testing.WebForm2" %>
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
    <div id="refundForm">
        <h1><b>Refund Status</b></h1>
        <div class="ViewRefundForm">
            <br />
            <table style="width:100%;">
                <tr>
                    <td>Refund ID</td>
                    <td><asp:Label ID="lblRefundId" runat="server" /></td>
                </tr>
                <tr>
                    <td>Refund Reason</td>
                    <td><asp:Label ID="lblRefundReason" runat="server" /></td>
                </tr>
                <tr>
                    <td>Refund Description</td>
                    <td><asp:Label ID="lblRefundDesc" runat="server" /></td>
                </tr>
                <tr>
                    <td>Refund Date</td>
                    <td><asp:Label ID="lblRefundDate" runat="server" /></td>
                </tr>
                <tr>
                    <td>Ticket Id</td>
                    <td><asp:Label ID="lblTicketId" runat="server" /></td>
                </tr>
                
            </table>
            <br />
            <asp:Button ID="btnAccept" runat="server" Text="Update" CssClass="btnStyleCss" OnClientClick="redirectToUpdatePage()" PostBackUrl="~/Update.aspx" />
            <asp:Button ID="btnReject" runat="server" Text="Done" CssClass="btnStyleCss" PostBackUrl="~/AdminCRUD.aspx" />
        </div>
    </div>
</asp:Content>