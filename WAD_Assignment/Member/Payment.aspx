<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD_Assignment.Member.Payment" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Payment.css" rel="stylesheet" />
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <form id="form1" runat="server">
        <div class="ticket">
            <div class="left-side">
                <div class="movie-detail">
                    <div class="movie-image">
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
                <div class="total-price">
                    <span class="lblTotalPrice">Total Price</span>
                    <span class="txtTotalPrice">RM 303.00</span>
                    <span class="t-and-c">Price include taxes and all service costs</span>
                </div>
            </div>
            <div class="right-side">
                <div class="payment-detail"></div>
                <div class="checkout">
                    <asp:Button ID="btnPayment" CssClass="payment-button" runat="server" Text="Make a payment" />
                    <ion-icon name='arrow-forward-outline'></ion-icon>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
