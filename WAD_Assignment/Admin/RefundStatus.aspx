<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="RefundStatus.aspx.cs" Inherits="WAD_Assignment.Admin.RefundStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <h1>REFUND STATUS</h1>
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

            
        <br />
        <br />
        <br />
        <asp:Button ID="btnRedirect8" runat="server" Text="Back to Admin Main Page" OnClientClick="redirectToAdminMain()" PostBackUrl="~/Admin/AdminMain.aspx"/>


        </div>
</asp:Content>