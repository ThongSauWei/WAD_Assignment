<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="WAD_Assignment.MyBooking.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="container">
    <!-- long card -->
    <asp:a class="card" href="/ticket?id=???">
        <img 
            src="../image/movie-image1.jpg" 
            alt="INSERT_ALT" 
            width="180"
            height="270"
            />
        <div class="card_content">
            <h2>
                MOVIE_NAME
            </h2>
            <p>
                DESCRIPTION_HERE
            </p>
            <div>
                CATEGORY
            </div>
        </div>
    </asp:a>
    <div class="card">
        <img 
            src="../image/movie-image1.jpg" 
            alt="INSERT_ALT" 
            width="180"
            height="270"
            />
        <div class="card_content">
            <h2>
                MOVIE_NAME
            </h2>
            <p>
                DESCRIPTION_HERE
            </p>
            <div>
                CATEGORY
            </div>
        </div>
    </div>
</div>

</asp:Content>