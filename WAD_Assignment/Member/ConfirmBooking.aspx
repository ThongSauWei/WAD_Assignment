<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ConfirmBooking.aspx.cs" Inherits="WAD_Assignment.Member.ConfirmBooking" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ConfirmBooking.css" rel="stylesheet" />

    <form id="form1" runat="server">
        <div class="confirm-booking">
            <div class="show-movie">
                <div class="movie-image">
                    <img src="../image/movie-image1.jpg" width="100%" height="100%" />
                </div>
                <div class="movie-detail">
                    <h3>MOVIE TITLE</h3>
                    <h5>Age | Language | Duration</h5>
                    <br />
                    <h5>Cast</h5>
                    <br />
                    <h5>Date Time</h5>
                </div>
                <div class="logo">
                    <img src="../image/cinemaLogo.png" width="100%" height="100%" />
                </div>
            </div>
            <div class="check-booking">
                <div class="seatSelected">
                    <asp:Label ID="seatText" CssClass="label" runat="server" Text="Seat(s) Selected :"></asp:Label>
                    <asp:Label ID="lblSeat" CssClass="value" runat="server" Text="A1,B2,C3"></asp:Label>
                </div>
                <hr />
                <div class="calculate-price">
                    <div class="unit-price">
                        <asp:Label ID="priceText" CssClass="label" runat="server" Text="Unit Price"></asp:Label>
                        <span class="separator">:</span>
                        <asp:TextBox ID="txtPrice" CssClass="value" runat="server" Text="RM 101.00"></asp:TextBox>
                    </div>
                    <div class="quantity">
                        <asp:Label ID="qtyText" CssClass="label" runat="server" Text="Quantity"></asp:Label>
                        <span class="separator">:</span>
                        <asp:TextBox ID="txtQty" CssClass="value" runat="server" Text="x 3"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <div class="total-price">
                        <asp:Label ID="totalText" CssClass="label" runat="server" Text="Total Price"></asp:Label>
                        <span class="separator">:</span>
                        <asp:TextBox ID="txtTotal" CssClass="value" runat="server" Text="RM 303.00"></asp:TextBox>
                </div>
                <hr />
                <div class="buttons">
                    <asp:Button ID="btnReserve" runat="server" Text="Reserve" OnClick="btnReserve_Click" />
                    <asp:Button ID="btnPurchase" runat="server" Text="Purchase" OnClick="btnPurchase_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
