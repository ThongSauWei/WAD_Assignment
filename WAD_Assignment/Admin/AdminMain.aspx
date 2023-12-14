<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="AdminMain.aspx.cs" Inherits="WAD_Assignment.Admin.AdminMain" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">

        /* Change the color of the HyperLink text to white */
        #HyperLinkAdminCRUD,
        #HyperLinkMemberCRUD,
        #HyperLinkProductCRUD,
        #HyperLinkRefundStatus {
            color: white;
        }

    </style>

    <script>
        function redirectToHomePage() {
            window.location.href = 'Homepage.aspx';
        }

    </script>

    <div class="table-container">
        <h1>ADMIN PAGE</h1><br />
        <h3>What do you want to do?</h3>
        <p>&nbsp;</p>
        <asp:HyperLink ID="HyperLinkAdminCRUD" runat="server" NavigateUrl="~/AdminCRUD.aspx">Admin CRUD</asp:HyperLink>
        &nbsp;<br />
        <br />
        <asp:HyperLink ID="HyperLinkMemberCRUD" runat="server" NavigateUrl="~/MemberCRUD.aspx">Member CRUD</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLinkProductCRUD" runat="server" NavigateUrl="~/Admin-New/ManageMovie.aspx">Manage Movie</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLinkRefundStatus" runat="server" NavigateUrl="~/RefundStatus.aspx">Refund Status</asp:HyperLink>
        &nbsp;&nbsp;

        <br />
        <br />
        <br />
        <asp:Button ID="btnRedirect" runat="server" Text="Back to Homepage" OnClientClick="redirectToHomePage()" PostBackUrl="~/Homepage/Homepage.aspx" />


    </div>

</asp:Content>
