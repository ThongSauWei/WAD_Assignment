<%@ Page Language="C#" MasterPageFile="~/error/Error.Master" AutoEventWireup="true" CodeBehind="GeneralError.aspx.cs" Inherits="WAD_Assignment.error.GeneralError" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="../image/minion-warning.gif" width="100px" height="100px">
    <p class="error-type">Seems like there is an unexpected error occurred!</p>
    <asp:Button ID="btnHomePage" CssClass="btnHomePage" runat="server" Text="Back to Home Page" PostBackUrl="~/Guest/HomePage/Homepage.aspx" />
</asp:Content>
