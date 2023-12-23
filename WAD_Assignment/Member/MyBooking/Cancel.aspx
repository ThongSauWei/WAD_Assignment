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
                        <p>T001</p>
                    </div>
                    <div class="row">
                        <p>Refund Reason </p>
                        <asp:DropDownList class="refundReason" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Wrong Date/Time</asp:ListItem>
                            <asp:ListItem>Wrong Movie</asp:ListItem>
                            <asp:ListItem>Wrong Date/Time</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="row">
                        <p>State your reason</p>
                        <textarea class="refundState" maxlength="100"></textarea>
                    </div>
                </div>

            </article>
            <a class="cancel-next" href="Completed.aspx">Next</a>
        </div>


    </main>

</asp:Content>
