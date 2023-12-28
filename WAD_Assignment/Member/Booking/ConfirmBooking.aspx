<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="ConfirmBooking.aspx.cs" Inherits="WAD_Assignment.Member.ConfirmBooking" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ConfirmBooking.css" rel="stylesheet" />

    <div class="confirm-booking">
        <div class="show-movie">
            <div class="movie-image">
                <asp:Image ID="movieImg" width="100%" height="100%" runat="server" />
            </div>
            <div id="movieDetail" class="movie-detail" runat="server">

            </div>
            <div class="logo">
                <img src="../../image/cinemaLogo.png" width="100%" height="100%" />
            </div>
        </div>
        <div class="check-booking">
            <div class="seatSelected">
                <asp:Label ID="seatText" CssClass="label" runat="server" Text="Seat(s) Selected :"></asp:Label>
                <asp:Label ID="lblSeat" CssClass="value" runat="server" Text=""></asp:Label>
            </div>
            <hr />
            <div class="calculate-price">
                <div class="unit-price">
                    <asp:Label ID="priceText" CssClass="label" runat="server" Text="Unit Price"></asp:Label>
                    <span class="separator">:</span>
                    <asp:TextBox ID="txtPrice" CssClass="value" runat="server" Text="" readonly="true"></asp:TextBox>
                </div>
                <div class="quantity">
                    <asp:Label ID="qtyText" CssClass="label" runat="server" Text="Quantity"></asp:Label>
                    <span class="separator">:</span>
                    <asp:TextBox ID="txtQty" CssClass="value" runat="server" Text="" readonly="true"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="total-price">
                <asp:Label ID="totalText" CssClass="label" runat="server" Text="Total Price"></asp:Label>
                <span class="separator">:</span>
                <asp:TextBox ID="txtTotal" CssClass="value" runat="server" Text="" readonly="true"></asp:TextBox>
            </div>
            <hr />
            <div class="buttons">
                <asp:Button ID="btnReserve" runat="server" Text="Reserve"  />
                <asp:Button ID="btnPurchase" runat="server" Text="Purchase"  PostBackUrl="~/Member/Booking/Payment.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
