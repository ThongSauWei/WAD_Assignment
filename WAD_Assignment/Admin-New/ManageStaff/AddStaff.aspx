<%@ Page Language="C#" MasterPageFile="~/Admin-New/AdminSideBar.Master" AutoEventWireup="true" CodeFile="AddStaff.aspx.cs" Inherits="WAD_Assignment.Admin_New.ManageStaff.AddStaff" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../AdminMainNew.css" rel="stylesheet" />
    <link href="AddAndEditStaff.css" rel="stylesheet" />

    <div class="content-div" id="contentDiv" runat="server">
        <h2>Add Staff</h2>
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
                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="passwordValidation" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be at least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%?&amp;amp;*_])[A-Za-z\d@$!%*?&amp;amp;_]{8,}$" Display="Dynamic" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:RegularExpressionValidator>
            </div>
            <div class="staff-input">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="confirmPasswordValidation" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Password and Confirm Password Mismatch." Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:CompareValidator>
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
            <asp:Button ID="addStaff" CssClass="btnFinish" runat="server" Text="Add Staff" OnClick="addStaff_Click" />
            <asp:Button ID="cancelAdd" CssClass="cancelAction" runat="server" Text="Cancel" OnClick="cancelAdd_Click" CausesValidation="False" />
        </div>
    </div>
    <asp:Panel ID="hiddenPanel" CssClass="hiddenPanel" runat="server">
        <h3>Are you sure to add this staff?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" PostBackUrl="~/Admin-New/ManageStaff/ManageStaff.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <asp:HiddenField ID="staffIDField" runat="server" />
</asp:Content>