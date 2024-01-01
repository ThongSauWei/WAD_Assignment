<%@ Page Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="RefundStatus.aspx.cs" Inherits="WAD_Assignment.Admin.RefundStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .btnStyleCss{
            background-color: yellow; 
            color: black; 
            padding: 10px 10px; 
            border: 5px solid yellow;
            text-align: center; 
        }

    </style>

    <script type="text/javascript">
        function rejectRefund() {
            var result = confirm("Are you sure you want to reject?");
            if (result) {
                alert("Rejected!");
            } else {
                alert("Cancel reject!");
            }
            return result;
        }
    </script>

    <div>
        <h2>REFUND STATUS PAGE</h2><br />
        <h3>Please take action for the following refund status.</h3><br />
            
                <asp:Repeater ID="repeaterRefund" runat="server">
                    <HeaderTemplate>
                            <table class="data-table" border="1">
                                <tr>
                                    <th>Refund Date</th>
                                    <th>Refund ID</th>
                                    <th>Action</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("refundDate") %></td>
                                <td><%# Eval("refundID") %></td>
                                <td>&nbsp;&nbsp;
                <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btnStyleCss" OnClientClick="redirectToUpdatePage()" PostBackUrl="~/Admin/Update.aspx" />
                &nbsp;&nbsp;
                <asp:Button ID="btnReject" runat="server" OnClientClick="return rejectRefund()" Text="Reject" CssClass="btnStyleCss"  OnClick ="btnReject_Click"/></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                </asp:Repeater>


                
               


    </div>
</asp:Content>