<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="WAD_Assignment.Testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Testing<br />


            testingggg2
            <asp:Button ID="Button1" runat="server" Text="TestYA" />
            <br />
            <div>
                <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <asp:Button ID="Button2" runat="server" Text="Button" />
                </AnonymousTemplate>
                <LoggedInTemplate>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                    </asp:CheckBoxList>
                </LoggedInTemplate>
            </asp:LoginView>
            </div>
            
        </div>
    </form>
</body>
</html>
