<%@ Page Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="TTT.aspx.cs" Inherits="WAD_Assignment.TTT" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .hero {
            background: url("movie2.jpg") no-repeat;
            background-size: cover;
            background-position: center;
            min-height: 750px;
            height: 100vh;
            max-height: 1000px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding-block: var(--section-padding);
        }

        .hero-content {
            margin-top: 60px;
        }

        .hero-subtitle {
            color: var(--citrine);
            font-size: var(--fs-4);
            font-weight: var(--fw-700);
            margin-bottom: 10px;
        }

        .hero-title {
            margin-bottom: 30px;
        }

            .hero-title > strong {
                color: var(--citrine);
            }
    </style>
    <section class="hero">
        <div class="container">

            <div class="hero-content">

                <p class="hero-subtitle">Filmlane</p>

                <h1 class="h1 hero-title">Unlimited <strong>Movie</strong>, TVs Shows, & More.
                </h1>

                <div class="meta-wrapper">

                    <div class="badge-wrapper">
                        <div class="badge badge-fill">PG 18</div>

                        <div class="badge badge-outline">HD</div>
                    </div>

                    <div class="ganre-wrapper">
                        <a href="#">Romance,</a>

                        <a href="#">Drama</a>
                    </div>

                    <div class="date-time">

                        <div>
                            <ion-icon name="calendar-outline"></ion-icon>

                            <time datetime="2022">2022</time>
                        </div>
                        <div>
                            <ion-icon name="time-outline"></ion-icon>

                            <time datetime="PT128M">128 min</time>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary">
                    <ion-icon name="play"></ion-icon>

                    <span>Watch now</span>
                </button>
            </div>
        </div>
    </section>

</asp:Content>
