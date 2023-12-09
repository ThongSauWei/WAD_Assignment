<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WAD_Assignment.Member.WebForm1" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>
    <link href="Booking.css" rel="stylesheet" />
</head>
<body>
    <div class="movie">
        <div class="movie-image"><img src="../image/movie-image1.jpg" width="100%" height="100%" /></div>
        <div class="movie-detail">
            <h3>MOVIE TITLE</h3>
            <h5>Age | Language | Duration</h5>
            <br />
            <h5>Cast</h5>
            <br />
            <h5>Date Time</h5>
        </div>
        <form id="form1" runat="server">
            <div class="content">
                <div class="movie-seat">
                    <div>
                        <div class="screen">Screen</div>
                    </div>
                    <table class="select-seat">
                        <tr>
                            <td class="seat">
                                <asp:ImageButton ID="C1" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C2" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C3" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C4" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C5" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="pathway" rowspan="5"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C6" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C7" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C8" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C9" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="C10" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9" class="row-gap"></td>
                            <td colspan="9" class="row-gap"></td>
                        </tr>
                        <tr>
                            <td class="seat">
                                <asp:ImageButton ID="B1" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B2" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B3" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B4" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B5" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat">
                                <asp:ImageButton ID="B6" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B7" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B8" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B9" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="B10" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9" class="row-gap"></td>
                            <td colspan="9" class="row-gap"></td>
                        </tr>
                        <tr>
                            <td class="seat">
                                <asp:ImageButton ID="A1" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A2" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A3" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A4" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A5" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat">
                                <asp:ImageButton ID="A6" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A7" CssClass="empty" runat="server" disabled="true" OnClick="Seat_Click" ImageUrl="~/image/profile-user.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A8" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A9" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
                            </td>
                            <td class="seat-gap"></td>
                            <td class="seat">
                                <asp:ImageButton ID="A10" CssClass="empty" runat="server" OnClick="Seat_Click" ImageUrl="~/image/chair.png" />
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
                        <img src="../image/profile-user.png" />
                        <span class="legend-desc">Occupied</span>
                    </div>
                </div>
            </div>
            <div class="seatSelected">
                <asp:Label ID="lblSeatSelection" runat="server" Text="Seat(s) Selected: <br />"></asp:Label>
                <asp:Label ID="lblSeats" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </form>
    </div>
</body>
</html>
