<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WAD_Assignment.HomePage.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
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
            margin-bottom: 300px;
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
                font-family: monospace;
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
            bottom: -410px;
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

        @media all and (min-width: 768px) and (max-width: 1200px) {
            .thumbnail {
                bottom: -610px;
            }

            .slider .list .item .contentBanner h2 {
                font-size: 50px;
                margin-top: 8px;
                margin-bottom: 8px;
            }
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
                                <a href="booking.aspx" class="btnHeader btn-primary" style="width: 150px; display: inline-block;">
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
                                <a href="booking.aspx" class="btnHeader btn-primary" style="width: 150px; display: inline-block;">
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
                                <a href="booking.aspx" class="btnHeader btn-primary" style="width: 150px; display: inline-block;">
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
                                <a href="booking.aspx" class="btnHeader btn-primary" style="width: 150px; display: inline-block;">
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
                                <a href="booking.aspx" class="btnHeader btn-primary" style="width: 150px; display: inline-block;">
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
                <button id="prev">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </button>
                <button id="next">
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

</asp:Content>

