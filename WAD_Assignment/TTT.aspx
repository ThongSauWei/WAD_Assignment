<%@ Page Language="C#" MasterPageFile="/MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="TTT.aspx.cs" Inherits="WAD_Assignment.TTT" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800;900&family=Kaushan+Script&family=Montserrat:wght@200;300;400;500;600;700;800;900&display=swap');

        :root {
            --Inter: 'Inter', sans-serif;
            --Kaushan: 'Kaushan Script', cursive;
            --Mont: 'Montserrat', sans-serif;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            line-height: 1.5;
            font-family: var(--Mont);
            background-color: #44355b;
            color: #fff;
        }

        .menu {
            margin: 2rem 0;
        }

        .menu-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        img {
            width: 100%;
            display: block;
        }

        .menu-head {
            text-align: center;
        }

            .menu-head h2 {
                font-family: var(--Kaushan);
                font-size: 2.6rem;
            }

            .menu-head p {
                font-weight: 300;
                padding: 1.8rem 0;
            }

        .menu-btns {
            padding: 0.6rem 0;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .menu-btn {
            font-family: var(--Inter);
            text-transform: uppercase;
            font-size: 1.1rem;
            font-weight: 600;
            background: none;
            border: none;
            color: #ff9505;
            display: block;
            margin: 0 1rem;
            cursor: pointer;
            outline: 0;
            transition: opacity 0.4s ease-out;
        }

            .menu-btn::after {
                content: "";
                display: block;
                height: 2px;
                margin-left: auto;
                margin-right: auto;
                background: #ff9505;
                margin-top: 0.5rem;
                width: 0;
                transition: width 0.4s ease-out;
            }

            .menu-btn:hover::after {
                width: 100%;
            }

            .menu-btn:hover {
                opacity: 0.8;
            }

        .active-btn {
            color: #fff;
        }

        .food-items {
            margin: 2rem 0;
        }

        .food-item {
            border-radius: 4px;
            overflow: hidden;
            background: #fff;
            color: #000;
            margin: 0.6rem 0;
            box-shadow: 0 0 16px -4px rgba(0, 0, 0, 0.75);
            display:;
            animation: fadeIn 2s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .food-img img {
            border-radius: 4px;
        }

        .food-content {
            padding: 1rem;
        }

        .food-name {
            font-family: var(--Inter);
            color: #ff9505;
            font-weight: 500;
            text-transform: capitalize;
        }

        .line {
            width: 100px;
            height: 3px;
            background: #ff9505;
        }

        .food-price {
            padding: 0.4rem 0;
            font-weight: 600;
            font-size: 1.4rem;
            opacity: 0.8;
        }

        .rating {
            display: flex;
            list-style: none;
        }

            .rating .fa-star {
                margin-right: 0.4rem;
                color: #44355b;
            }

        .category {
            padding-top: 0.2rem;
            font-size: 1rem;
            font-weight: 800;
            font-family: var(--Inter);
        }

            .category span {
                font-weight: 500;
            }

        @media screen and (min-width: 600px) {
            .food-item {
                display: grid;
                grid-template-columns: 25% auto;
                align-items: center;
                padding: 1rem;
                column-gap: 1rem;
            }

            .food-content {
                padding: 0;
            }
        }

        @media screen and (min-width: 768px) {
            .menu-head p {
                width: 70%;
                margin-left: auto;
                margin-right: auto;
            }
        }

        @media screen and (min-width: 992px) {
            .menu-head p {
                width: 50%;
            }

            .food-items {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                column-gap: 2rem;
            }
        }
    </style>


    <section class="menu">
        <div class="menu-container">
            <div class="menu-head">
                <h2>Special Food Menu</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod accusantium porro tempora aliquid officiis voluptate necessitatibus minus obcaecati. Quod perferendis numquam dignissimos odio nobis asperiores!</p>
            </div>


            <div class="menu-btns" id="menuBtnsDiv" runat="server">
                <!-- Dynamic buttons will be added here -->
            </div>

            <div class="food-items" id="foodItemsDiv" runat="server">
                <!-- Movie items will be added here -->
                <asp:Repeater ID="movieRepeater" runat="server">
                    <ItemTemplate>
                        <div class='food-item <%# Eval("category") %>'>
                            <div class='food-img'>
                                <img src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                            </div>
                            <div class='food-content'>
                                <h2 class='food-name'><%# Eval("movieName") %></h2>
                                <!-- Add more details as needed -->
                                <p class='category'>Categories: <span><%# Eval("category") %></span></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>


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
