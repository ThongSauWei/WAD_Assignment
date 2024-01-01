<%@ Page Language="C#" MasterPageFile="AdminHeader.Master" AutoEventWireup="true" CodeBehind="AdminCRUD.aspx.cs" Inherits="testing.AdminCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .btnStyleCss{
            background-color: yellow; 
            color: black; 
            padding: 10px 10px; 
            border: 5px solid yellow;
            text-align: center; 
        }

        .btnAddCss{
            background-color: yellow; 
            color: black; 
            padding: 10px 10px; 
            border: 5px solid yellow;
            text-align: center; 
            float: right ;
            margin-bottom: 20px;
        }

    </style>

    <script type="text/javascript">
        function deleteAdmin() {
            var result = confirm("Are you sure you want to delete?");
            if (result) {
                alert("Delete confirmed!");
            } else {
                alert("Delete canceled!");
            }
            return result;
        }
    </script>

    <div>
        <h2>ADMIN CRUD PAGE</h2><br />
        <h3>Which admin do you want to amend?</h3><br />
            <asp:Button ID="btnAddAdmin" runat="server" Text="Add Admin" CssClass="btnAddCss" PostBackUrl="~/AddAdmin.aspx" OnClick="btnAddAdmin_Click" />
                <asp:Repeater ID="repeaterAdmin" runat="server">
                    <HeaderTemplate>
                            <table class="data-table" border="1">
                                <tr>
                                    <th>Admin ID</th>
                                    <th>Admin Name</th>
                                    <th>Action</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("staffID") %></td>
                                <td><%# Eval("staffName") %></td>
                                <td>&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btnStyleCss" PostBackUrl='<%# "~/UpdateAdmin.aspx?staffID=" + Eval("staffID") %>' />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" OnClientClick="return deleteAdmin()" Text="Delete" CssClass="btnStyleCss" OnClick="btnDelete_Click" CommandArgument='<%# Eval("staffID") %>' />
                &nbsp;&nbsp;
                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btnStyleCss" PostBackUrl='<%# "~/ViewAdmin.aspx?staffID=" + Eval("staffID") %>' /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                </asp:Repeater>
    </div>

</asp:Content>