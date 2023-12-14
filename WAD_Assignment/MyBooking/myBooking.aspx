<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="myBooking.aspx.cs" Inherits="WAD_Assignment.MyBooking.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="mybooking-container">

    <h1 class="my-booking-Booking">
        My Booking
    </h1>

    <h2 class="my-booking-header">
        Active Booking
    </h2>
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
                    Avengers: Infinity War
                </h3>
                <p>
                    HallNo : 10 
                </p>
                <p>
                    Date & Time : 15/12/2023 1:00pm
                </p>
                <p>
                    SeatNo : D12, D13
                </p>
                <p>
                    Ticket Type : Adult * 2
                </p>
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
                src="../image/movie2.jpg" 
                alt="INSERT_ALT" 
                width="180"
                height="270"
                />
            <div class="card_content">
                <h3>
                    Ant-Man and the Wasp: Quantumania
                </h3>
                <p>
                    HallNo : 10 
                </p>
                <p>
                    Date & Time : 15/12/2023 1:00pm
                </p>
                <p>
                    SeatNo : D12, D13
                </p>
                <p>
                    Ticket Type : Adult * 2
                </p>
                <asp:HyperLink class="refund-btn" runat="server" NavigateUrl="~/MyBooking/BookingDetail.aspx">
                    View More
                </asp:HyperLink>
            </div>
        </article>

</div>

</asp:Content>