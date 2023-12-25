using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace WAD_Assignment.Menu
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    cnn.Open();
                    Response.Write("Connection Made");

                    DataTable distinctCategories = GetDistinctCategoriesFromDatabase(connectionString);

                    // Clear existing controls in menuBtnsDiv
                    menuBtnsDiv.Controls.Clear();

                    // Create a default "All" button
                    Button allButton = new Button();
                    allButton.Text = "All";
                    allButton.CssClass = "menu-btn";
                    allButton.ID = "all";
                    allButton.Click += CategoryButton_Click;  // Add click event handler
                    menuBtnsDiv.Controls.Add(allButton);

                    // Create a "Coming Soon" button
                    Button comingSoonButton = new Button();
                    comingSoonButton.Text = "Coming Soon";
                    comingSoonButton.CssClass = "menu-btn";
                    comingSoonButton.ID = "comingSoon";
                    comingSoonButton.Click += CategoryButton_Click;  // Add click event handler
                    menuBtnsDiv.Controls.Add(comingSoonButton);


                    // Add buttons for distinct categories
                    foreach (DataRow row in distinctCategories.Rows)
                    {
                        string category = row["category"].ToString();
                        Button button = new Button();
                        button.Text = category;
                        button.CssClass = "menu-btn";
                        button.ID = category.ToLower();
                        button.Click += CategoryButton_Click;  // Add click event handler
                        menuBtnsDiv.Controls.Add(button);
                    }
                }

                // Assuming menuBtnsDiv.Controls[0] exists and is a Button control
                string firstButtonId = ((Button)menuBtnsDiv.Controls[0]).ID.ToLower();
                LoadMoviesForCategory(firstButtonId);
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        private DataTable GetDistinctCategoriesFromDatabase(string connectionString)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT DISTINCT category FROM Movie WHERE status = 'released'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }
                }
            }

            return dataTable;
        }

        private DataTable GetMoviesFromDatabase(string category = null)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString))
            {
                string query = "SELECT movieID, movieName, movieImage, category, duration FROM Movie";

                // Add condition to include only released movies for the "All" category
                if (string.IsNullOrEmpty(category) || category.ToLower() == "all")
                {
                    query += " WHERE status = 'released'";
                }
                else if (category.ToLower() == "comingsoon")
                {
                    // Include only pending movies for the "Coming Soon" category
                    query += " WHERE releaseDate >= CAST(GETDATE() AS DATE) AND status = 'pending'";
                }
                else
                {
                    query += " WHERE category = @category AND status = 'released'";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrEmpty(category) && category.ToLower() != "comingsoon")
                    {
                        command.Parameters.AddWithValue("@category", category);
                    }

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }
                }
            }

            return dataTable;
        }



        private DataTable GetMoviesForCategoryFromDatabase(string category)
        {
            return GetMoviesFromDatabase(category);
        }

        private DataTable GetAllMoviesFromDatabase()
        {
            return GetMoviesFromDatabase();
        }



        private void CategoryButton_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;

            if (clickedButton != null)
            {
                string selectedCategory = clickedButton.ID.ToLower();

                // Load movies for the selected category
                LoadMoviesForCategory(selectedCategory);
            }
        }



        private void LoadMoviesForCategory(string category)
        {
            DataTable moviesForCategory = category.ToLower() == "all"
                ? GetAllMoviesFromDatabase()
                : GetMoviesForCategoryFromDatabase(category);

            // Set the data source for the repeater
            menuRepeater.DataSource = moviesForCategory;

            // Bind the data to the repeater
            menuRepeater.DataBind();
        }
    }
}