<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.WebForm1" %>--%>

<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.WebForm1" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="RegisterAndLogin.css" rel="stylesheet" />
    <link href="Register.css" rel="stylesheet" />

    <div id="registerForm">
        <h1 style="text-align: center;" class="RH1"><b>Register</b></h1>
        <div class="RF">
            <div class="form-group">
                <ion-icon name="person-circle-outline" class="iconFirst"></ion-icon>
                <asp:TextBox ID="CustomerName" runat="server" placeholder="" Required="true" ClientIDMode="Static"></asp:TextBox>
                <label for="CustomerName" class="RLaber">Name</label>

            </div>

            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="mail-outline" class="iconTwo"></ion-icon>
                <asp:TextBox ID="CustomerEmail" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="CustomerEmail" class="RLaber">Email</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CustomerEmail" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </div>

            <!-- Add this div for displaying error messages -->
            <div class="error-message" id="ErrorMessageLabel" runat="server" visible="false">
                <p style="color: red;">Email is already registered.</p>
            </div>

            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="mail-outline" class="iconTwo"></ion-icon>
                <ion-icon name="call-outline" class="iconThree"></ion-icon>
                <asp:TextBox ID="CustomerPhoneNo" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="CustomerPhoneNo" class="RLaber">Phone Number</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CustomerPhoneNo" ErrorMessage="Invalid phone number (e.g. 6012345678)" ValidationExpression="^\d{10,11}$" Display="Dynamic"></asp:RegularExpressionValidator>

            </div>

            <div class="form-group" style="margin-top: 20px;">
                <ion-icon name="help-circle-outline" class="iconFour"></ion-icon>
                <asp:TextBox ID="SecurityQuestion" runat="server" placeholder="" Required="true"></asp:TextBox>
                <label for="SecurityQuestion" class="RLaber">What is your favorite movie?</label>
            </div>

            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="lock-closed-outline" class="iconFive"></ion-icon>
                <asp:TextBox ID="CustomerPassword" runat="server" placeholder="" Required="true" type="password"></asp:TextBox>
                <label for="CustomerPassword" class="RLaber">Password</label>

                <br />
                <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="CustomerPassword" ErrorMessage="Password must be at least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%?&amp;*_])[A-Za-z\d@$!%*?&amp;_]{8,}$"></asp:RegularExpressionValidator>

            </div>

            <div class="form-group" style="margin-bottom: -18px;">
                <ion-icon name="lock-closed-outline" class="iconSix"></ion-icon>
                <asp:TextBox ID="ReenterPassword" runat="server" placeholder="" Required="true" type="password" OnTextChanged="ReenterPassword_TextChanged"></asp:TextBox>
                <label for="ReenterPassword" class="RLaber">Confirm Password</label>
            </div>

            <div class="btnRegister">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <asp:Button ID="Register" runat="server" Text="Register" CssClass="register-btn" Onclick="Register_Click" />
            </div>
            <div class="reg2">
                <p>
                    Already have an account?
                <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="~/Guest/loginRegister/Login.aspx"><i>Login</i></asp:HyperLink>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</asp:Content>
