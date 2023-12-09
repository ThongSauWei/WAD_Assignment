<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="WAD_Assignment.Testing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"
Runat="Server">


    
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
    

    </asp:Content>

