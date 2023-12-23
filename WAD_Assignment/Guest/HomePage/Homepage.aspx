<%@ Page Language="C#" MasterPageFile="../../MasterPage/Header.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WAD_Assignment.HomePage.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Homepage.css" rel="stylesheet" />

    <!---Banner-->
    <div class="banner">
        <div class="slider">
            <!-- list Items -->
            <div class="list">
                <div class="item active">
                    <img src="../../image/swipperMovie1.png">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Horror</p>
                        <h2>Thanksgiving</h2>
                        <div class="descBanner">
                            <p>
                                <a href="../Detail/Detail.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
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
                    <img src="../../image/swipperMovie2.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Action &#9679; Fantasy</p>
                        <h2>Aquaman and the Lost Kingdom</h2>
                        <div class="descBanner">
                            <p>
                                <a href="../Detail/Detail.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
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
                    <img src="../../image/swipperMovie3.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Musical &#9679; Fantasy</p>
                        <h2>Wish</h2>
                        <div class="descBanner">
                            <p>
                                <a href="../Detail/Detail.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
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
                    <img src="../../image/swipperMovie4.jpg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Action &#9679; Crime</p>
                        <h2>War On Terror: KL Anarki</h2>
                        <div class="descBanner">
                            <p>
                                <a href="../Detail/Detail.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
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
                    <img src="../../image/swipperMovie5.jpeg">
                    <div class="contentBanner">
                        <p style="text-transform: uppercase;">Musical &#9679; Fantasy</p>
                        <h2>Wonka</h2>
                        <div class="descBanner">
                            <p>
                                <a href="../Detail/Detail.aspx" class="btnHeader btn-primarySign" style="width: 150px; display: inline-block;">
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
                    <img src="../../image/swipperMovie1.png">
                </div>
                <div class="item">
                    <img src="../../image/swipperMovie2.jpg">
                </div>
                <div class="item">
                    <img src="../../image/swipperMovie3.jpg">
                </div>
                <div class="item">
                    <img src="../../image/swipperMovie4.jpg">
                </div>
                <div class="item">
                    <img src="../../image/swipperMovie5.jpeg">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie1.png" alt="Thanksgiving">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie2.jpg" alt="Aquaman and the Lost Kingdom">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie3.jpg" alt="Wish">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie4.jpg" alt="War On Terror: KL Anarki">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie5.jpeg" alt="Wonka">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie1.png" alt="Thanksgiving">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie2.jpg" alt="Aquaman and the Lost Kingdom">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                        <a href="../Detail/Detail.aspx">
                            <figure class="card-banner">
                                <img src="../../image/swipperMovie3.jpg" alt="Wish">
                            </figure>
                        </a>

                        <div class="title-wrapper">
                            <a href="../Detail/Detail.aspx">
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

                <li style="background-image: url('https://localhost:44348/image/swipperMovie1.png'); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>01</h2>
                    <h3>Thanksgiving</h3>
                    <p>
                        Horror
                    </p>
                    <a href="../Detail/Detail.aspx" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url('https://localhost:44348/image/swipperMovie5.jpeg'); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>02</h2>
                    <h3>Wonka</h3>
                    <p>
                        Musical
                    </p>
                    <a href="../Detail/Detail.aspx" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url('https://localhost:44348/image/swipperMovie3.jpg'); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>03</h2>
                    <h3>Wish</h3>
                    <p>
                        Musical
                    </p>
                    <a href="../Detail/Detail.aspx" class="navbar-social-link">
                        <button class="btnHeader btn-primarySign">View</button>
                    </a>
                </li>
                <li style="background-image: url('https://localhost:44348/image/swipperMovie4.jpg'); background-size: cover; background-position: center; width: 100%; height: 100%;">
                    <h2>04</h2>
                    <h3>War On Terror: KL Anarki</h3>
                    <p>
                        Action
                    </p>
                    <a href="../Detail/Detail.aspx" class="navbar-social-link">
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
                    <a href="../Detail/Detail.aspx">
                        <div class="box-img">
                            <img src="../../image/swipperMovie1.png" alt="">
                        </div>
                    </a>
                    <h3>Thanksgiving</h3>
                </div>

                <!-- box-2  -->
                <div class="swiper-slide box">
                    <a href="../Detail/Detail.aspx">
                        <div class="box-img">
                            <img src="../../image/swipperMovie2.jpg" alt="">
                        </div>
                    </a>
                    <h3>Aquaman and the Lost Kingdom</h3>
                </div>

                <!-- box-3  -->
                <div class="swiper-slide box">
                    <a href="../Detail/Detail.aspx">
                    <div class="box-img">
                        <img src="../../image/swipperMovie3.jpg" alt="">
                    </div></a>
                    <h3>Wish</h3>
                </div>

                <!-- box-4  -->
                <div class="swiper-slide box">
                    <a href="../Detail/Detail.aspx">
                    <div class="box-img">
                        <img src="../../image/swipperMovie4.jpg" alt="">
                    </div></a>
                    <h3>War On Terror: KL Anarki</h3>
                </div>

                <!-- box-5  -->
                <div class="swiper-slide box">
                    <a href="../Detail/Detail.aspx">
                    <div class="box-img">
                        <img src="../../image/swipperMovie5.jpeg" alt="">
                    </div></a>
                    <h3>Wonka</h3>
                </div>

                <!-- box-6  -->
                <div class="swiper-slide box">
                    <a href="../Detail/Detail.aspx">
                    <div class="box-img">
                        <img src="../../image/swipperMovie6.jpg" alt="">
                    </div></a>
                    <h3>Five Nights At Freddy's</h3>
                </div>


            </div>
        </div>
    </section>

    <!--swipper-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script src="Homepage.js" type="text/javascript"></script>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</asp:Content>

