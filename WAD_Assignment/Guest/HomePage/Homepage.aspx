<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WAD_Assignment.HomePage.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Homepage.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />


    <div id="divAlert" runat="server" class="alert" visible="false">
        <span class="closebtn1" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong style="color: gold;">Rate successfully!</strong><br />
        TQ for your response !
    </div>
    <!---Banner-->
    <div class="banner">


        <div class="slider">
            <!-- list Items -->
            <div class="list">
                <!-- loop movie banner -->
                <asp:Repeater ID="MovieRepeater" runat="server">
                    <ItemTemplate>
                        <!-- HTML code -->
                        <div class='<%# Container.ItemIndex == 0 ? "item active" : "item" %>'>
                            <img src='../../image/<%# Eval("movieImage") %>'>
                            <div class="contentBanner">
                                <p style="text-transform: uppercase;"><%# Eval("category") %></p>
                                <h2><%# Eval("movieName") %></h2>
                                <div class="descBanner">
                                    <p>
                                        <a href="../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
                                            <span>Book Now</span>
                                        </a>

                                        <%--<a href='<%# Eval("trailerLink") %>' style="width: 250px; display: inline-flex; font-size: 15px; color: var(--citrine);">
                            <ion-icon name="play" style="margin-right: 10px; margin-top: 2px;"></ion-icon>
                            <span>Watch Trailer</span>
                        </a>--%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
                <asp:Repeater ID="thumbnailRepeater" runat="server">
                    <ItemTemplate>
                        <!-- HTML code -->
                        <div class='<%# Container.ItemIndex == 0 ? "item active" : "item" %>'>
                            <img src='../../image/<%# Eval("movieImage") %>'>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>


    <!--Trneding Now-->
    <section class="trendingNow">
        <div class="containerHeader">

            <h2 class="h2 section-title">Trending <strong>Now</strong></h2>

            <ul class="movies-list">

                <asp:Repeater ID="releasedRepeater" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="movie-cardTrending">
                                <a href="../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>">
                                    <figure class="card-banner">
                                        <img src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                                    </figure>
                                </a>
                                <div class="title-wrapper">
                                    <a href="../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>">
                                        <h3 class="card-title"><%# Eval("movieName") %></h3>
                                    </a>
                                </div>
                                <div class="card-meta">
                                    <div class="badge badge-outline"><%# Eval("category") %></div>
                                    <div class="duration">
                                        <ion-icon name="time-outline"></ion-icon>
                                        <time datetime="PT122M"><%# Eval("duration") %></time>
                                    </div>
                                    <div class="languageTrending">
                                        <ion-icon name="language-outline"></ion-icon>
                                        <data><%# GetLanguageCode(Eval("language").ToString()) %></data>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>


            </ul>

        </div>
    </section>


    <!---Top10-->
    <div class="topList">
        <div class="containerHeader">
            <h2 class="h2 section-title">Top <strong>10</strong></h2>

            <section class="T10">
                <div class="T10container">
                    <div class="T10-items">
                        <!-- Top 10 Repeater -->
                        <asp:Repeater ID="rankRepeater" runat="server">
                            <ItemTemplate>
                                <!-- item -->
                                <a href="../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>">
                                    <div class="T10-item">
                                        <!-- img -->
                                        <div class="T10-img">
                                            <img src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                                        </div>

                                        <div class="T10-row">
                                            <div class="T10-content">
                                                <h2 class="T10-name"><%# Eval("movieName") %></h2>
                                                <div class="T10line"></div>
                                                <p class="T10category"><%# Eval("category") %></p>
                                                <ul class="T10rating">
                                                    <%# GenerateStarRating(Convert.ToInt32(Eval("AverageRating"))) %>
                                                </ul>
                                            </div>

                                            <div class="T2"><%# Eval("RankWithLeadingZeros") %></div>
                                        </div>
                                    </div>
                                    <!-- end of item -->
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- Repeater End -->
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- coming  -->
    <section class="coming" id="coming">
        <h2 class="h2 section-title">Upcoming <strong>Movies</strong></h2>
        <!-- coming container  -->
        <div class="coming-container swiper">
            <div class="swiper-wrapper">
                <!-- box-1  -->
                <!-- box repeater  -->
                <asp:Repeater ID="comingRepeater" runat="server">
                    <ItemTemplate>
                        <div class="swiper-slide box">
                            <a href="../Detail/Detail.aspx?movieID=<%# Eval("movieID") %>">
                                <div class="box-img">
                                    <img src='../../image/<%# Eval("movieImage") %>' alt='<%# Eval("movieName") %>' />
                                </div>
                            </a>
                            <h3><%# Eval("movieName") %></h3>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>



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

    <script src="Homepage.js" type="text/javascript"></script>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</asp:Content>

