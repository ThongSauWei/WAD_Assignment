<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="WAD_Assignment.MyBooking.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="mybooking-container">

    <h1 class="my-booking-header">
        Active Booking
    </h1>

    <!-- long card -->
        <article class="card">
            <img 
                src="../image/movie-image1.jpg" 
                alt="INSERT_ALT" 
                width="180"
                height="270"
                />
            <div class="card_content">
                <h3>
                    MOVIE_NAME
                </h3>
                <p>
                    DESCRIPTION_HERE
                </p>
                <div>
                    CATEGORY
                </div>
                <asp:HyperLink class="refund-btn" runat="server" NavigateUrl="~/MyBooking/BookingDetail.aspx">
                    View More
                </asp:HyperLink>
            </div>
        </article>
        
    <h2 class="my-booking-header">
        History
    </h2>

        <article class="card card-old">
            <img 
                src="../image/movie-image1.jpg" 
                alt="INSERT_ALT" 
                width="180"
                height="270"
                />
            <div class="card_content">
                <h3>
                    MOVIE_NAME
                </h3>
                <p>
                    DESCRIPTION_HERE
                </p>
                <div>
                    CATEGORY
                </div>
                <asp:HyperLink class="refund-btn" runat="server" NavigateUrl="~/MyBooking/BookingDetail.aspx">
                    View More
                </asp:HyperLink>
            </div>
        </article>

</div>

</asp:Content>