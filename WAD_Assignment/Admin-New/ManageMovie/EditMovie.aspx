<%@ Page Language="C#" MasterPageFile="~/Admin-New/AdminSideBar.Master" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.EditMovie" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="AddAndEditMovie.css" rel="stylesheet" />

    <div id="contentDiv" runat="server" class="content-box">
        <div class="left-side">
            <asp:Image ID="movieImg" runat="server" Width="270px" Height="330px" />
        </div>
        <div class="right-side">
            <h2 style="padding-left: 30px; color: #ecd261;">Edit Movie</h2>
            <div class="group">
                <div class="movie-input">
                    <asp:Label ID="lblMovieName" runat="server" Text="Movie Name:"></asp:Label>
                    <asp:TextBox ID="txtMovieName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="movieNameValidation" ControlToValidate="txtMovieName" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                </div>
                <div class="movie-input">
                    <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                    <asp:DropDownList ID="ddlCategory" runat="server" Style="width:70%;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="group">
                <div class="movie-input" style="width: 80%;">
                    <asp:Label ID="lblMovieDesc" runat="server" Text="Movie Description:"></asp:Label>
                    <asp:TextBox ID="txtMovieDesc" runat="server" TextMode="MultiLine" Columns="65" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="movieDescValidation" ControlToValidate="txtMovieDesc" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="group">
                <div class="movie-input">
                    <asp:Label ID="lblReleaseDate" runat="server" Text="Release Date:"></asp:Label>
                    <asp:Calendar ID="calReleaseDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
                <div class="movie-input">
                    <asp:Label ID="lblLanguage" runat="server" Text="Language:"></asp:Label>
                    <asp:RadioButtonList ID="rblLanguage" runat="server">
                        <asp:ListItem Value="English">English</asp:ListItem>
                        <asp:ListItem Value="Chinese">Chinese</asp:ListItem>
                        <asp:ListItem Value="Malay">Malay</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="languageValidation" ControlToValidate="rblLanguage" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                </div>
                <div class="movie-input" style="margin-top: 40px;">
                    <asp:Label ID="lblSubtitle" runat="server" Text="Subtitle:"></asp:Label>
                    <asp:CheckBoxList ID="cblSubtitle" runat="server">
                        <asp:ListItem Value="English">English</asp:ListItem>
                        <asp:ListItem Value="Chinese">Chinese</asp:ListItem>
                        <asp:ListItem Value="Malay">Malay</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div class="movie-input">
                    <asp:CheckBox ID="ended" runat="server" Value="Ended" Text="Ended?" />
                </div>
            </div>
            <div class="group">
                <div class="movie-input">
                    <asp:Label ID="lblDuration" runat="server" Text="Duration (60 - 240min):"></asp:Label>
                    <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="durationValidation" runat="server" ErrorMessage="Only in between 60 to 240." Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" MaximumValue="240" MinimumValue="60" Type="Integer" ControlToValidate="txtDuration"></asp:RangeValidator>
                </div>
                <div class="movie-input">
                    <asp:Label ID="lblClassification" runat="server" Text="Classification:"></asp:Label>
                    <asp:DropDownList ID="ddlClassification" runat="server" Style="width:70%;">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="group">
                <div style="float:left; width: 40%;">
                    <div class="movie-input">
                        <asp:Label ID="lblDirector" runat="server" Text="Director:"></asp:Label>
                        <asp:TextBox ID="txtDirector" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="directorValidation" ControlToValidate="txtDirector" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                    </div>
                    <div class="movie-input" style="margin-top: 18px;">
                        <asp:Label ID="lblMovieImage" runat="server" Text="Movie Image:"></asp:Label>
                        <asp:FileUpload ID="imgUpload" runat="server" />
                    </div>
                </div>
                <div class="movie-input">
                    <asp:Label ID="lblCast" runat="server" Text="Cast:"></asp:Label>
                    <asp:TextBox ID="txtCast" runat="server" TextMode="MultiLine" Rows="5" Columns="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="castValidation" ControlToValidate="txtCast" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="group">
                <div class="movie-input">
                    <asp:Label ID="lblMovieTrailer" runat="server" Text="Movie Trailer (link):"></asp:Label>
                    <asp:TextBox ID="txtTrailer" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="trailerValidation" ControlToValidate="txtTrailer" Font-Bold="True" Font-Size="12px" ForeColor="#FF3300" runat="server" ErrorMessage="This field is required."></asp:RequiredFieldValidator>
                </div>
                <div class="movie-input">
                    <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="PriceValidation" ControlToValidate="txtPrice" Font-Bold="True" Font-Size="12px" MinimumValue="0" MaximumValue="50" runat="server" Type="Double" ForeColor="#FF3300" ErrorMessage="Please enter a valid price below 50."></asp:RangeValidator>
                </div>
            </div>
            <div class="bottom-side">
                <asp:Button ID="updateMovie" CssClass="btnFinish" runat="server" Text="Update Movie" OnClick="UpdateMovie_Click" />
                <asp:Button ID="cancelUpdate" CssClass="cancelAction" runat="server" Text="Cancel" OnClick="cancelUpdate_Click" CausesValidation="False" />
            </div>
        </div>
    </div>
    <asp:Panel ID="hiddenPanel" CssClass="hiddenPanel" runat="server">
        <h3>Are you sure to update this movie?</h3>
        <asp:Button ID="btnConfirm" CssClass="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" PostBackUrl="~/Admin-New/ManageMovie/ManageMovie.aspx" />
        <asp:Button ID="btnCancel" CssClass="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <asp:HiddenField ID="movieIDField" runat="server" />
</asp:Content>
