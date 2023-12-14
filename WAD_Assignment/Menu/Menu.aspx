<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WAD_Assignment.Menu.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <style>
        .moviesMenu{
            margin-top:150px;
            margin-bottom:50px;
        }
        .moviesMenu .section-title {
            text-align: center;
            margin-bottom: 45px;
            color: var(--white);
            line-height: 1.2;
            font-size: 33px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

            .moviesMenu .section-title strong {
                color: var(--citrine);
            }

        /* moviesMenu  */
        .movies-container {
            max-width: 1300px;
            margin-right: auto;
            margin-left: auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, auto));
            gap: 2rem;
            margin-top: 1rem;
        }

            .movies-container a {
                text-decoration: none;
            }

        .boxMenu .box-img {
            width: 100%;
            height: 330px;
            cursor: pointer;
        }

            .boxMenu .box-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 10px;
            }

                .boxMenu .box-img img:hover {
                    transform: translateY(-10px);
                    transition: 0.2s all linear;
                }

        .boxMenu h3 {
            font-size: 16px;
            font-weight: 500;
            margin-top: 10px;
            color: #fbfaf8;
        }

        .boxMenu span {
            font-size: 14px;
            margin-top: 10px;
            color: #dfdddb;
        }

        /* responsive  */
        @media (max-width: 774px) {
            .movies-container {
                grid-template-columns: repeat(auto-fit, minmax(160px, auto));
            }
        }

        @media (max-width: 472px) {
            .movies-container {
                grid-template-columns: repeat(auto-fit, minmax(140px, auto));
            }

            .boxMenu.box-img img {
                height: 310px;
            }

            .coming-container img {
                width: 100%;
                max-height: 500px;
            }
        }
    </style>

    <!-- movies  -->
    <section class="moviesMenu" id="movies">
        <h2 class="h2 section-title">Mo<strong>vie</strong></h2>
        <!-- movies container  -->
        <div class="movies-container">
            <!-- box-1  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie1.png" alt="">
                    </div>
                    <h3>Thanksgiving</h3>
                    <span>1h 12min | Horror</span>
                </div>
            </a>

            <!-- box-2  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie2.jpg" alt="">
                    </div>
                    <h3>Aquaman and the Lost Kingdom</h3>
                    <span>1h 45min | Action</span>
                </div>
            </a>

            <!-- box-3  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie3.jpg" alt="">
                    </div>
                    <h3>Wish</h3>
                    <span>1h 22min | Musical</span>
                </div>
            </a>

            <!-- box-4  -->
            <a href="#">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie4.jpg" alt="">
                    </div>
                    <h3>War On Terror: KL Anarki</h3>
                    <span>1h 30min | Action</span>
                </div>
            </a>

            <!-- box-5  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>

            <!-- box-6  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>

            <!-- box-7  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>

            <!-- box-8  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>

            <!-- box-9  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>

            <!-- box-10  -->
            <a href="../Detail/Detail.aspx">
                <div class="boxMenu">
                    <div class="box-img">
                        <img src="../HomePage/swipperMovie5.jpeg" alt="">
                    </div>
                    <h3>Wonka</h3>
                    <span>1h 45min | Musical</span>
                </div>
            </a>
        </div>
    </section>

</asp:Content>
