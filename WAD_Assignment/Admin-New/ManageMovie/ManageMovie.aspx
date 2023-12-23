<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="ManageMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageMovie" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ManageMovie.css" rel="stylesheet" />

    <div class="movie-content">
        <div class="movie">
            <div class="movie-img">
                <img src="../../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit1" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="~/Admin-New/ManageMovie/EditMovie.aspx" />
            <asp:Button ID="btnDelete1" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit2" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="~/Admin-New/ManageMovie/EditMovie.aspx" />
            <asp:Button ID="btnDelete2" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit3" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="~/Admin-New/ManageMovie/EditMovie.aspx" />
            <asp:Button ID="btnDelete3" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit4" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="~/Admin-New/ManageMovie/EditMovie.aspx" />
            <asp:Button ID="btnDelete4" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
    </div>
    <div class="add-movie">
        <asp:Button ID="btnAdd" CssClass="btnAdd" runat="server" Text="Add New Movie" PostBackUrl="~/Admin-New/ManageMovie/AddMovie.aspx" />
    </div>
    <asp:Panel ID="deletePanel" CssClass="deletePanel" runat="server" Visible="False">
        <h3>Are you sure you want to delete this movie?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClientClick="alert('You have deleted this movie');" PostBackUrl="~/Admin-New/ManageMovie/ManageMovie.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
</asp:Content>
 