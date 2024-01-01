<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="MemberCRUD.aspx.cs" Inherits="WAD_Assignment.Admin.MemberCRUD" %>


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
        function deleteMember() {
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
        <h2>MEMBER CRUD PAGE</h2><br />
        <h3>Which member do you want to amend?</h3><br />
            <asp:Button ID="btnAddMember" runat="server" Text="Add Member" CssClass="btnAddCss" PostBackUrl="~/Admin/AddAdmin.aspx" OnClick="btnAddMember_Click" />
                <asp:Repeater ID="repeaterMember" runat="server">
                    <HeaderTemplate>
                            <table class="data-table" border="1">
                                <tr>
                                    <th>Member ID</th>
                                    <th>Member Name</th>
                                    <th>Action</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("custID") %></td>
                                <td><%# Eval("custName") %></td>
                                <td>&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btnStyleCss" OnClientClick="redirectToUpdatePage()" PostBackUrl="~/Admin/Update.aspx" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" OnClientClick="return deleteMember()" Text="Delete" CssClass="btnStyleCss" OnClick="btnDelete_Click" CommandArgument='<%# Eval("custID") %>'  />
                &nbsp;&nbsp;
                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btnStyleCss" PostBackUrl='<%# "~/Admin/ViewAdmin.aspx?staffID=" + Eval("custID") %>' /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                </asp:Repeater>


                
               


    </div>
</asp:Content>