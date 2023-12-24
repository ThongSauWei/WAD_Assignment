<%@ Page Language="C#" MasterPageFile="~/error/Error.Master" AutoEventWireup="true" CodeBehind="PageNotFoundError.aspx.cs" Inherits="WAD_Assignment.error.PageNotFoundError" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="error-attention">404 Error</p>
    <br />
    <p class="error-type">Sorry, this page is not available</p>
    <br />
    <p class="error-type">The link is probably broken or removed.</p>
    <asp:Button ID="btnHomePage" CssClass="btnHomePage" runat="server" Text="Back to Home Page" PostBackUrl="~/Guest/HomePage/Homepage.aspx" />
</asp:Content>
