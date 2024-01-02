<%@ Page Language="C#" MasterPageFile="~/MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageCustomer.ManageCustomer" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .all-content {
            margin-top: 150px;
        }

        .all-content h2 {
            width: 100%;
            text-align: center;
            color: #ecd261;
            text-transform: uppercase;
        }

        .customer-div {
            width: 80%;
            margin: 20px 10%;
            border-radius: 20px;
            border: none;
            background-color: #17171c;
            height: 50px;
        }

        .customer-div img {
            float: left;
            margin: 10px 10px 0 10px;
        }

        .customer-div span {
            float: left;
            width: 28%;
            text-transform: uppercase;
            margin-top: 15px;
            font-weight: bolder;
            color: #ecd261;
        }

        .btnView {
            background-color: #ecd261;
            border: none;
            width: 10%;
            height: 30px;
            border-radius: 10px;
            font-size: 16px;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
            cursor: pointer;
        }

        .btnView:hover, .back-button {
            background-color: #f1dc56db;
        }

        .btnView:active, .back-button {
            background-color: #f1dc56a6;
        }

        .hidden-panel {
            width: 600px;
            height: 400px;
            position: absolute;
            top: 25%;
            left: 30%;
            border: none;
            background-color: #17171c;
            border-radius: 20px;
            z-index: 100;
        }

        .hidden-panel * {
            float:left;
        }

        .group {
            margin: 10px;
            width: 280px;
            height: 330px;
            border: 1px solid white;
        }

        .cust-info {

        }

        .cust-info span {
            width: 100%;
            color: white;
        }

        .latest-three-movie {

        }

        .latest-three-review {

        }

        .button-group {
            width: 100%;
            display: flex;
            justify-content: space-evenly;
        }

        .button-group * {
            width: 150px;
            height: 30px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
            cursor: pointer;
        }

        .delete-button {
            background-color: red;
        }

        .delete-button:hover {
            background-color: #f14747;
        }

        .delete-button:active {
            background-color: #a70202;
        }

        .back-button {
            background-color: #ecd261;
        }
    </style>
    <div class="all-content" id="allContent" runat="server">
        <h2>Manage Customer</h2>
        <div class="customer-div">
            <img src="../../image/booked.png" width="32px" height="32px" />
            <span>Customer Name</span>
            <span>Customer Email</span>
            <span>Customer Phone Number</span>
            <span style="width: 5%; margin-left: 2%;">Action</span>
        </div>
        <asp:Repeater ID="customerRepeater" runat="server" DataSourceID="GetAllCustomers">
            <ItemTemplate>
                <div class="customer-div">
                    <img src="../../image/booked.png" width="32px" height="32px" />
                    <span><%#Eval("custName")%></span>
                    <span><%#Eval("custEmail")%></span>
                    <span><%#Eval("custPhoneNo")%></span>
                    <asp:Button runat="server" CssClass="btnView" Text="View" OnClick="btnView_Click" CommandArgument='<%# Eval("custID") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="GetAllCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [custID], [custName], [custEmail], [custPhoneNo] FROM [Customer]"></asp:SqlDataSource>
    </div>
    <asp:Panel ID="hiddenPanel" runat="server" CssClass="hidden-panel">
        <div class="group">
            <div class="cust-info">
                <span>ID: ABCDEF</span>
                <span>Name: ABCD</span>
                <span>Email: ABCDE</span>
                <span>Phone No: ABNDE</span>
            </div>
            <div class="latest-three-movie">

            </div>
        </div>
        <div class="group">
            <div class="latest-three-review">

            </div>
        </div>
        <div class="button-group">
            <asp:Button ID="btnDelete" CssClass="delete-button" runat="server" Text="Delete"/>
            <asp:Button ID="btnBack" CssClass="back-button" runat="server" Text="Back" OnClick="closeView_Click" />
        </div>
    </asp:Panel>
</asp:Content>
