using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WAD_Assignment.Entity
{
    public class Movie
    {
        private string movieId;
        private string movieName;
        private string movieDesc;
        private string movieImgUrl;
        private int duration;
        private string category;
        private DateTime releaseDate;
        private string status;
        private string language;
        private string subtitle;
        private string classification;
        private string director;
        private string cast;
        private double price;

        public Movie()
        {

        }

        public Movie(string movieId, string movieName, string movieDesc, string movieImgUrl, int duration, string category,
            DateTime releaseDate, string status, string language, string subtitle, string classification, string director,
            string cast, double price)
        {
            MovieId = movieId;
            MovieName = movieName;
            MovieDesc = movieDesc;
            MovieImgUrl = movieImgUrl;
            Duration = duration;
            Category = category;
            ReleaseDate = releaseDate;
            Status = status;
            Language = language;
            Subtitle = subtitle;
            Classification = classification;
            Director = director;
            Cast = cast;
            Price = price;
        }

        public string MovieId { get => movieId; set => movieId = value; }
        public string MovieName { get => movieName; set => movieName = value; }
        public string MovieDesc { get => movieDesc; set => movieDesc = value; }
        public string MovieImgUrl { get => movieImgUrl; set => movieImgUrl = value; }
        public int Duration { get => duration; set => duration = value; }
        public string Category { get => category; set => category = value; }
        public DateTime ReleaseDate { get => releaseDate; set => releaseDate = value; }
        public string Status { get => status; set => status = value; }
        public string Language { get => language; set => language = value; }
        public string Subtitle { get => subtitle; set => subtitle = value; }
        public string Classification { get => classification; set => classification = value; }
        public string Director { get => director; set => director = value; }
        public string Cast { get => cast; set => cast = value; }
        public double Price { get => price; set => price = value; }
    }
}