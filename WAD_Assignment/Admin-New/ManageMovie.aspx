<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ManageMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageMovie" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .movie-content {
            max-width: 1300px;
            margin-right: auto;
            margin-left: auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, auto));
            gap: 2rem;
            margin-top: 180px;
        }

        div.movie-img {
            width: 100%;
            height: 330px;
        }

        .movie h3 {
            font-size: 16px;
            font-weight: 500;
            margin-top: 10px;
            color: #fbfaf8;
        }

        .movie span {
            font-size: 14px;
            margin-top: 10px;
            color: #dfdddb;
        }

        .btnEdit, .btnDelete {
            border: none;
            width: 100%;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btnEdit, .btnConfirm {
            background-color: #2ec92e;
            margin-top: 20px;
        }

        .btnEdit:hover, .btnConfirm:hover {
            background-color: #51e451;
        }

        .btnEdit:active, .btnConfirm:active {
            background-color: green;
        }

        .btnDelete, .btnCancel {
            background-color: red;
        }

        .btnDelete:hover, .btnCancel:hover {
            background-color: #f14747;
        }

        .btnDelete:active, .btnCancel:active {
            background-color: #a70202;
        }

        div.add-movie {
            width: 100%;
            margin: 40px auto;
        }

        .btnAdd {
            background-color: #ecd261;
            border: none;
            width: 15%;
            height: 50px;
            border-radius: 10px;
            font-size: 16px;
            color: white;
            margin-left: 42.5%;
        }

        .deletePanel {
            width: 400px;
            height: 120px;
            position: absolute;
            top: 40%;
            left: 37%;
            border: none;
            background-color: #8b8672;
            border-radius: 10px;
        }

        .deletePanel h3 {
            color: white;
            text-align: center;
        }

        .btnConfirm, .btnCancel {
            width: 25%;           
            margin-bottom: 20px;
            border: none;            
            cursor: pointer;
            color: white;
            font-size: 16px;
        }

        .btnConfirm {
            margin-left: 10%;
        }

        .btnCancel {
            margin-left: 30%;
        }
    </style>

    <div class="movie-content">
        <div class="movie">
            <div class="movie-img">
                <img src="../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit1" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="" />
            <asp:Button ID="btnDelete1" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit2" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="" />
            <asp:Button ID="btnDelete2" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit3" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="" />
            <asp:Button ID="btnDelete3" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
        <div class="movie">
            <div class="movie-img">
                <img src="../image/movie1.jpg" width="100%" height="100%" />
            </div>
            <h3>Thanksgiving</h3>
            <span>1h 12min | Horror</span>
            <asp:Button ID="btnEdit4" CssClass="btnEdit" runat="server" Text="Edit" PostBackUrl="" />
            <asp:Button ID="btnDelete4" CssClass="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
    </div>
    <div class="add-movie">
        <asp:Button ID="btnAdd" CssClass="btnAdd" runat="server" Text="Add New Movie" PostBackUrl="" />
    </div>
    <asp:Panel ID="deletePanel" CssClass="deletePanel" runat="server" Visible="False">
        <h3>Are you sure you want to delete this movie?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClientClick="alert('You have deleted this movie');" PostBackUrl="~/Admin-New/ManageMovie.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
</asp:Content>
 