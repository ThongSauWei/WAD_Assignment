<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="myBooking.aspx.cs" Inherits="WAD_Assignment.MyBooking.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="bookingStyles.css" rel="stylesheet" />

    <div class="mybooking-container">

        <h1 class="my-booking-Booking">My Booking
        </h1>

        <h2 class="my-booking-header">Active Booking
        </h2>
        <!-- long card -->
        <div id="activeBooking" runat="server">

        </div>
        <h2 class="my-booking-header">History
        </h2>
        <div id="passiveBooking" runat="server">

        </div>
    </div>
</asp:Content>
