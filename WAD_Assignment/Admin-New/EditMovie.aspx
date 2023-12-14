<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="EditMovie.aspx.cs" Inherits="WAD_Assignment.Admin_New.EditMovie" %>

<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .edit-content {
            margin: 180px auto 0;
            height: 350px;
            width: 50%;
        }

        .left-side {
            height: 100%;
            width: 50%;
            float:left;
        }

        .right-side {
            height: 100%;
            width: 50%;
            float: left;
            overflow-y: scroll;
        }
    </style>

    <div class="edit-content">
        <div class="left-side">
            <img src="../image/movie1.jpg" width="270px" height="330px"/>
        </div>
        <div class="right-side">
            <h2 style="text-align: center;">Edit Movie</h2>
            <div class="movie-input">
                <asp:Label ID="lblMovieName" runat="server" Text="Movie Name:"></asp:Label>
                <asp:TextBox ID="txtMovieName" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblMovieDesc" runat="server" Text="Movie Description:"></asp:Label>
                <asp:TextBox ID="txtMovieDesc" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Value="action">Action</asp:ListItem>
                    <asp:ListItem Value="horror">Horror</asp:ListItem>
                    <asp:ListItem Value="musical">Musical</asp:ListItem>
                </asp:DropDownList>
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
                <asp:Calendar ID="calEndDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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
                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="coming soon">Coming Soon</asp:ListItem>
                    <asp:ListItem Value="releasing">Releasing</asp:ListItem>
                    <asp:ListItem Value="ended">Ended</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblDuration" runat="server" Text="Duration:"></asp:Label>
                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblLanguage" runat="server" Text="Language:"></asp:Label>
                <asp:RadioButtonList ID="rblLanguage" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="english">English</asp:ListItem>
                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                    <asp:ListItem Value="malay">Malay</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblSubtitle" runat="server" Text="Subtitle:"></asp:Label>
                <asp:CheckBoxList ID="cblSubtitle" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="english">English</asp:ListItem>
                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                    <asp:ListItem Value="malay">Malay</asp:ListItem>
                </asp:CheckBoxList>
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
                <asp:Label ID="lblDirector" runat="server" Text="Director:"></asp:Label>
                <asp:TextBox ID="txtDirector" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblCast" runat="server" Text="Cast:"></asp:Label>
                <asp:TextBox ID="txtCast" runat="server"></asp:TextBox>
            </div>
            <div class="movie-input">
                <asp:Label ID="lblMovieImage" runat="server" Text="Movie Image:"></asp:Label>
                <asp:FileUpload ID="imgUpload" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
