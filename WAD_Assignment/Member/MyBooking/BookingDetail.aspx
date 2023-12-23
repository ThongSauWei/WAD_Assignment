<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="BookingDetail.aspx.cs" Inherits="WAD_Assignment.MyBooking.BookingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="bookingStyles.css" rel="stylesheet" />

    <div class="mybooking-container">
        <article class="mov-details">
            <img
                src="../../image/movie-image1.jpg"
                alt="INSERT_ALT"
                width="270"
                height="405" />
            <div class="mov-content">
                <p>Booking ID <span>B001</span></p>
                <p>Movie ID <span>M001</span></p>
                <p>Movie Name <span>The Avengers</span></p>
                <p>Hall <span>10</span></p>
                <div class="col">
                    <p>Movie Date <span>11/12/2023</span></p>
                    <p>Movie Time <span>7:30pm</span></p>
                </div>
                <div class="col">
                    <p>Classification <span>P13</span></p>
                    <p>No of Ticket <span>2</span></p>
                </div>
                <p>Seat No <span>D12,D13</span></p>
                <div class="col">
                    <p>Amount <span>RM 28.00</span></p>
                    <p>Payment Type <span>Credit Card</span></p>
                </div>
                <p>Purchase Date <span>09/12/2023</span></p>

                <div class="btn-group">
                    <button class="btn print">
                        Print
                    </button>
                    <a class="btn cancel" href="Cancel.aspx">Cancel & Refund
                    </a>
                </div>
            </div>
        </article>
    </div>

</asp:Content>
