<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="ManageMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageMovie" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ManageMovie.css" rel="stylesheet" />
    <div class="all-movie" id="allMovieContent" runat="server">

    </div>
    <div class="add-movie">
        <asp:Button ID="btnAdd" CssClass="btnAdd" runat="server" Text="Add New Movie" PostBackUrl="~/Admin-New/ManageMovie/AddMovie.aspx" />
    </div>
    <asp:Panel ID="removePanel" CssClass="removePanel" runat="server">
        <h3>Are you sure you want to remove this movie?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" PostBackUrl="~/Admin-New/ManageMovie/ManageMovie.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <asp:HiddenField ID="selectedMovie" runat="server" />
</asp:Content>
 