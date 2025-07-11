﻿<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAD_Assignment.loginRegister.Login1" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="RegisterAndLogin.css" rel="stylesheet" />
    <link href="Login.css" rel="stylesheet" />
    <div id="LF">
        <div id="registerForm" style="width: 520px;">

            <h1 style="text-align: center; margin-bottom: 58px;" class="RH1"><b>Login</b></h1>

            <div class="form-group" style="margin-bottom: -15px;">
                <ion-icon name="mail-outline" class="iconTwo" style="top: 119px;"></ion-icon>
                <asp:TextBox ID="CustomerEmail" runat="server" OnTextChanged="CustomerEmail_TextChanged" Required="true"></asp:TextBox>
                <label for="CustomerEmail" class="RLaber">Email</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CustomerEmail" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <ion-icon name="lock-closed-outline" class="iconFive" style="top: 179px;"></ion-icon>
                <asp:TextBox ID="CustomerPassword" runat="server" OnTextChanged="CustomerPassword_TextChanged" Required="true" type="password"></asp:TextBox>
                <label for="CustomerPassword" class="RLaber">Password</label>
                <br />
                <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="CustomerPassword" ErrorMessage="Password must be at least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%?&amp;amp;*_])[A-Za-z\d@$!%*?&amp;amp;_]{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>

            </div>
            <div class="btnRegister">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <asp:Button ID="Login" runat="server" Text="Login" CssClass="register-btn" OnClick="Login_Click" />
            </div>
            <div class="reg" style="margin-top: 20px;">
                <p>Don't have an account ?</p>
                <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="~/Guest/loginRegister/Register.aspx" CssClass="textRe"><i style="color:white; padding-left:5px;">Register</i></asp:HyperLink>
            </div>
            <div class="reg1">
                <p>Forget Password ? </p>
                <%--<asp:HyperLink ID="forgetPass" runat="server" NavigateUrl="PasswordRecovery.aspx"><i>Click Here</i></asp:HyperLink>--%>
                <!-- Add this button/link where you want to trigger the password recovery popup -->
                <button type="button" class="FP" onclick="showPasswordRecoveryPopup();">
                    <b><i>Click Here</i></b>
                </button>
            </div>
        </div>

        <!-- Add this div for the password recovery popup -->
        <div id="passwordRecoveryPopup" style="display: none; top: 40%; left: 35%; margin: auto; position: absolute; max-height: 100%; /* height: 77%; */ opacity: 1;">
            <div style="text-align: right; margin-bottom: -15px; color: #e9eb74;">
                <ion-icon name="close" style="cursor: pointer; font-size: 23px; margin-top: 5px; margin-right: -10px;"
                    onclick="hidePasswordRecoveryPopup();">
                </ion-icon>
            </div>
            <br />
            <h2 style="color: white; text-align: center;" class="RH1">Password Recovery</h2>
            <!-- Email -->
            <div class="form-group" style="margin-bottom: -58px;">
                <ion-icon name="mail-outline" class="iconTwo" style="top: 119px;"></ion-icon>
                <asp:TextBox ID="CustomerEmailPR" runat="server" OnTextChanged="CustomerEmail_TextChanged"></asp:TextBox>
                <label for="CustomerEmail" class="RLaber">Email</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="CustomerEmailPR" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <!-- Security Question -->
            <div class="form-group" style="margin-top: 45px; margin-bottom: -15px; }">
                <ion-icon name="help-circle-outline" class="iconFour" style="top: 182px"></ion-icon>
                <asp:TextBox ID="SecurityQuestion" runat="server" placeholder="" Onclick=""></asp:TextBox>
                <label for="SecurityQuestion" class="RLaber">What is your favorite movie?</label>
            </div>

            <!-- New Password and Confirm Password (hidden by default) -->
            <div class="form-group" style="margin-bottom: -20px;">
                <ion-icon name="lock-closed-outline" class="iconFive" style="top: 244px;"></ion-icon>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="" type="password"></asp:TextBox>
                <label for="newPassword" class="RLaber">New Password</label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Password must be at least 8 characters, 1 uppercase, 1 lowercase, 1 digit, and 1 special character." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%?&amp;*_])[A-Za-z\d@$!%*?&amp;_]{8,}$" Display="Dynamic" ViewStateMode="Inherit"></asp:RegularExpressionValidator>

            </div>

            <div class="form-group" style="margin-bottom: -18px;">
                <ion-icon name="lock-closed-outline" class="iconSix" style="top: 301px;"></ion-icon>
                <asp:TextBox ID="confirmPassword" runat="server" placeholder="" type="password"></asp:TextBox>
                <label for="confirmPassword" class="RLaber">Confirm Password</label>
            </div>
            <!-- Submit Button -->
            <div class="btnRegister" style="margin-bottom: 25px; margin-top: 20px; }">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <%--<button type="button" id="SubmitButton" class="register-btn" onclick="hidePasswordRecoveryPopup(); return false;"runat ="server" >
                    Submit
                </button>--%>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="register-btn" type ="submit" OnClick="PasswordRecovery_Click" OnClientClick="return validateAndSubmit();" PostBackURL="~/Guest/loginRegister/Login.aspx" />
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <script src="Login.js" type="text/javascript"></script>

    <script type="text/javascript">
    function validateAndSubmit() {
        // Perform your custom validation here

        // Example: Check if the password meets certain criteria
        var newPassword = document.getElementById('TextBox1').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword.length < 8) {
            alert('Password must be at least 8 characters.');
            return false; // Prevent form submission
        }

        if (newPassword !== confirmPassword) {
            alert('Passwords do not match.');
            return false; // Prevent form submission
        }

        // If validation passes, you can submit the form
        hidePasswordRecoveryPopup(); // Add your logic to hide the popup
        PasswordRecovery_Click(); // Add your logic to handle password recovery

        // If you want to allow the postback, return true
        // If you want to prevent the postback, return false
        return true;
    }
    </script>

</asp:Content>
