<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WAD_Assignment.Member.WebForm1" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Booking.css" rel="stylesheet" />
    <div class="movie">
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="booking-content">
                    <div class="movie-seat">
                        <div>
                            <div class="screen">
                                <img src="../image/screen.png" width="100%" height="100%" />
                            </div>
                        </div>
                        <table class="select-seat">
                            <tr>
                                <td class="seat">
                                    <asp:ImageButton ID="E1" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E2" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E3" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E4" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E5" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="pathway" rowspan="9"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E6" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E7" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E8" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E9" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="E10" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9" class="row-gap"></td>
                                <td colspan="9" class="row-gap"></td>
                            </tr>
                            <tr>
                                <td class="seat">
                                    <asp:ImageButton ID="D1" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D2" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D3" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D4" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D5" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat">
                                    <asp:ImageButton ID="D6" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D7" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D8" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D9" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="D10" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9" class="row-gap"></td>
                                <td colspan="9" class="row-gap"></td>
                            </tr>
                            <tr>
                                <td class="seat">
                                    <asp:ImageButton ID="C1" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C2" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C3" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C4" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C5" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat">
                                    <asp:ImageButton ID="C6" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C7" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C8" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C9" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="C10" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9" class="row-gap"></td>
                                <td colspan="9" class="row-gap"></td>
                            </tr>
                            <tr>
                                <td class="seat">
                                    <asp:ImageButton ID="B1" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B2" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B3" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B4" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B5" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat">
                                    <asp:ImageButton ID="B6" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B7" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B8" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B9" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="B10" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9" class="row-gap"></td>
                                <td colspan="9" class="row-gap"></td>
                            </tr>
                            <tr>
                                <td class="seat">
                                    <asp:ImageButton ID="A1" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A2" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A3" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A4" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A5" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat">
                                    <asp:ImageButton ID="A6" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A7" CssClass="seat-button" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/booked.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A8" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A9" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                                <td class="seat-gap"></td>
                                <td class="seat">
                                    <asp:ImageButton ID="A10" CssClass="seat-button" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="legend">
                        <div class="legend-item">
                            <img src="../image/checked.png" />
                            <span class="legend-desc">Selected</span>
                        </div>
                        <div class="legend-item">
                            <img src="../image/chair.png" />
                            <span class="legend-desc">Vacancy</span>
                        </div>
                        <div class="legend-item">
                            <img src="../image/booked.png" />
                            <span class="legend-desc">Occupied</span>
                        </div>
                    </div>
                </div>
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
