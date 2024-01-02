<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Completed.aspx.cs" Inherits="WAD_Assignment.MyBooking.Completed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="bookingStyles.css" rel="stylesheet" />

    <main class="confirm-container" style="opacity: 1; transform: none;">
        <div class="confirm-center">
            <article class="confirm-content">
                <img
                    src="../../image/confirm.png"
                    alt="confirmImage"
                    width="90"
                    height="95" />
                <p class="confirm-step">STEP 2 OF 2</p>
                <div class="confirm-refund">
                    <div class="row">
                        <p>Refund ID </p>
                        <p id="pRefundID" runat="server"></p>
                    </div>
                    <div class="row">
                        <p>Refund Date </p>
                        <p id="pRefundDate" runat="server"></p>
                    </div>
                    <div class="row">
                        <p>Amount</p>
                        <p id="pRefundAmount" runat="server"></p>
                    </div>
                </div>
                <div class="terms">
                    <p>
                        <input type="checkbox" id="term" name="term" class="term" />
                        <label for="term">I have read the <a href="#">terms &amp; conditions</a>.</label>
                    </p>
                </div>
            </article>
            <asp:HiddenField ID="reason" runat="server" />
            <asp:HiddenField ID="desc" runat="server" />
            <asp:HiddenField ID="ticketIDField" runat="server" />
            <asp:Button ID="btnSubmit" CssClass="btnSubmit" runat="server" Text="Submit" OnClick="submitRefund_Click" />
        </div>


    </main>

    <div id="popUpContainer">
        <div class="popUpMes">
            <h1>Refund request submitted</h1>
            <p>We're processing your request. We'll repond as soon as possible. Thank You</p>
            <button id="close" class="close" onclick="window.location.href = '~/Guest/HomePage/Homepage.aspx'">OK</button>
        </div>
    </div>

    <script src="Completed.js" type="text/javascript"></script>

</asp:Content>



