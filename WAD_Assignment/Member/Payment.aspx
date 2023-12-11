<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD_Assignment.Member.Payment" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Payment.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="ticket">
            <div class="movie-detail">
                <div class="movie-image">
                    <img src="../image/movie-image1.jpg" width="100%" height="100%" />
                </div>
                <div class="movie-desc">
                    <h2>Movie Title</h2>
                    <h4>Age | Language | Duration</h4>
                    <br />
                    <h4>Cast</h4>
                    <br />
                    <h4>Date Time</h4>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
