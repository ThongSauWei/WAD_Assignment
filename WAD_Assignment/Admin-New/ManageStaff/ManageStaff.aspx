<%@ Page Language="C#" MasterPageFile="~/Admin-New/AdminSideBar.Master" AutoEventWireup="true" CodeFile="ManageStaff.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageStaff.ManageStaff" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ManageStaff.css" rel="stylesheet" />

    <div class="all-content" id="allContent" runat="server">
        <h2>Manage Staff<asp:Button ID="btnAdd" CssClass="btnAdd" runat="server" Text="Add Staff" PostBackUrl="~/Admin-New/ManageStaff/AddStaff.aspx" /></h2>
        <div class="staff-div">
            <img src="../../image/booked.png" width="32px" height="32px" />
            <span style="width:8%;">Staff ID</span>
            <span>Name</span>
            <span>Email</span>
            <span>Phone Number</span>
            <span>Position</span>
            <span style="width:8%;">Salary</span>
            <span style="width: 5%; margin-left: 2%;">Action</span>
        </div>
        <asp:Repeater ID="staffRepeater" runat="server" DataSourceID="GetAllStaffs">
            <ItemTemplate>
                <div class="staff-div">
                    <img src="../../image/booked.png" width="32px" height="32px" />
                    <span style="width:8%;"><%#Eval("staffID")%></span>
                    <span><%#Eval("staffName")%></span>
                    <span><%#Eval("staffEmail")%></span>
                    <span><%#Eval("staffPhoneNo")%></span>
                    <span><%#Eval("staffPosition")%></span>
                    <span style="width:8%;"><%#Eval("salary")%></span>
                    <asp:Button ID="btnEdit" runat="server" CssClass="btnEdit" Text="Edit" PostBackUrl='<%#"~/Admin-New/ManageStaff/EditStaff.aspx?staffID=" + Eval("staffID")%>' />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btnDelete" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("staffID")%>'/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="GetAllStaffs" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
    </div>
    <asp:Panel ID="deletePanel" CssClass="deletePanel" runat="server">
        <h3>Are you sure you want to delete this staff?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" PostBackUrl="~/Admin-New/ManageStaff/ManageStaff.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <asp:HiddenField ID="staffIDField" runat="server" />
</asp:Content>
