<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WAD_Assignment.HomePage.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        header {
            box-shadow: none !important;
        }

        .descBanner a {
            text-decoration: none;
            display: block;
        }

        .descBanner span {
            display: block;
        }
        /*Banner*/
        .banner {
            z-index: -1;
        }

        .slider {
            height: 107vh;
            margin-top: -50px;
            position: relative;
            margin-bottom: 30px;
            /* z-index: -1; */
        }

            .slider .list .item {
                position: absolute;
                inset: 0 0 0 0;
                /* overflow: hidden; */
                opacity: 0;
                transition: .5s;
            }

                .slider .list .item img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .slider .list .item .contentBanner {
                    position: absolute;
                    left: 10%;
                    top: 20%;
                    width: 900px;
                    max-width: 80%;
                    z-index: 1;
                }

        .contentBanner {
            margin-top: 50px;
            color: #e9e6e6;
        }

        .slider .list .item .contentBanner p:nth-child(1) {
            /* text-transform: uppercase; */
            letter-spacing: 3px;
            font-size: 19px;
            color: var(--citrine);
            font-weight: bold;
        }

        .slider .list .item .contentBanner h2 {
            font-size: 80px;
            margin: 0;
            margin-top: 3px;
            margin-bottom: 4px;
        }

        .slider .list .item.active {
            opacity: 1;
            z-index: 10;
        }

        @keyframes showContent {
            to {
                transform: translateY(0);
                filter: blur(0);
                opacity: 1;
            }
        }

        .slider .list .item.active p:nth-child(1),
        .slider .list .item.active h2,
        .slider .list .item.active p:nth-child(3) {
            transform: translateY(30px);
            filter: blur(20px);
            opacity: 0;
            animation: showContent .5s .7s ease-in-out 1 forwards;
        }

        .slider .list .item.active h2 {
            animation-delay: 1s;
        }

        .slider .list .item.active p:nth-child(3) {
            animation-duration: 1.3s;
        }

        .arrows {
            position: absolute;
            top: 30%;
            right: 50px;
            z-index: 11;
            display: inline-block;
        }

            .arrows button {
                /* background-color: #eee5; */
                border: none;
                width: 40px;
                height: 40px;
                border-radius: 5px;
                font-size: x-large;
                color: #eee;
                transition: .5s;
            }

                .arrows button:hover {
                    /* background-color: #eee; */
                    color: var(--citrine);
                }

        .thumbnail {
            position: absolute;
            bottom: -390px;
            z-index: 11;
            display: flex;
            gap: 10px;
            width: 100%;
            height: 100%;
            padding: 100px 50px;
            box-sizing: border-box;
            overflow: auto;
            justify-content: center;
        }

            .thumbnail::-webkit-scrollbar {
                width: 0;
            }

            .thumbnail .item {
                width: 150px;
                height: 220px;
                filter: brightness(.5);
                transition: .5s;
                flex-shrink: 0;
            }

                .thumbnail .item img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    border-radius: 10px;
                }

                .thumbnail .item.active {
                    filter: brightness(1.2);
                }

                .thumbnail .item .content {
                    position: absolute;
                    inset: auto 10px 10px 10px;
                }

        @media screen and (max-width: 678px) {
            .thumbnail {
                justify-content: start;
            }

            .slider .list .item .content h2 {
                font-size: 60px;
            }

            .arrows {
                top: 10%;
            }
        }



        @media (max-width: 767px) {
            .slider .list .item .contentBanner h2 {
                font-size: 30px;
                margin-top: 8px;
                margin-bottom: 8px;
            }

            .slider .list .item .contentBanner p:nth-child(1) {
                /* text-transform: uppercase; */
                letter-spacing: 3px;
                font-size: 12px;
            }

            .slider .list .item .contentBanner .descBanner {
                font-size: 30px;
                margin: 0;
            }

            .arrows {
                display: none;
            }
        }

        @media all and (min-width: 768px) and (max-width: 1300px) {
            .thumbnail {
                bottom: -320px;
            }

            .slider .list .item .contentBanner h2 {
                font-size: 50px;
                margin-top: 8px;
                margin-bottom: 8px;
            }
        }

        /*upcoming*/
        .coming, .trendingNow {
            margin-top: 75px;
            margin-bottom: 50px;
            font-weight: bold;
        }

            .coming .section-title, .trendingNow .section-title, .topList .section-title {
                text-align: center;
                margin-bottom: 45px;
                color: var(--white);
                line-height: 1.2;
                font-size: 33px;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

        .section-title strong {
            color: var(--citrine);
        }


        .box .box-img {
            width: 100%;
            height: 380px;
            cursor: pointer;
        }

            .box .box-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

                .box .box-img img:hover {
                    transform: translateY(-10px);
                    transition: 0.2s all linear;
                }

        .box h3 {
            font-size: 0.9rem;
            font-weight: 500;
        }

        /* coming containrer  */
        .coming-container {
            display: grid;
            gap: 1rem;
            max-width: 1300px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 2rem;
        }

            .coming-container .box img:hover {
                transform: translateY(0);
            }

            .coming-container .box img {
                border-radius: 15px;
            }

        .swiper-slide h3 {
            font-size: 17px;
            margin-top: 5px;
            color: #dfdddb;
        }


        @media (max-width: 774px) {

            /* baad m  */
            header.shadow #menu-icon {
                color: var(--text-color);
            }
        }

        @media (max-width: 472px) {
            .box .box-img img {
                height: 350px;
            }

            .coming-container img {
                width: 100%;
                max-height: 500px;
            }

            .swiper-slide h3 {
                margin-top: 0px;
            }
        }

        /**Trending Now*/
        .movies-list {
            display: grid;
            gap: 50px;
        }

        .movie-cardTrending {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .movie-cardTrending .card-banner {
                position: relative;
                background: var(--gunmetal-1);
                aspect-ratio: 2 / 3;
                border-radius: 6px;
                overflow: hidden;
                margin-bottom: 20px;
                transition: var(--transition-1);
            }

                .movie-cardTrending .card-banner::after {
                    content: "";
                    position: absolute;
                    inset: 0;
                    transition: var(--transition-1);
                }

                .movie-cardTrending .card-banner:hover {
                    box-shadow: 0 1px 2px hsla(0, 0%, 0%, 0.5);
                }

                    .movie-cardTrending .card-banner:hover::after {
                        background: hsla(0, 0%, 100%, 0.05);
                    }

                .movie-cardTrending .card-banner img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

            .movie-cardTrending .title-wrapper {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 20px;
                margin-bottom: 10px;
            }

            .movie-cardTrending .card-meta .duration time {
                color: #e2dedb;
            }

            .movie-cardTrending .card-title {
                color: var(--white);
                font-size: 17px;
                transition: var(--transition-1);
            }

                .movie-cardTrending .card-title:is(:hover, :focus) {
                    color: var(--citrine);
                }

            .movie-cardTrending .title-wrapper time {
                color: var(--citrine);
                font-size: var(--fs-9);
                font-weight: var(--fw-500);
            }

            .movie-cardTrending .card-meta {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                gap: 15px;
            }

            .movie-cardTrending .badge {
                color: var(--citrine);
            }

            .movie-cardTrending .duration {
                margin-left: auto;
            }

            .movie-cardTrending :is(.duration, .languageTrending) {
                display: flex;
                align-items: center;
                gap: 5px;
                color: #e2dedb;
                font-size: var(--fs-11);
                font-weight: var(--fw-500);
            }

                .movie-cardTrending :is(.duration, .languageTrending) ion-icon {
                    font-size: 13px;
                    --ionicon-stroke-width: 50px;
                    color: var(--citrine);
                }

        .trendingNow {
            background-position: center;
            padding-block: var(--section-padding);
        }

            .trendingNow li {
                list-style: none;
            }

            .trendingNow a {
                text-decoration: none;
                display: block;
            }

            .trendingNow .section-title {
                margin-bottom: 50px;
            }

            .trendingNow .filter-list {
                gap: 15px;
                margin-bottom: 50px;
            }

            .trendingNow .filter-btn {
                position: relative;
                background: var(--rich-black-fogra-39);
                color: var(--light-gray);
                font-size: var(--fs-10);
                font-weight: var(--fw-700);
                text-transform: uppercase;
                padding: 17px 25px;
                border-radius: 4px;
                box-shadow: inset 0 3px 7px hsla(0, 0%, 0%, 0.8);
            }

                .trendingNow.filter-btn:focus {
                    color: var(--citrine);
                    text-shadow: 0 3px 25px hsla(57, 97%, 45%, 0.5);
                }

                    .trendingNow .filter-btn:focus::before,
                    .trendingNow .filter-btn:focus::after {
                        content: "";
                        position: absolute;
                        top: 50%;
                        transform: translateY(-50%);
                        background: var(--citrine);
                        width: 2px;
                        height: 15px;
                    }

                    .trendingNow .filter-btn:focus::before {
                        left: 0;
                    }

                    .trendingNow .filter-btn:focus::after {
                        right: 0;
                    }


        /*-----------------------------------*\
   * #MEDIA QUERIES
  \*-----------------------------------*/

        @media (max-width: 440px) {
            .movies-list {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 450px) {

            :root {
                /**
       * typography
       */

                --fs-1: 42px;
            }

            .container {
                max-width: 540px;
                margin-inline: auto;
            }

            .movies-list {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        @media (min-width: 768px) {
            :root {
                /**
       * typography
       */

                --fs-2: 36px;
            }


            .container {
                max-width: 720px;
            }

            .movies-list {
                grid-template-columns: repeat(3, 1fr);
            }
        }


        @media (min-width: 992px) {
            .container {
                max-width: 960px;
            }

            /* MOVIE CARD */

            .movies-list {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (min-width: 1200px) {

            :root {
                /**
       * typography
       */

                --fs-1: 60px;
                --fs-4: 26px;
            }

            /**
     * REUSED STYLE
     */

            .container {
                max-width: 1320px;
            }

            /* MOVIE CARD */

            .movies-list {
                grid-template-columns: repeat(4, 1fr);
            }
        }


        /*top10*/
        .tilesWrap {
            padding: 0;
            margin: 50px auto;
            list-style: none;
            text-align: center;
        }

            .tilesWrap li {
                display: inline-block;
                width: 20%;
                min-width: 200px;
                max-width: 230px;
                padding: 80px 20px 40px;
                position: relative;
                vertical-align: top;
                margin: 10px;
                min-height: 25vh;
                background: #262a2b;
                border: 1px solid #252727;
                text-align: left;
            }

                .tilesWrap li h2 {
                    font-size: 114px;
                    margin: 0;
                    position: absolute;
                    opacity: 0.2;
                    top: 50px;
                    right: 10px;
                    transition: all 0.3s ease-in-out;
                    color: #575b5c;
                }

                .tilesWrap li h3 {
                    font-size: 25px;
                    color: #d6d3d3;
                    margin-bottom: 5px;
                }

                .tilesWrap li p {
                    font-size: 16px;
                    line-height: 18px;
                    color: #adabab;
                    margin-top: 5px;
                }

                .tilesWrap li button {
                    background: transparent;
                    border: 1px solid #b7b7b7;
                    padding: 10px 20px;
                    color: #b7b7b7;
                    border-radius: 3px;
                    position: relative;
                    transition: all 0.3s ease-in-out;
                    transform: translateY(-40px);
                    opacity: 0;
                    cursor: pointer;
                    overflow: hidden;
                }

                .tilesWrap li a {
                    text-decoration: none;
                }

                .tilesWrap li button:before {
                    content: '';
                    position: absolute;
                    height: 100%;
                    width: 120%;
                    background: var(--citrine);
                    top: 0;
                    opacity: 0;
                    left: -140px;
                    border-radius: 0 20px 20px 0;
                    z-index: -1;
                    transition: all 0.3s ease-in-out;
                }

                .tilesWrap li:hover button {
                    transform: translateY(5px);
                    opacity: 1;
                }

                .tilesWrap li button:hover {
                    color: #262a2b;
                }

                    .tilesWrap li button:hover:before {
                        left: 0;
                        opacity: 1;
                    }

                .tilesWrap li:hover h2 {
                    top: 0px;
                    opacity: 0.6;
                    color: #64696b;
                }

                .tilesWrap li:before {
                    content: '';
                    position: absolute;
                    top: -2px;
                    left: -2px;
                    right: -2px;
                    bottom: -2px;
                    z-index: -1;
                    background: #fff;
                    transform: skew(2deg, 2deg);
                }

                .tilesWrap li:after {
                    content: '';
                    position: absolute;
                    width: 40%;
                    height: 100%;
                    left: 0;
                    top: 0;
                    background: rgba(255, 255, 255, 0.02);
                }

                .tilesWrap li:before {
                    background: #656565;
                }
    </style>

    <!---Banner-->
    <div class="banner">
        <div class="slider">
            <!-- list Items -->
            <div class="list">
                <div class="item active">
                    <img src="swipperMovie1.png">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Horror</p>
                        <h2>Thanksgiving</h2>
                        <div class="descBanner">
                            <p>
                                <a href="booking.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                    <span>Book Now</span>
                                </a>

                                <a href="https://youtu.be/KbU50SdL8zA" style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                                    <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                                    <span>Watch Trailer</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="swipperMovie2.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Action &#9679; Fantasy</p>
                        <h2>Aquaman and the Lost Kingdom</h2>
                        <div class="descBanner">
                            <p>
                                <a href="booking.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                    <span>Book Now</span>
                                </a>

                                <a href="haha.html" style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                                    <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                                    <span>Watch Trailer</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="swipperMovie3.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Musical &#9679; Fantasy</p>
                        <h2>Wish</h2>
                        <div class="descBanner">
                            <p>
                                <a href="booking.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                    <span>Book Now</span>
                                </a>

                                <a href="haha.html" style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                                    <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                                    <span>Watch Trailer</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="swipperMovie4.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Action &#9679; Crime</p>
                        <h2>War On Terror: KL Anarki</h2>
                        <div class="descBanner">
                            <p>
                                <a href="booking.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                    <span>Book Now</span>
                                </a>

                                <a href="haha.html" style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                                    <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                                    <span>Watch Trailer</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="swipperMovie5.jpeg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Musical &#9679; Fantasy</p>
                        <h2>Wonka</h2>
                        <div class="descBanner">
                            <p>
                                <a href="booking.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                    <span>Book Now</span>
                                </a>

                                <a href="haha.html" style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                                    <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                                    <span>Watch Trailer</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <!-- button arrows -->
            <div class="arrows">
                <button id="prev" type="button">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </button>
                <button id="next" type="button">
                    <ion-icon name="chevron-forward-outline"></ion-icon>
                </button>
            </div>
            <!-- thumbnail -->
            <div class="thumbnail">
                <div class="item active">
                    <img src="swipperMovie1.png">
                </div>
                <div class="item">
                    <img src="swipperMovie2.jpg">
                </div>
                <div class="item">
                    <img src="swipperMovie3.jpg">
                </div>
                <div class="item">
                    <img src="swipperMovie4.jpg">
                </div>
                <div class="item">
                    <img src="swipperMovie5.jpeg">
                </div>
            </div>
        </div>
    </div>

    <!--Trneding Now-->
    <section class="trendingNow">
        <div class="containerHeader">

            <h2 class="h2 section-title">Trending <strong>Now</strong></h2>

            <ul class="movies-list">

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie1.png" alt="Thanksgiving">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Thanksgiving</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Horror</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 12min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie2.jpg" alt="Aquaman and the Lost Kingdom">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Aquaman and the Lost Kingdom</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Action</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 45min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie3.jpg" alt="Wish">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Wish</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Musical</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 22min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie4.jpg" alt="War On Terror: KL Anarki">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">War On Terror: KL Anarki</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Action</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 30min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie5.jpeg" alt="Wonka">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Wonka</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Musical</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 45min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie1.png" alt="Thanksgiving">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Thanksgiving</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Horror</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 12min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie2.jpg" alt="Aquaman and the Lost Kingdom">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Aquaman and the Lost Kingdom</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Action</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 45min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

                <li>
                    <div class="movie-cardTrending">

                        <a href="./movie-details.html">
                            <figure class="card-banner">
                                <img src="swipperMovie3.jpg" alt="Wish">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="./movie-details.html">
                                <h3 class="card-title">Wish</h3>
                            </a>


                        </div>

                        <div class="card-meta">
                            <div class="badge badge-outline">Musical</div>

                            <div class="duration">
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT122M">1h 22min</time>
                            </div>

                            <div class="languageTrending">
                                <ion-icon name="language-outline"></ion-icon>

                                <data>ENG</data>
                            </div>
                        </div>

                    </div>
                </li>

            </ul>

        </div>
    </section>


    <!---Top4-->
    <div class="topList">
        <div class="containerHeader">
            <h2 class="h2 section-title">Top <strong>4</strong></h2>

            <ul class="tilesWrap">

                <li style="background-image: url(swipperMovie1.png); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>01</h2>
                    <h3>Thanksgiving</h3>
                    <p>
                        Horror
                    </p>
                    <a href="haha.html" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url(swipperMovie5.jpeg); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>02</h2>
                    <h3>Wonka</h3>
                    <p>
                        Musical
                    </p>
                    <a href="haha.html" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url(swipperMovie3.jpg); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>03</h2>
                    <h3>Wish</h3>
                    <p>
                        Musical
                    </p>
                    <a href="haha.html" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url(swipperMovie4.jpg); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>04</h2>
                    <h3>War On Terror: KL Anarki</h3>
                    <p>
                        Action
                    </p>
                    <a href="haha.html" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>


            </ul>
        </div>

    </div>

    <!-- coming  -->
    <section class="coming" id="coming">
        <h2 class="h2 section-title">Upcoming <strong>Movies</strong></h2>
        <!-- coming container  -->
        <div class="coming-container swiper">
            <div class="swiper-wrapper">
                <!-- box-1  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie1.png" alt="">
                    </div>
                    <h3>Thanksgiving</h3>
                </div>

                <!-- box-2  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie2.jpg" alt="">
                    </div>
                    <h3>Aquaman and the Lost Kingdom</h3>
                </div>

                <!-- box-3  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie3.jpg" alt="">
                    </div>
                    <h3>Wish</h3>
                </div>

                <!-- box-4  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie4.jpg" alt="">
                    </div>
                    <h3>War On Terror: KL Anarki</h3>
                </div>

                <!-- box-5  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                </div>

                <!-- box-6  -->
                <div class="swiper-slide box">
                    <div class="box-img">
                        <img src="swipperMovie6.jpg" alt="">
                    </div>
                    <h3>Five Nights At Freddy's</h3>
                </div>


            </div>
        </div>
    </section>





    <!--swipper-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script>
        let items = document.querySelectorAll('.slider .list .item');
        let next = document.getElementById('next');
        let prev = document.getElementById('prev');
        let thumbnails = document.querySelectorAll('.thumbnail .item');

        // config param
        let countItem = items.length;
        let itemActive = 0;
        // event next click
        next.onclick = function () {
            itemActive = itemActive + 1;
            if (itemActive >= countItem) {
                itemActive = 0;
            }
            showSlider();
        }
        //event prev click
        prev.onclick = function () {
            itemActive = itemActive - 1;
            if (itemActive < 0) {
                itemActive = countItem - 1;
            }
            showSlider();
        }
        // auto run slider
        let refreshInterval = setInterval(() => {
            next.click();
        }, 5000)
        function showSlider() {
            // remove item active old
            let itemActiveOld = document.querySelector('.slider .list .item.active');
            let thumbnailActiveOld = document.querySelector('.thumbnail .item.active');
            itemActiveOld.classList.remove('active');
            thumbnailActiveOld.classList.remove('active');

            // active new item
            items[itemActive].classList.add('active');
            thumbnails[itemActive].classList.add('active');

            // clear auto time run slider
            clearInterval(refreshInterval);
            refreshInterval = setInterval(() => {
                next.click();
            }, 5000)
        }

        // click thumbnail
        thumbnails.forEach((thumbnail, index) => {
            thumbnail.addEventListener('click', () => {
                itemActive = index;
                showSlider();
            })
        })
    </script>


    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script>
        // responsive 

        var swiper = new Swiper(".coming-container", {
            loop: true,
            spaceBetween: 20,
            centeredSlides: true,
            autoplay: {
                delay: 4000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 2,
                },
                568: {
                    slidesPerView: 3,
                },
                768: {
                    slidesPerView: 4,
                },
                968: {
                    slidesPerView: 5,
                }
            }
        });

    </script>

</asp:Content>

