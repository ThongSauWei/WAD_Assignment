<%@ Page Language="C#" MasterPageFile="AdminHeader.Master" AutoEventWireup="true" CodeBehind="AdminMain.aspx.cs" Inherits="testing.AdminMain" %>

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
        
        Please select any menu selection<br />
        on the left to proceed.<br />
        

    </div>

</asp:Content>