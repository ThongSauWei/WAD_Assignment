<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WAD_Assignment.Detail.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Detail.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-1" id="imgSwiperSlide">
                <asp:HiddenField runat="server" ID="hiddenMovieImage" />
                <div class="swiper-container">
                    <div class="typeMenu">
                        <p>
                            <asp:Label runat="server" ID="lblCategory" Style="color: gold;" />
                        </p>
                        <%--<div class="line"></div>
                        <p>Action</p>--%>
                    </div>
                    <div class="movie-titleMenu">
                        <h2>
                            <asp:Label runat="server" ID="lblMovieName" /></h2>

                        <p>
                            <asp:Label runat="server" ID="lblDescription" Style="color: rgb(220, 213, 213); line-height: 4px;" />
                            <p>
                                <span>Director:</span>
                                <asp:Label runat="server" ID="lblDirector" Style="color: rgb(220, 213, 213);" />
                            </p>
                            <p>
                                <span>Cast:</span>
                                <asp:Label runat="server" ID="lblCast" Style="color: rgb(220, 213, 213);" />
                            </p>
                        </p>
                    </div>
                    <div class="movie-rating">
                        <div>
                            <p>
                                <span>Release Date:</span>
                                <asp:Label runat="server" ID="lblReleaseDate" Style="color: rgb(220, 213, 213);" />
                            </p>
                            <p style="color: rgb(220, 213, 213);">
                                <span>Duration:</span>
                                <asp:Label runat="server" ID="lblDuration" Style="color: rgb(220, 213, 213);" />
                                mins
                            </p>
                        </div>
                        <div>
                            <p>
                                <span>Language:</span>
                                <asp:Label runat="server" ID="lblLanguage" Style="color: rgb(220, 213, 213);" />
                            </p>
                            <p>
                                <span>Subtitles:</span>
                                <asp:Label runat="server" ID="lblSubtitle" Style="color: rgb(220, 213, 213);" />
                            </p>
                        </div>
                        <div class="rect">
                            <p>
                                <asp:Label runat="server" ID="lblClassification" />
                            </p>
                        </div>
                    </div>
                    <% if (dateRepeater.Items.Count > 0)
                        { %>
                    <div class="movie-btnMenu">
                        <p><span>Movie Date:</span></p>

                        <!-- button for date -->
                        <div class="btn-container">
                            <asp:Repeater ID="dateRepeater" runat="server">
                                <ItemTemplate>
                                    <button type="button" class="btnHeader btn-primarySign active-btn" id="<%# Eval("identifier") %>">
                                        <%# String.Format("{0:dd MMMM}", DataBinder.Eval(Container.DataItem, "date")) %>
                                    </button>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <% } %>

                    <!-----button for time------->
                    <% if (dateRepeater.Items.Count > 0)
                        { %>
                    <div class="movie-btnMenu" style="margin-top: 8px;">

                        <p><span>Movie Timeslot:</span></p>
                        <asp:Repeater ID="timeRepeater" runat="server">
                            <ItemTemplate>
                                <div class="time-item <%# Eval("identifier") %>">
                                    <a href="#<%# Eval("date", "{0:dd/MM/yyyy}") %> <%# DateTime.Parse(Eval("time").ToString()).ToString("hh:mm tt") %>" class="btnHeader btn-primarySign" style="text-decoration: none; text-align: center; line-height: -5px;">
                                        <%# DateTime.Parse(Eval("time").ToString()).ToString("hh:mm tt") %>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <% } %>

                    <!--------popup----->
                    <asp:Repeater ID="popRepeater" runat="server">
                        <ItemTemplate>
                            <div class="popup" id="<%# Eval("date", "{0:dd/MM/yyyy}") %> <%# DateTime.Parse(Eval("time").ToString()).ToString("hh:mm tt") %>">
                                <div class="popup_inner" style="margin-top: 55px;">
                                    <div class="imgModal">
                                        <img id="Img4" src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                                    </div>
                                    <div class="contentModal">
                                        <h2 style="font-size: 28px;"><%# Eval("movieName") %><p class="titleSmall"><%# Eval("category") %></p>
                                        </h2>

                                        <p>
                                            <span>Duration:</span> <%# Eval("duration") %> mins
                            <p><span>Language:</span> <%# Eval("language") %></p>
                                            <p><span>Subtitles:</span> <%# Eval("subtitle") %></p>
                                            <p><span>Classification:</span> <%# Eval("classification") %></p>
                                            <p><span>Hall:</span> <%# Eval("hallID") %></p>
                                            <p><span>Movie Date:</span> <%# Eval("date", "{0:dd/MM/yyyy}") %></p>
                                            <p><span>Movie Time:</span> <%# DateTime.Parse(Eval("time").ToString()).ToString("hh:mm tt") %></p>
                                        </p>

                                        <a href="../../Member/Booking/Booking.aspx" class="btnHeader btn-primarySign" style="width: 350px; text-decoration: none; line-height: -5px; border-radius: 15px;">

                                            <div class="seatButton" style="margin-left: 90px;">
                                                Select Seats
                                            </div>
                                        </a>
                                    </div>
                                    <a href="#" class="close_popupModal1"><span>X</span></a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

        </div>
    </div>



    <!-- Main Container for Clients Review -->
    <% if (dateRepeater.Items.Count > 0)
        { %>
    <div class="containerReview">
        <h2 class="h2 section-title">Re<strong>view</strong></h2>
        <!-- Clients Review Section -->
        <div class="reviewSection">

            <asp:Repeater ID="reviewRepeater" runat="server">
                <ItemTemplate>
                    <!-- Clients Review-1 Section Starts from Here  -->
                    <div class="reviewItem">
                        <div class="topReview">
                            <div class="clientImage">
                                <img src="./client.png" alt="">
                                <span><%# Eval("custName") %></span>
                            </div>
                            <ul>
                                <%# GenerateStarRating(Convert.ToInt32(Eval("rating"))) %>
                                <%--<li><i class="fa-solid fa-star"></i></li>
                                <li><i class="fa-solid fa-star"></i></li>
                                <li><i class="fa-solid fa-star"></i></li>
                                <li><i class="fa-regular fa-star"></i></li>
                                <li><i class="fa-regular fa-star"></i></li>--%>
                            </ul>
                        </div>
                        <article>
                            <p class="review">
                                <%# Eval("comment") %>
                            </p>
                            <p class="review1"><%# Eval("date", "{0:MMM dd, yyyy}") %></p>
                        </article>
                    </div>

                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
    <% } %>


    <script>
        const menuBtns = document.querySelectorAll('.btnHeader');
        const foodItems = document.querySelectorAll('.time-item');

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
            activeBtn = newMenuBtn;
            foodItems.forEach((item) => {
                if (item.classList.contains(activeBtn)) {
                    item.style.display = "grid";
                } else {
                    item.style.display = "none";
                }
            });
        }
    </script>

    <script>
        // Get the movie image filename from the hidden field
        var movieImage = document.getElementById('<%= hiddenMovieImage.ClientID %>').value;

        // Set the background image of swiper-slide dynamically
        document.getElementById('imgSwiperSlide').style.backgroundImage = "url('../../image/" + movieImage + "')";
    </script>
</asp:Content>

