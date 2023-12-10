<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WAD_Assignment.Detail.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
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
            margin-top: 1rem;
        }

            .swiper-container .movie-titleMenu h2 {
                color: #fff;
                font-size: 67px;
                font-weight: bold;
            }

            .swiper-container .movie-titleMenu p {
                color: #f0eaea;
                font-weight: 300;
                margin-top: 0.3rem;
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

            .swiper-container .movie-rating p {
                color: #fff;
                font-size: 17px;
                font-weight: 600;
            }

            .swiper-container .movie-rating span, .movie-titleMenu p span {
                color: gold;
            }

            .swiper-container .movie-rating .rect {
                margin-left: 5px;
                border: 1px solid #fff;
                padding: 0.6rem;
                width: 20px;
                height: 30px;
            }

                .swiper-container .movie-rating .rect p {
                    margin-top: 6px;
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
    </style>

    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-1">
                <div class="swiper-container">
                    <div class="typeMenu" style="margin-bottom: -30px;">
                        <p>Horror</p>
                        <div class="line"></div>
                        <p>Action</p>
                    </div>
                    <div class="movie-titleMenu" style="margin-top: -10px;">
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
                        <button class="btn-1">Watch Trailer</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

