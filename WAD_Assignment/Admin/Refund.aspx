<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Refund.aspx.cs" Inherits="WAD_Assignment.Admin.Refund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <title>Refund Status</title>
        <style type="text/css">


* {
    box-sizing: border-box;
    font-family: var(--primary-font), "Helvetica Neue", Helvetica, Arial, sans-serif;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

        .auto-style1 {
            width: 150px;
        }
        .auto-style2 {
            width: 250px;
        }
        .auto-style3 {
            width: 300px;
        }
        </style>

    <script type="text/javascript">
        function confirmAccept() {
            var result = confirm("Are you sure you want to accept?");
            if (result) {
                // User clicked "OK"
                alert("Acceptance confirmed!");
            } else {
                // User clicked "Cancel" or closed the dialog
                alert("Acceptance canceled!");
            }
        }

        function confirmReject() {
            var result = confirm("Are you sure you want to reject?");
            if (result) {
                // User clicked "OK"
                alert("Rejection confirmed!");
            } else {
                // User clicked "Cancel" or closed the dialog
                alert("Rejection canceled!");
            }
        }

    </script>

        <div>
            <h2 class="h2-section-title">REFUND STATUS</h2>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Booking ID</td>
                    <td class="auto-style2">Movie Name</td>
                    <td class="auto-style3">User email</td>
                </tr>
                <tr>
                    <td class="auto-style1">90001</td>
                    <td class="auto-style2">Aquaman and the Lost Kingdom</td>
                    <td class="auto-style3">ali@gmail.com</td>
                    <td>
                        <asp:Button ID="btnAccept" runat="server" Text="Accept" OnClick="btnAccept_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnReject" runat="server" Text="Reject" OnClick="btnReject_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">90002</td>
                    <td class="auto-style2">War On Terror: KL Anarki</td>
                    <td class="auto-style3">beauti@gmail.com</td>
                    <td>
                        <asp:Button ID="btnAccept0" runat="server" Text="Accept" OnClick="btnAccept_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnReject0" runat="server" Text="Reject" OnClick="btnReject_Click" />
                    </td>
                </tr>
            </table>

        </div>
</asp:Content>