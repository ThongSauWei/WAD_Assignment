<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD_Assignment.Member.Payment" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Payment.css" rel="stylesheet" />
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <div id="form-content">
        <div class="ticket">
            <div class="left-side">
                <div class="movie-detail">
                    <img src="../image/movie-image1.jpg" class="movie-image" width="100%" height="100%">
                    <div class="movie-desc">
                        <h2>Movie Title</h2>
                        <h4>Age | Language | Duration</h4>
                        <br />
                        <h4>Cast</h4>
                        <br />
                        <h4>Date Time</h4>
                    </div>
                </div>
                <div class="total-price">
                    <span class="lblTotalPrice">Total Price</span>
                    <span class="txtTotalPrice">RM 303.00</span>
                    <span class="t-and-c">Price include taxes and all service costs</span>
                </div>
            </div>
            <div class="right-side">
                <div class="payment-detail">
                    <div class="payment-method">
                        <span class="payment-text">Payment Method</span>
                        <div class="payment-choice">
                            <button id="btnTng" class="touch-n-go" type="button" onclick="selectCard(1);">
                                <img id="tngImage" class="deselected" src="../image/tng-payment.png" width="80px" height="80px" />
                            </button>
                            <button id="btnCard" class="card" type="button" onclick="selectCard(2);">
                                <img id="cardImage" class="deselected" src="../image/card-payment.png" width="230px" height="80px" />
                            </button>
                            <div class="validation"></div>
                        </div>
                        <div class="tngInfo">
                        </div>
                        <div class="cardInfo">
                            <div class="name-div">
                                <asp:Label ID="lblName" CssClass="card-label" runat="server" Text="Cardholder Name"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtName" runat="server" AutoPostBack="True"></asp:TextBox>
                                    <div class="validation"></div>
                                </div>
                                <asp:RequiredFieldValidator ID="nameValidation" runat="server" ErrorMessage="Name is required." ControlToValidate="txtName" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            <div class="cardNo-div">
                                <asp:Label ID="lblCardNo" CssClass="card-label" runat="server" Text="Card Number"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtCardNo" runat="server" MaxLength="19" AutoPostBack="True" Required="true"></asp:TextBox>
                                    <div class="validation"></div>
                                </div>
                                <asp:RegularExpressionValidator ID="cardNoValidation" runat="server" ErrorMessage="Wrong format of Card Number. Please enter only 16 digits." ControlToValidate="txtCardNo" Font-Bold="True" ValidationExpression="[0-9]{4}\s[0-9]{4}\s[0-9]{4}\s[0-9]{4}" Font-Size="12px" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                            </div>
                            <div class="CVV-div">
                                <asp:Label ID="lblCVV" CssClass="card-label" runat="server" Text="CVV"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtCVV" runat="server" AutoPostBack="True" Required="true"></asp:TextBox>
                                    <div class="validation"></div>
                                </div>
                                <asp:RegularExpressionValidator ID="cvvValidation" runat="server" ControlToValidate="txtCVV" ErrorMessage="Please enter only 3 digits." Font-Size="12px" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="expire-div">
                                        <asp:Label ID="lblExpire" CssClass="card-label" runat="server" Text="Expire Date"></asp:Label>
                                        <div class="payment-input">
                                            <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Value="1">01</asp:ListItem>
                                                <asp:ListItem Value="2">02</asp:ListItem>
                                                <asp:ListItem Value="3">03</asp:ListItem>
                                                <asp:ListItem Value="4">04</asp:ListItem>
                                                <asp:ListItem Value="5">05</asp:ListItem>
                                                <asp:ListItem Value="6">06</asp:ListItem>
                                                <asp:ListItem Value="7">07</asp:ListItem>
                                                <asp:ListItem Value="8">08</asp:ListItem>
                                                <asp:ListItem Value="9">09</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                                <asp:ListItem Value="12">12</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                            <div class="validation"></div>
                                        </div>
                                        <asp:Label ID="errorMsg" runat="server" CssClass="errorMsg" Text="" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div class="checkout">
                    <asp:Button ID="btnPayment" CssClass="payment-button" runat="server" Text="Make a payment" OnClientClick="return validateForm();" OnClick="btnPayment_Click" />
                    <ion-icon name='arrow-forward-outline'></ion-icon>
                </div>
            </div>
        </div>
    </div>
    <script>
        function selectCard(value) {
            var tng = document.getElementById("tngImage");
            var card = document.getElementById("cardImage");
            var btnTng = document.getElementById("btnTng");
            var btnCard = document.getElementById("btnCard");

            if (value === 1) {
                tng.classList.remove('deselected');
                card.classList.add('deselected');

                btnTng.classList.add('selected');
                btnCard.classList.remove('selected');
            } else if (value === 2) {
                card.classList.remove('deselected');
                tng.classList.add('deselected');

                btnCard.classList.add('selected');
                btnTng.classList.remove('selected');
            }
        }
    </script>

    <script>
        document.getElementById('ContentPlaceHolder1_txtCardNo').addEventListener('input', function (event) {
            let inputValue = event.target.value.replace(/[^\d]/g, ''); // Remove non-numeric characters
            let formattedValue = formatCardNumber(inputValue);
            event.target.value = formattedValue;
        });

        function formatCardNumber(value) {
            // Add a space or dash every 4 digits
            return value.replace(/(\d{4})/g, '$1 ').trim();
        }
    </script>

    <script>
        function validateForm() {
            var errorMsg = document.getElementById('ContentPlaceHolder1_errorMsg').innerText;

            if (errorMsg.trim().length > 0) {
                alert('Please correct all the errors before submission.');
                return false;
            }

            return true;
        }
    </script>

</asp:Content>
