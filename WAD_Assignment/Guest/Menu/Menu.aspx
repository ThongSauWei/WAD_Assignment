<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="WAD_Assignment.Menu.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Menu.css" rel="stylesheet" />

    <!-- movies  -->
    <section class="moviesMenu" id="movies">
        <h2 class="h2 section-title">Mo<strong>vie</strong></h2>

        <div class="menu-btns" id="menuBtnsDiv" runat="server">
            <!-- Dynamic buttons will be added here -->
        </div>

        <!-- movies container  -->
        <div class="movies-container">
            <!-- box-1  -->
            <asp:Repeater ID="menuRepeater" runat="server">
                <ItemTemplate>
                    <div class='food-item <%# Eval("category") %>'>
                        <a href='../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>'>
                            <div class="boxMenu">
                                <div class="box-img">
                                    <img src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                                </div>
                                <h3><%# Eval("movieName") %></h3>
                                <span><%# Eval("duration") %> | <%# Eval("category") %></span>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <script>
        const menuBtns = document.querySelectorAll('.menu-btn');
        const foodItems = document.querySelectorAll('.food-item');

        let activeBtn = "allMovie";

        showFoodMenu(activeBtn);

        menuBtns.forEach((btn) => {
            btn.addEventListener('click', () => {
                resetActiveBtn();
                showFoodMenu(btn.id);
                btn.classList.add('active-btn');
            });
        });

        function resetActiveBtn() {
            menuBtns.forEach((btn) => {
                btn.classList.remove('active-btn');
            });
        }


        function showFoodMenu(newMenuBtn) {
            resetActiveBtn();
            activeBtn = newMenuBtn;
            menuBtns.forEach((btn) => {
                if (btn.id === activeBtn) {
                    btn.classList.add('active-btn');
                }
            });

            foodItems.forEach((item) => {
                if (activeBtn === "allMovie" || item.classList.contains(activeBtn)) {
                    item.style.display = "grid";
                } else {
                    item.style.display = "none";
                }
            });
        }


    </script>

</asp:Content>
