<%@ Page Language="C#" MasterPageFile="~/error/Error.Master" AutoEventWireup="true" CodeBehind="GeneralError.aspx.cs" Inherits="WAD_Assignment.error.GeneralError" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="error-attention">Uh-Oh!</p>
    <br />
    <p class="error-type">Seems like there is an unexpected error occurred!</p>
    <br />
    <p class="error-type">You can either refresh or back to home page.</p>
    <asp:Button ID="btnHomePage" CssClass="btnHomePage" runat="server" Text="Back to Home Page" PostBackUrl="~/Guest/HomePage/Homepage.aspx" />
</asp:Content>
