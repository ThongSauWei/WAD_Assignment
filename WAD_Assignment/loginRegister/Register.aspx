<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAD_Assignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 392px;
        }
        .auto-style2 {
            width: 1016px;
        }
        .auto-style3 {
            width: 392px;
            height: 66px;
        }
        .auto-style4 {
            width: 1016px;
            height: 66px;
        }
        .auto-style5 {
            height: 66px;
        }
        .auto-style6 {
            width: 392px;
            height: 30px;
        }
        .auto-style7 {
            width: 1016px;
            height: 30px;
        }
        .auto-style8 {
            height: 30px;
        }
    </style>
</head>
<body>
    <H1>Welcome to Cinema!</H1>
    <H2>Register</H2>
    <form id="registerForm" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Name</td>
                    <td class="auto-style2">:
                        <asp:TextBox ID="CustomerName" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Email</td>
                    <td class="auto-style2">:
                        <asp:TextBox ID="CustomerEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CustomerEmail" ErrorMessage="Invalid email format. (e.g. user@example.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Phone Number</td>
                    <td class="auto-style2">:
                        <asp:TextBox ID="CustomerPhoneNo" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CustomerPhoneNo" ErrorMessage="Invalid phone number (e.g. 6012345678)" ValidationExpression="([1-9]\d{6,7})|(9\d{1}\s*-?\s*?\d{3}\s*-?\s*?\d{3,4})"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Security Qeustion</td>
                    <td class="auto-style4">&nbsp;What is your favorite movie?<br />
                        : <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style6">Password</td>
                    <td class="auto-style7">:
                        <asp:TextBox ID="CustomerPassword" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="CustomerPassword" ErrorMessage="Password must be at least 8 character, 1 uppercase, 1 lowercase, 1 digit and 1 special character." ValidationExpression="[A-Za-z\d!@#$%^&amp;*(),.?\&quot;:{}|&lt;&gt;]{8,}"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style6">Reenter Password</td>
                    <td class="auto-style7">:
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Button ID="Cancel" runat="server" Text="Cancel" />
                        <asp:Button ID="Register" runat="server" Text="Register" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
