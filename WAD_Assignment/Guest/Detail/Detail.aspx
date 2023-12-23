<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WAD_Assignment.Detail.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Detail.css" rel="stylesheet" />

    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-1">
                <div class="swiper-container">
                    <div class="typeMenu">
                        <p>Horror</p>
                        <div class="line"></div>
                        <p>Action</p>
                    </div>
                    <div class="movie-titleMenu">
                        <h2>Thanksgiving</h2>

                        <p>
                            After a Black Friday riot ends in tragedy, a mysterious Thanksgiving-inspired killer terrorizes Plymouth, Massachusetts – the birthplace of the holiday. Picking off residents one by one, what begins as random revenge killings are soon revealed to be part of a larger, sinister holiday plan. Will the town uncover the killer and survive the holidays...or become guests at his twisted holiday dinner table?
                            <p><span>Director:</span> Eli Roth</p>
                            <p><span>Cast:</span> Patrick Dempsey, Addison Rae, Milo Manheim, Jalen Thomas Brooks, Nell Verlaque, Rick Hoffman, and Gina Gershon</p>
                        </p>
                    </div>
                    <div class="movie-rating">
                        <div>
                            <p><span>Release Date:</span> 30 November 2023</p>
                            <p><span>Duration:</span> 1 hr 46 mins</p>
                        </div>
                        <div>
                            <p><span>Language:</span> ENG</p>
                            <p><span>Subtitles:</span> CHI</p>
                        </div>
                        <div class="rect">
                            <p>18</p>
                        </div>
                    </div>
                    <div class="movie-btnMenu">
                        <p><span>Movie Timeslot:</span></p>

                        <!--
                        <asp:Button ID="Button1" class="btn-1" runat="server" Text="18 June" />
                        <asp:Button ID="Button2" class="btn-1" runat="server" Text="27 June" />
                        -->

                        <a href="#popup" class="btnHeader btn-primarySign" style="width: 130px; text-decoration: none; line-height: -5px;">18 June</a>

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
                        
                        
                        

                        <a href="#popup1" class="btnHeader btn-primarySign" style="width: 130px; text-decoration: none; line-height: -5px;">27 June</a>

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
    </div>

    

    <!-- Main Container for Clients Review -->
    <div class="containerReview">
        <h2 class="h2 section-title"> Re<strong>view</strong></h2>
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
</asp:Content>

