<%@ Page Language="C#" MasterPageFile="~/Admin-New/AdminSideBar.Master" AutoEventWireup="true" CodeFile="EditStaff.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageStaff.EditStaff" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="AddAndEditStaff.css" rel="stylesheet" />
    <link href="../AdminMainNew.css" rel="stylesheet" />

    <div class="content-div" id="contentDiv" runat="server">
        <h2>Edit Staff</h2>
        <div class="group">
            <div class="staff-input">
                <asp:Label ID="lblStaffName" runat="server" Text="Name:"></asp:Label>
                <asp:TextBox ID="txtStaffName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="staffNameValidation" runat="server" ControlToValidate="txtStaffName" ErrorMessage="This field is required." Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="staff-input">
                <asp:Label ID="lblStaffEmail" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtStaffEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="staffEmailValidation" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="group">
            <div class="staff-input">
                <asp:Label ID="lblStaffPhoneNo" runat="server" Text="Phone Number:"></asp:Label>
                <asp:TextBox ID="txtStaffPhoneNo" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="phoneNoValidation" runat="server" ControlToValidate="txtStaffPhoneNo" ErrorMessage="Invalid phone number (e.g. 6012345678)" ValidationExpression="^\d{10,11}$" Display="Dynamic" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:RegularExpressionValidator>
            </div>
            <div class="staff-input">
                <asp:Label ID="lblStaffPosition" runat="server" Text="Position:"></asp:Label>
                <asp:DropDownList ID="ddlPosition" runat="server">
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    <asp:ListItem Value="Staff">Staff</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="group">
            <div class="staff-input">
                <asp:Label ID="lblSalary" runat="server" Text="Salary:"></asp:Label>
                <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="salaryValidation" runat="server" ControlToValidate="txtSalary" ErrorMessage="Range in between 1500 and 10000." Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" MaximumValue="10000" MinimumValue="1500" Type="Double"></asp:RangeValidator>
            </div>
        </div>
        <div class="bottom-side">
            <asp:Button ID="updateStaff" CssClass="btnFinish" runat="server" Text="Update Staff" OnClick="UpdateStaff_Click" />
            <asp:Button ID="cancelUpdate" CssClass="cancelAction" runat="server" Text="Cancel" OnClick="cancelUpdate_Click" CausesValidation="False" />
        </div>
    </div>
    <asp:Panel ID="hiddenPanel" CssClass="hiddenPanel" runat="server">
        <h3>Are you sure to update this staff?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" PostBackUrl="~/Admin-New/ManageStaff/ManageStaff.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <asp:HiddenField ID="staffIDField" runat="server" />
</asp:Content>
