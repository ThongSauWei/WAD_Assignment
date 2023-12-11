<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WAD_Assignment.Detail.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        header {
            box-shadow: none !important;
        }

        /* ----------------------------------- */
        .swiper {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
        }

        .swiper-slide.slide-1 {
            background-image: url(../HomePage/swipperMovie1.png);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }


        .swiper-slide {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

            .swiper-slide .swiper-container {
                width: 80%;
            }

        .swiper-container .typeMenu {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 1rem;
            color: yellow;
        }

            .swiper-container .typeMenu .line {
                height: 30px;
                width: 1px;
                background-color: black;
            }

            .swiper-container .typeMenu p {
                color: var(--gray);
                font-size: 1.2rem;
            }

        .swiper-container .movie-titleMenu {
            width: 60%;
            margin-top: 3rem;
        }

            .swiper-container .movie-titleMenu h2 {
                color: #fff;
                font-size: 67px;
                font-weight: bold;
                margin-top: -13px;
            }

            .swiper-container .movie-titleMenu p {
                color: #f0eaea;
                font-weight: 300;
                margin-top: 1rem;
                font-size: 18px;
                text-align: justify;
            }

        .swiper-container .movie-rating {
            margin-top: 1rem;
            width: 50%;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 3rem;
        }

            .swiper-container .movie-rating p, .movie-btnMenu p {
                color: #fff;
                font-size: 17px;
                font-weight: 600;
                margin-top: 5px;
            }

                .swiper-container .movie-rating span, .movie-titleMenu p span, .movie-btnMenu p span {
                    color: gold;
                }

        .popup span {
            color: rgb(186, 164, 38);
        }

        .swiper-container .movie-rating .rect {
            margin-left: 5px;
            border: 1px solid #fff;
            padding: 0.6rem;
            width: 38px;
            height: 40px;
        }

            .swiper-container .movie-rating .rect p {
                margin-top: 1px;
            }

        .swiper-container .movie-btnMenu {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .movie-btnMenu .btn-1 {
            border: 2px solid gold;
            width: 175px;
            height: 45px;
            background-color: transparent;
            color: #fff;
            border-radius: 25px;
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            -ms-border-radius: 25px;
            -o-border-radius: 25px;
            /* border: none; */
            outline: none;
            font-size: 1rem;
            font-weight: 700;
            font-family: 'Montserrat',sans-serif;
            letter-spacing: 1.1px;
            cursor: pointer;
            transition: all 0.25s ease-in-out;
            -webkit-transition: all 0.25s ease-in-out;
            -moz-transition: all 0.25s ease-in-out;
            -ms-transition: all 0.25s ease-in-out;
            -o-transition: all 0.25s ease-in-out;
        }

            .movie-btnMenu .btn-1:hover {
                border: none;
                background-color: gold;
                color: #fff;
            }

        @media(max-width:1200px) {
            .swiper-container {
                width: 50%;
            }

                .swiper-container .typeMenu p {
                    font-size: 0.9rem;
                }

                .swiper-container .typeMenu .line {
                    height: 15px;
                }

                .swiper-container .movie-titleMenu {
                    width: 95%;
                }

                    .swiper-container .movie-titleMenu h2 {
                        font-size: 1.4rem;
                    }

                    .swiper-container .movie-titleMenu p {
                        font-size: 0.75rem;
                    }

                .swiper-container .movie-rating {
                    width: 85%;
                }

                    .swiper-container .movie-rating p {
                        font-size: 0.8rem;
                    }

            .movie-btnMenu .btn-1 {
                width: 125px;
                height: 30px;
                font-size: 0.8rem;
            }
        }



        .imgModal img {
            max-width: 100%;
        }

        .popup {
            position: fixed;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
            opacity: 0;
            visibility: hidden;
            bottom: 0;
            right: 0;
            transition: 0.65s ease-in-out;
        }

        .popup_inner {
            display: flex;
            align-items: center;
            position: relative;
            width: 900px;
            height: 600px;
            background-color: rgb(22, 22, 25);
            border-radius: 1rem;
            overflow: hidden;
            bottom: -100vw;
            right: -100vh;
            transform: rotate(90deg);
            transition: 0.65s ease-in-out;
        }

            .popup_inner h2 {
                text-transform: uppercase;
                font-size: 1.6rem;
                text-align: center;
                color: white;
            }

        .contentModal .titleSmall {
            text-align: center;
            color: gray;
            font-size: 13px;
            margin-top: 10px;
            margin-bottom: 8px;
        }

        .popup_inner p {
            color: gray;
            line-height: 1.5rem;
            text-align: justify;
            margin-top: 20px;
        }

        .popup_inner .imgModal {
            height: 100%;
            width: 45%;
        }

            .popup_inner .imgModal img {
                height: 100%;
                object-fit: cover;
            }

        .popup_inner .contentModal {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            width: 55%;
            height: 65%;
            padding: 2.5rem;
        }

        .popup_inner .close_popupModal1 {
            position: absolute;
            display: flex;
            width: 3.5rem;
            height: 3.5rem;
            background-color: black;
            color: #fff;
            line-height: 3.5rem;
            top: -20.4rem;
            right: -20.4rem;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transform: rotate(90deg);
            transition: 0.8s ease-in-out;
            transition-delay: 1s;
        }

        .popup:target {
            opacity: 1;
            visibility: visible;
        }

            .popup:target .popup_inner {
                bottom: 0;
                right: 0;
                transform: rotate(0);
            }

                .popup:target .popup_inner .close_popupModal1 {
                    top: 0.5rem;
                    right: 0.5rem;
                    transform: rotate(0);
                }

        .popup a {
            text-decoration: none;
        }

        /**Review*/
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }
        .containerReview{
            margin-top:730px;
            margin-bottom:-30px;
        }

        .clientImage {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .reviewItem .topReview .clientImage span {
            color: rgb(203, 203, 54);
            font-weight: bold;
        }

        .clientImage img {
            width: 40px;
        }

        .reviewSection {
            padding: 100px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
        }

        .reviewItem {
            width: 600px;
            padding: 10px;
            margin: 10px;
            cursor: pointer;
            border-radius: 10px;
            background-color: #10102a;
            border: 1px solid #10102a;
            transition: all .2s linear;
            padding: 30px 20px;
        }

            .reviewItem:hover {
                border-color: yellow;
                transform: scale(1.01);
                background-color: #090921;
                box-shadow: 0 0px 5px 0px #cbc0c0;
            }

            .reviewItem .topReview li i {
                color: rgb(232, 232, 30);
            }

        .review {
            color: rgb(183, 181, 181);
        }

        .review1 {
            color: white;
        }

        .topReview {
            margin-bottom: 1rem;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

            .topReview ul {
                display: flex;
                list-style: none;
                margin-right: 20px;
            }

                .topReview ul li {
                    padding-left: 4px;
                }

        article p {
            font-size: 15px;
            font-weight: 100;
            margin-bottom: 1rem;
            font-family: system-ui;
            padding: 0px 40px;
        }


        @media screen and (max-width:375px) {
            .reviewSection {
                padding: 0;
            }

            .reviewItem {
                width: 100%;
            }

            .clientImage {
                margin-bottom: 0.6rem;
            }

            .topReview {
                align-items: center;
                flex-direction: column;
                justify-content: center;
            }
        }

        @media screen and (max-width:675px) {
            .reviewItem {
                width: 300px;
            }
        }

        .containerReview .section-title {
            margin-top:780px;
                text-align: center;
                margin-bottom: -50px !important;
                color: var(--white);
                line-height: 1.2;
                font-size: 33px;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

        .containerReview .section-title strong {
            color: var(--citrine);
        }
    </style>

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

                                    <img id="Img4" src="~/HomePage/swipperMovie1.png" runat="server" alt="modalImage" />

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

                                    <a href="../../Member/Booking.aspx" class="btnHeader btn-primarySign" style="width: 350px; text-decoration: none; line-height: -5px; border-radius: 15px;">

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

                                    <img id="Img1" src="~/HomePage/swipperMovie1.png" runat="server" alt="modalImage" />

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

                                    <a href="../../Member/Booking.aspx" class="btnHeader btn-primarySign" style="width: 350px; text-decoration: none; line-height: -5px; border-radius: 15px;">

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
                        <span>Raju Sheoran</span>
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
                        <span>Raju Sheoran</span>
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
                        <span>Raju Sheoran</span>
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

