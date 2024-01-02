<%@ Page Language="C#" MasterPageFile="~/Admin-New/AdminSideBar.Master" AutoEventWireup="true" CodeFile="ManageCustomer.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageCustomer.ManageCustomer" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ManageCustomer.css" rel="stylesheet" />

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
        
    </asp:Panel>
    <asp:HiddenField ID="custIDField" runat="server" />
</asp:Content>
