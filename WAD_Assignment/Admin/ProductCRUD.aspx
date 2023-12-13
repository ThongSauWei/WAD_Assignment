<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ProductCRUD.aspx.cs" Inherits="WAD_Assignment.Admin.ProductCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        </style>
    <script type="text/javascript">
        function deleteMovie() {
            var result = confirm("Are you sure you want to delete?");
            if (result) {
                // User clicked "OK"
                alert("Delete confirmed!");
            } else {
                // User clicked "Cancel" or closed the dialog
                alert("Delete canceled!");
            }
        }

        function redirectToDetailsPage() {
            window.location.href = 'Detail.aspx';
        }

        function redirectToMenuPage() {
            window.location.href = 'Menu.aspx';
        }

    </script>

<div>
    <h2 class="h2-section-title">PRODUCT CRUD</h2>
    <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Movie ID</td>
                    <td class="auto-style2">Movie Name</td>
                </tr>
                <tr>
                    <td class="auto-style1">10001</td>
                    <td class="auto-style2">Aquaman and the Lost Kingdom</td>
                    <td>
                        <asp:Button ID="btnRedirect" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnRedirect0" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">10002</td>
                    <td class="auto-style2">War On Terror: KL Anarki</td>
                    <td>
                        <asp:Button ID="btnRedirect1" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnDelete0" runat="server" OnClick="btnDelete_Click" Text="Delete" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnRedirect2" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
                    </td>
                </tr>
            </table>
</div>
</asp:Content>