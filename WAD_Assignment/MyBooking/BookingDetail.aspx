<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="BookingDetail.aspx.cs" Inherits="WAD_Assignment.MyBooking.BookingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="mybooking-container">
    <article class="mov-details">
        <img
            src="../image/movie-image1.jpg" 
            alt="INSERT_ALT" 
            width="270"
            height="405"
            />
        <div class="mov-content">
           <p>Booking ID <span></span></p>
           <p>Movie ID <span></span></p>
           <p>Movie Name <span></span></p>
           <p>Hall <span></span></p>
           <div class="col">
               <p>Movie Date <span></span></p>
               <p>Movie Time <span></span></p>
           </div>
           <div class="col">
                <p>Classification <span></span></p>
                <p>No of Ticket <span></span></p>
           </div>           
           <p>Seat No <span></span></p>
           <div class="col">
                <p>Amount <span></span></p>
                <p>Payment Type <span></span></p>
           </div>
           <p>Purchase Date <span></span></p>

            <div class="btn-group">
                <button class="btn print">
                    Print
                </button>
                <a class="btn cancel" href="#">
                    Cancel & Refund
                </a>
            </div>
        </div>
    </article>
</div>

</asp:Content>