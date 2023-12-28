<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD_Assignment.Member.Payment" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Payment.css" rel="stylesheet" />
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <div id="form-content">
        <div class="ticket">
            <div class="left-side">
                <div class="movie-detail">
                    <asp:Image ID="movieImg" class="movie-image" width="100%" height="100%" runat="server" />
                    <div id="movieDesc" class="movie-desc" runat="server">

                    </div>
                </div>
                <div class="total-price">
                    <asp:Label ID="lblTotalPrice" runat="server" CssClass="lblTotalPrice" Text="Total Price"></asp:Label>
                    <asp:Label ID="txtTotalPrice" runat="server" CssClass="txtTotalPrice" Text=""></asp:Label>
                    <asp:Label ID="termsAndCond" runat="server" CssClass="t-and-c" Text="Price include taxes and all service costs"></asp:Label>
                </div>
            </div>
            <div class="right-side">
                <div class="payment-detail">
                    <div class="payment-method">
                        <span class="payment-text">Payment Method</span>
                        <div class="payment-choice">
                            <button id="btnTng" class="touch-n-go" type="button" onclick="selectCard('tng');">
                                <img id="tngImage" class="deselected" src="../../image/tng-payment.png" width="80px" height="80px" />
                            </button>
                            <button id="btnCard" class="card" type="button" onclick="selectCard('card');">
                                <img id="cardImage" class="deselected" src="../../image/card-payment.png" width="230px" height="80px" />
                            </button>
                        </div>
                        <div id="tngPayment" class="tngInfo">
                            <div class="phoneNum-div">
                                <asp:Label ID="lblPhoneNum" CssClass="tng-label" runat="server" Text="Mobile Number"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtCode" runat="server" Text="MY +60 " ReadOnly="true"></asp:TextBox>
                                    <asp:TextBox ID="txtPhoneNum" runat="server" Placeholder="123456789" MaxLength="10" Required="true"></asp:TextBox>
                                </div>
                                <asp:RegularExpressionValidator ID="phoneNumValidation" runat="server" ErrorMessage="Please enter a valid phone number." Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" ValidationExpression="[0-9]{9,10}" ControlToValidate="txtPhoneNum" ValidationGroup="tngValidation"></asp:RegularExpressionValidator>
                            </div>
                            <div class="pin-div">
                                <asp:Label ID="lblPin" CssClass="tng-label" runat="server" Text="6-digit PIN"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtPin1" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, 'ContentPlaceHolder1_txtPin2');" onkeydown="handlePinKeyDown(this, this);" onclick="handlePinFocus(this);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                    <asp:TextBox ID="txtPin2" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, 'ContentPlaceHolder1_txtPin3');" onkeydown="handlePinKeyDown(this, 'ContentPlaceHolder1_txtPin1');" onclick="handlePinFocus(this);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                    <asp:TextBox ID="txtPin3" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, 'ContentPlaceHolder1_txtPin4');" onkeydown="handlePinKeyDown(this, 'ContentPlaceHolder1_txtPin2');" onclick="handlePinFocus(this);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                    <asp:TextBox ID="txtPin4" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, 'ContentPlaceHolder1_txtPin5');" onkeydown="handlePinKeyDown(this, 'ContentPlaceHolder1_txtPin3');" onclick="handlePinFocus(this);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                    <asp:TextBox ID="txtPin5" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, 'ContentPlaceHolder1_txtPin6');" onkeydown="handlePinKeyDown(this, 'ContentPlaceHolder1_txtPin4');" onclick="handlePinFocus(this);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                    <asp:TextBox ID="txtPin6" runat="server" Required="true" MaxLength="1" oninput="handlePinInput(this, null);" onkeydown="handlePinKeyDown(this, 'ContentPlaceHolder1_txtPin5');" onfocus="handlePinFocus(this, null);" onkeypress="return isNumericKey(event);" onpaste="return false;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div id="cardPayment" class="cardInfo">
                            <div class="name-div">
                                <asp:Label ID="lblName" CssClass="card-label" runat="server" Text="Cardholder Name"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtName" runat="server" Placeholder="Abcede Fgh Igk Lmn" Required="True"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="nameValidation" runat="server" ErrorMessage="Name is required." ControlToValidate="txtName" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" ValidationGroup="cardValidation"></asp:RequiredFieldValidator>
                            </div>
                            <div class="cardNo-div">
                                <asp:Label ID="lblCardNo" CssClass="card-label" runat="server" Text="Card Number"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtCardNo" runat="server" MaxLength="19" Required="true" Placeholder="1234 1234 1234 1234" ></asp:TextBox>
                                </div>
                                <asp:RegularExpressionValidator ID="cardNoValidation" runat="server" ErrorMessage="Wrong format of Card Number. Please enter only 16 digits." ControlToValidate="txtCardNo" Font-Bold="True" ValidationExpression="[0-9]{4}\s[0-9]{4}\s[0-9]{4}\s[0-9]{4}" Font-Size="12px" ForeColor="#FF3300" ValidationGroup="cardValidation"></asp:RegularExpressionValidator>
                            </div>
                            <div class="CVV-div">
                                <asp:Label ID="lblCVV" CssClass="card-label" runat="server" Text="CVV"></asp:Label>
                                <div class="payment-input">
                                    <asp:TextBox ID="txtCVV" runat="server" Required="true" Placeholder="987"></asp:TextBox>
                                </div>
                                <asp:RegularExpressionValidator ID="cvvValidation" runat="server" ControlToValidate="txtCVV" ErrorMessage="Please enter only 3 digits." Font-Size="12px" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="[0-9]{3}" ValidationGroup="cardValidation"></asp:RegularExpressionValidator>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="expire-div">
                                        <asp:Label ID="lblExpire" CssClass="card-label" runat="server" Text="Expire Date"></asp:Label>
                                        <div class="payment-input">
                                            <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" AutoPostBack="true">
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
                                            <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="errorMsg" runat="server" CssClass="errorMsg" Text="" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="paymentChoiceField" runat="server" Value="" />
                <asp:HiddenField ID="seatsChosen" runat="server" Value="" />
                <div class="checkout">
                    <asp:Button ID="btnPayment" CssClass="payment-button" runat="server" Text="Make a payment" OnClientClick="return validateForm();" OnClick="btnPayment_Click" />
                    <ion-icon id="forward-icon" name='arrow-forward-outline'></ion-icon>
                </div>
            </div>
        </div>
    </div>
    <script src="Payment.js"></script>
</asp:Content>
