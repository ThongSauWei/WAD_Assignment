<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Refund.aspx.cs" Inherits="WAD_Assignment.cancelRefund.Refund" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:View ID="View1" runat="server">
        </asp:View>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieTicket %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [custID], [custEmail], [custPhoneNo] FROM [Customer]"></asp:SqlDataSource>
    </form>
</body>
</html>
