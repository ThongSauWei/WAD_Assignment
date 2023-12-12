<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD_Assignment.Member.Payment" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Payment.css" rel="stylesheet" />
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <div id="form1">
        <div class="ticket">
            <div class="left-side">
                <div class="movie-detail">
                    <img src="../image/movie-image1.jpg" class="movie-image" width="100%" height="100%">
                    <div class="movie-desc">
                        <h2>Movie Title</h2>
                        <h4>Age | Language | Duration</h4>
                        <br />
                        <h4>Cast</h4>
                        <br />
                        <h4>Date Time</h4>
                    </div>
                </div>
                <div class="total-price">
                    <span class="lblTotalPrice">Total Price</span>
                    <span class="txtTotalPrice">RM 303.00</span>
                    <span class="t-and-c">Price include taxes and all service costs</span>
                </div>
            </div>
            <div class="right-side">
                <div class="payment-detail">
                    <div class="payment-method">
                        <span class="payment-text">Payment Method</span>
                        <div class="payment-choice">
                            <button id="btnTng" class="touch-n-go" type="button" onclick="selectCard(1);">
                                <img id="tngImage" class="deselected" src="../image/tng-payment.png" width="80px" height="80px" />
                            </button>
                            <button id="btnCard" class="card" type="button" onclick="selectCard(2);">
                                <img id="cardImage" class="deselected" src="../image/card-payment.png" width="230px" height="80px" />
                            </button>
                        </div>
                        <div class="tngInfo">

                        </div>
                        <div class="cardInfo"></div>
                    </div>
                </div>
                <div class="checkout">
                    <asp:Button ID="btnPayment" CssClass="payment-button" runat="server" Text="Make a payment" />
                    <ion-icon name='arrow-forward-outline'></ion-icon>
                </div>
            </div>
        </div>
    </div>
    <script>
        function selectCard(value) {
            var tng = document.getElementById("tngImage");
            var card = document.getElementById("cardImage");
            var btnTng = document.getElementById("btnTng");
            var btnCard = document.getElementById("btnCard");

            if (value === 1) {
                tng.classList.remove('deselected');
                card.classList.add('deselected');

                btnTng.classList.add('selected');
                btnCard.classList.remove('selected');
            } else if (value === 2) {
                card.classList.remove('deselected');
                tng.classList.add('deselected');

                btnCard.classList.add('selected');
                btnTng.classList.remove('selected');
            }
        }
    </script>
</asp:Content>
