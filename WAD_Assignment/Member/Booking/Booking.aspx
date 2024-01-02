<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="WAD_Assignment.Member.WebForm1" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Booking.css" rel="stylesheet" />

    <div class="movie">
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="booking-content">
                    <div class="movie-seat">
                        <div>
                            <div class="screen">
                                <img src="../../image/screen.png" width="100%" height="100%" />
                            </div>
                        </div>
                        <table id="seatTable" class="select-seat" runat="server">
                            
                        </table>
                    </div>
                    <div class="legend">
                        <div class="legend-item">
                            <img src="../../image/checked.png" />
                            <span class="legend-desc">Selected</span>
                        </div>
                        <div class="legend-item">
                            <img src="../../image/chair.png" />
                            <span class="legend-desc">Vacancy</span>
                        </div>
                        <div class="legend-item">
                            <img src="../../image/booked.png" />
                            <span class="legend-desc">Occupied</span>
                        </div>
                    </div>
                </div>
                <div id="proceedDiv" runat="server" class="proceed-div">
                    <div class="seatSelected">
                        <div class="seatLabel">
                            <asp:Label ID="lblSeatSelection" runat="server" Text="Seat(s) Selected: "></asp:Label>
                            <asp:Label ID="lblSeats" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="booking-button">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
                        </div>
                        <asp:HiddenField ID="ticketPrice" runat="server" />
                        <asp:HiddenField ID="scheduleID" runat="server" />
                        <asp:HiddenField ID="dateField" runat="server" />
                        <asp:HiddenField ID="timeField" runat="server" />
                    </div>
                    <asp:Label Id="errorMsg" CssClass="error-msg" runat="server" Text=""></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
