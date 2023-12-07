<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WAD_Assignment.Member.WebForm1" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>
    <style type="text/css">
        td.seat {
            border:1px solid black;
            width:25px;
            height:25px;
        }

        .empty {
            width: 100%;
            height: 100%;
            border: none;
            cursor: pointer;
        }

        div.event-seat {
            float: left;
            width: 50%;
            border: 1px solid black;
            height: 267px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
        <div class="event-seat">
            <table style="width:30%;">
            <tr>
                <td class="seat">
                    <asp:Button ID="Button1" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button2" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button3" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button4" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button5" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
            </tr>
            <tr>
                <td class="seat" style="width: 25px">
                    <asp:Button ID="Button6" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button7" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button8" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button9" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button10" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
            </tr>
            <tr>
                <td class="seat" style="width: 25px">
                    <asp:Button ID="Button11" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button12" CssClass="empty" runat="server" Text="" disabled="true" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button13" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button14" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
                <td class="seat">
                    <asp:Button ID="Button15" CssClass="empty" runat="server" Text="" onclick="btnSeat_Click" />
                </td>
            </tr>
        </table>
        </div>
        <br />
        <br />
        <asp:Label ID="lblSeat" runat="server"></asp:Label>
    </form>
</body>
</html>