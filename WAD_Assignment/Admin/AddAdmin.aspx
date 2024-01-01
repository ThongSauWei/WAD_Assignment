<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="WAD_Assignment.Admin.AddAdmin" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .btnStyleCss{
            background-color: yellow; 
            color: black; 
            padding: 10px 10px; 
            border: 5px solid yellow;
            text-align: center; 
        }
    </style>

    <div id="addAdminForm">
        <h1 style="text-align: center;" class="RH1"><b>Register</b></h1>
        <div class="AddAdminForm">
            <div class="form-group">
                <ion-icon name="person-circle-outline" class="iconFirst"></ion-icon>
                <asp:TextBox ID="StaffName" runat="server" placeholder="" Required="true" ClientIDMode="Static"></asp:TextBox>
                <label for="StaffName" class="RLaber">Name</label>

            </div>

            <br />

            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="mail-outline" class="iconTwo"></ion-icon>
                <asp:TextBox ID="StaffEmail" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="StaffEmail" class="RLaber">Email</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="StaffEmail" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </div>

            <br />

            <div class="error-message" id="ErrorMessageLabel" runat="server" visible="false">
                <p style="color: red;">Email is already registered.</p>
            </div>

            <br />

            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="call-outline" class="iconThree"></ion-icon>
                <asp:TextBox ID="StaffPhoneNo" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="StaffPhoneNo" class="RLaber">Phone Number</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="StaffPhoneNo" ErrorMessage="Invalid phone number (e.g. 6012345678)" ValidationExpression="^\d{10,11}$" Display="Dynamic"></asp:RegularExpressionValidator>

            </div>

            <br />
            <br />

            <div class="form-group">
                <asp:TextBox ID="StaffPosition" runat="server" placeholder="" Required="true" ClientIDMode="Static"></asp:TextBox>
                <label for="StaffPosition" class="RLaber">Position</label>

            </div>

            <br />

            <div class="form-group" style="margin-bottom: -20px;">
                <asp:TextBox ID="StaffSalary" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="StaffSalary" class="RLaber">Salary</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="StaffSalary" ErrorMessage="Invalid salary (e.g. 1000.00)" ValidationExpression="^\d+(\.\d{1,2})$" Display="Dynamic"></asp:RegularExpressionValidator>

            </div>

            <br />
            <br />

            <div class="form-group" style="margin-bottom: -30px;">
                <ion-icon name="lock-closed-outline" class="iconFive"></ion-icon>
                <asp:TextBox ID="StaffPassword" runat="server" placeholder="" Required="true" type="password"></asp:TextBox>
                <label for="StaffPassword" class="RLaber">Password</label>

                <br />
                <br />
                <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="StaffPassword" ErrorMessage="Password must be at least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%?&amp;*_])[A-Za-z\d@$!%*?&amp;_]{8,}$"></asp:RegularExpressionValidator>

            </div>

            <br />
            <br />

            <div class="form-group" style="margin-bottom: -18px;">
                <ion-icon name="lock-closed-outline" class="iconSix"></ion-icon>
                <asp:TextBox ID="ReenterPassword" runat="server" placeholder="" Required="true" type="password" OnTextChanged="ReenterPassword_TextChanged"></asp:TextBox>
                <label for="ReenterPassword" class="RLaber">Confirm Password</label>
            </div>

            <br />
            <br />
            <br />

            <div class="btnAddAdmin">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <asp:Button ID="AddAdmin" runat="server" Text="Add Admin" CssClass="btnStyleCss" Onclick="AddAdmin_Click" />
            </div>
            
            <br />

        </div>
    </div>

</asp:Content>