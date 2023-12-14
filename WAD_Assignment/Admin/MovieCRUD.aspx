<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="MovieCRUD.aspx.cs" Inherits="WAD_Assignment.Admin.MovieCRUD" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>

    .auto-style1 {
        width: 204px;
    }
        .auto-style2 {
            width: 110px;
        }
        .auto-style3 {
            width: 184px;
        }

    </style>
    <script type="text/javascript">
        function deleteMember() {
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

        function redirectToAdminMain() {
            window.location.href = 'AdminMain.aspx';
        }

    </script>

    <div class="table-container">
        <h1>MOVIE CRUD PAGE</h1><br />
        <h3>Which movie do you want to amend?</h3>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">MOVIE ID&nbsp;</td>
                <td class="auto-style3">NAME</td>
                <td class="auto-style1">ACTION</td>
            </tr>
            <tr>
                <td class="auto-style2">MV8001</td>
                <td class="auto-style3">WISH</td>
                <td class="left-aligned" style="width: 204px">

                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx"/>
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" OnClientClick="deleteMember(); return false;" Text="Delete" />
                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect0" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">MB8002</td>
                <td class="auto-style3">WONKA</td>
                <td class="left-aligned" style="width: 204px">

                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect1" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete0" runat="server" OnClientClick="deleteMember(); return false;" Text="Delete" />
                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect2" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
            </tr>
            <tr>
                <td class="auto-style2">MB8003</td>
                <td class="auto-style3">AQUAMAN</td>
                <td class="left-aligned" style="width: 204px">

                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect3" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete1" runat="server" OnClientClick="deleteMember(); return false;" Text="Delete" />
                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect4" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">MB8004</td>
                <td class="auto-style3">WAR ON TERROR KL ANARKI</td>
                <td class="left-aligned" style="width: 204px">

                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect5" runat="server" Text="Update" OnClientClick="redirectToDetailsPage()" PostBackUrl="~/Detail/Detail.aspx" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete2" runat="server" OnClientClick="deleteMember(); return false;" Text="Delete" />
                &nbsp;&nbsp;
                <asp:Button ID="btnRedirect6" runat="server" Text="View" OnClientClick="redirectToMenuPage()" PostBackUrl="~/Menu/Menu.aspx" />
                </td>
            </tr>
        </table>

        <br />
        <br />
        <br />
        <asp:Button ID="btnRedirect8" runat="server" Text="Back to Admin Main Page" OnClientClick="redirectToAdminMain()" PostBackUrl="~/Admin/AdminMain.aspx"/>


    </div>
</asp:Content>