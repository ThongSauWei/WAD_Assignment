<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WAD_Assignment.Detail.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Detail.css" rel="stylesheet" />

    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-1" id="imgSwiperSlide">
                <asp:HiddenField runat="server" ID="hiddenMovieImage" />
                <div class="swiper-container">
                    <div class="typeMenu">
                        <p><asp:Label runat="server"  ID="lblCategory" style="color:gold;"/></p>
                        <%--<div class="line"></div>
                        <p>Action</p>--%>
                    </div>
                    <div class="movie-titleMenu">
                        <h2><asp:Label runat="server" ID="lblMovieName" /></h2>

                        <p>
                            <asp:Label runat="server" ID="lblDescription" style="color:rgb(220, 213, 213);line-height:4px;"/>
                            <p><span>Director:</span> <asp:Label runat="server" ID="lblDirector" style="color:rgb(220, 213, 213);"/></p>
                            <p><span>Cast:</span> <asp:Label runat="server" ID="lblCast" style="color:rgb(220, 213, 213);"/></p>
                        </p>
                    </div>
                    <div class="movie-rating">
                        <div>
                            <p><span>Release Date:</span> <asp:Label runat="server" ID="lblReleaseDate" style="color:rgb(220, 213, 213);"/></p>
                            <p style="color:rgb(220, 213, 213);"><span>Duration:</span> <asp:Label runat="server" ID="lblDuration" style="color:rgb(220, 213, 213);"/> mins</p>
                        </div>
                        <div>
                            <p><span>Language:</span> <asp:Label runat="server" ID="lblLanguage" style="color:rgb(220, 213, 213);"/></p>
                            <p><span>Subtitles:</span> <asp:Label runat="server" ID="lblSubtitle" style="color:rgb(220, 213, 213);"/></p>
                        </div>
                        <div class="rect">
                            <p><asp:Label runat="server" ID="lblClassification" /></p>
                        </div>
                    </div>
                    <div class="movie-btnMenu">
                        <p><span>Movie Date:</span></p>

                        <!-----button for date------->
                        <div class="btn-container">
                            <button type="button" class="btnHeader btn-primarySign active-btn" id="1">18 June</button>
                            <button type="button" class="btnHeader btn-primarySign" id="2">27 June</button>
                        </div>

                    </div>

                <!-----button for date------->
                    <div class="movie-btnMenu" style="margin-top:8px;">
                        <p><span>Movie Timeslot:</span></p>
                        <div class="time-item 1">
                            <a href="#popup" class="btnHeader btn-primarySign" style="text-decoration: none; text-align:center; line-height: -5px;">2pm</a>
                        </div>

                        <div class="time-item 1">
                            <a href="#popup" class="btnHeader btn-primarySign" style="text-decoration: none; text-align:center; line-height: -5px;">3pm</a>
                        </div>

                        <div class="time-item 2">
                            <a href="#popup1" class="btnHeader btn-primarySign" style="text-decoration: none; text-align:center; line-height: -5px;">4pm</a>
                        </div>
                    </div>

                    <!--------popup----->
                    <div class="popup" id="popup">
                        <div class="popup_inner" style="margin-top: 55px;">
                            <div class="imgModal">

                                <img id="Img4" src="~/image/swipperMovie1.png" runat="server" alt="modalImage" />

                            </div>
                            <div class="contentModal">
                                <h2 style="font-size: 28px;">Thanksgivings<p class="titleSmall">Horror / Adventure</p>
                                </h2>


                                <p>
                                    <span>Duration:</span> 1h 45min
                            <p><span>Language:</span> ENG</p>
                                    <p><span>Subtitles:</span> CHI/BM</p>
                                    <p><span>Classification:</span> 18</p>
                                    <p><span>Hall:</span> Hall 1</p>
                                    <p><span>Movie Date:</span> 17/7/2024</p>
                                    <p><span>Movie Time:</span> 2pm - 4pm</p>
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


                    <div class="popup" id="popup1">
                        <div class="popup_inner" style="margin-top: 55px;">
                            <div class="imgModal">

                                <img id="Img1" src="~/image/swipperMovie1.png" runat="server" alt="modalImage" />

                            </div>
                            <div class="contentModal">
                                <h2 style="font-size: 28px;">27<p class="titleSmall">Horror / Adventure</p>
                                </h2>


                                <p>
                                    <span>Duration:</span> 1h 45min
                            <p><span>Language:</span> ENG</p>
                                    <p><span>Subtitles:</span> CHI/BM</p>
                                    <p><span>Classification:</span> 18</p>
                                    <p><span>Hall:</span> Hall 1</p>
                                    <p><span>Movie Date:</span> 17/7/2024</p>
                                    <p><span>Movie Time:</span> 2pm - 4pm</p>
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


                    <!--
                        <button class="btn-1" style="width:100px;">18 June</button>
                        <button class="btn-1" style="width:100px;">27 June</button>
                        -->


                </div>
            </div>

        </div>
    </div>



    <!-- Main Container for Clients Review -->
    <div class="containerReview">
        <h2 class="h2 section-title">Re<strong>view</strong></h2>
        <!-- Clients Review Section -->
        <div class="reviewSection">

            <!-- Clients Review-1 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="topReview">
                    <div class="clientImage">
                        <img src="./client.png" alt="">
                        <span>Haha heyheyhey</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!
                    </p>
                    <p class="review1">Jan 01, 2023</p>
                </article>
            </div>

            <!-- Clients Review-2 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="topReview">
                    <div class="clientImage">
                        <img src="./client.png" alt="">
                        <span>Testing Name</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!
                    </p>
                    <p class="review1">Jan 01, 2023</p>
                </article>
            </div>

            <!-- Clients Review-3 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="topReview">
                    <div class="clientImage">
                        <img src="./client.png" alt="">
                        <span>haloo testing</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!
                    </p>
                    <p class="review1">Jan 01, 2023</p>
                </article>
            </div>
        </div>
    </div>



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

