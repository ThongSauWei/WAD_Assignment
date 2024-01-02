<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="WAD_Assignment.MyBooking.cancel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="bookingStyles.css" rel="stylesheet" />

    <main class="cancel-container" style="opacity: 1; transform: none;">

        <div class="cancel-center">
            <article class="cancel-content">
                <img
                    src="../../image/refund.png"
                    alt="cancelImage"
                    width="200"
                    height="110" />
                <p class="cancel-step">STEP 1 OF 2</p>
                <div class="cancel-refund">
                    <div class="row">
                        <p>Ticket ID </p>
                        <p id="pTicketID" runat="server"></p>
                    </div>
                    <div class="row">
                        <p>Refund Reason </p>
                        <asp:DropDownList id="ddlReason" class="refundReason" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Wrong Date/Time</asp:ListItem>
                            <asp:ListItem>Wrong Movie</asp:ListItem>
                            <asp:ListItem>Emergency Issue</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="row">
                        <p>State your reason</p>
                        <asp:TextBox ID="txtDesc" CssClass="refundState" runat="server" maxlength="100" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <asp:HiddenField ID="ticketIDField" runat="server" />
                <asp:HiddenField ID="amountField" runat="server" />
            </article>
            <asp:Button ID="proceedBtn" runat="server" CssClass="cancel-next" PostBackUrl="~/Member/MyBooking/Completed.aspx" Text="Next" />
        </div>


    </main>

</asp:Content>
