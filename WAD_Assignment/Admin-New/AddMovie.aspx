<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="AddMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.AddMovie" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .add-content {
            margin: 180px auto 0;
            height: 450px;
            width: 70%;
        }

        .left-side {
            height: 100%;
            width: 30%;
            float:left;
        }

        .right-side {
            height: 100%;
            width: 70%;
            float: left;
            overflow-y: scroll;
        }

        .movie-input {
            width: 40%;
            float: left;
            margin-top: 10px;
        }

        .movie-input * {
            color: #ecd261;
        }

        .movie-input select, .movie-input table table *, .movie-input table th {
            color: black;
        }

        .movie-input span {
            width: 100%;
            display: block;
        }

        .bottom-side {
            width: 100%;
        }

        .btnAdd {
            background-color: #ecd261;
            border: none;
            width: 25%;
            height: 50px;
            border-radius: 10px;
            font-size: 16px;
            color: white;
            margin-left: 25%;
            margin-top: 40px;
        }
    </style>

    <div class="add-content">
        <div class="left-side">
            <img src="../image/movie1.jpg" width="270px" height="330px"/>
        </div>
        <div class="right-side">
            <h2 style="padding-left: 30px; color:#ecd261;">Add Movie</h2>
            <div class="movie-input">
                <asp:Label ID="lblMovieName" runat="server" Text="Movie Name:"></asp:Label>
                <asp:TextBox ID="txtMovieName" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Value="action">Action</asp:ListItem>
                    <asp:ListItem Value="horror">Horror</asp:ListItem>
                    <asp:ListItem Value="musical">Musical</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="movie-input" style="width: 80%;">
                <asp:Label ID="lblMovieDesc" runat="server" Text="Movie Description:"></asp:Label>
                <asp:TextBox ID="txtMovieDesc" runat="server" TextMode="MultiLine" Columns="54"></asp:TextBox>
            </div>
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
                <asp:Label ID="lblEndDate" runat="server" Text="End Date:"></asp:Label>
                <asp:Calendar ID="calEndDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"  ForeColor="Black" Height="180px" Width="200px">
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
                <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                <asp:RadioButtonList ID="rblStatus" runat="server">
                    <asp:ListItem Value="coming soon">Coming Soon</asp:ListItem>
                    <asp:ListItem Value="releasing">Releasing</asp:ListItem>
                    <asp:ListItem Value="ended">Ended</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="movie-input" style="height:102.4px;">
                <asp:Label ID="lblDuration" runat="server" Text="Duration:"></asp:Label>
                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblLanguage" runat="server" Text="Language:"></asp:Label>
                <asp:RadioButtonList ID="rblLanguage" runat="server">
                    <asp:ListItem Value="english">English</asp:ListItem>
                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                    <asp:ListItem Value="malay">Malay</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblSubtitle" runat="server" Text="Subtitle:"></asp:Label>
                <asp:CheckBoxList ID="cblSubtitle" runat="server">
                    <asp:ListItem Value="english">English</asp:ListItem>
                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                    <asp:ListItem Value="malay">Malay</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblDirector" runat="server" Text="Director:"></asp:Label>
                <asp:TextBox ID="txtDirector" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblCast" runat="server" Text="Cast:"></asp:Label>
                <asp:TextBox ID="txtCast" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblClassification" runat="server" Text="Classification:"></asp:Label>
                <asp:DropDownList ID="ddlClassification" runat="server">
                    <asp:ListItem Value="0">none</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblMovieImage" runat="server" Text="Movie Image:"></asp:Label>
                <asp:FileUpload ID="imgUpload" runat="server" />
            </div>
            <div class="bottom-side">
            <asp:Button ID="addMovie" CssClass="btnAdd" runat="server" Text="Add Movie" />
        </div>
        </div>
    </div>
</asp:Content>
