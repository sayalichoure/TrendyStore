using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrendyStore.User
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)

        {
            // Get the connection string from web.config file

            if (IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

                // Create a new SqlConnection using the connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define the username and password from the textboxes
                    string Email = TextBox1.Text;
                    string Password = TextBox2.Text;

                    // Define the SQL query to check user credentials
                    string query = "SELECT * FROM AdminInfo WHERE Email = @Email AND Password = @Password";

                    // Create a SqlCommand object with the query and connection
                    SqlCommand command = new SqlCommand(query, connection);

                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@Email", Email);
                    command.Parameters.AddWithValue("@Password", Password);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the query and store the result in a DataTable
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            // Authentication successful
                            // Redirect to the home page or any other desired page
                            Response.Redirect("~/Admin/Dashboard.aspx");
                        }
                        else
                        {
                            // Authentication failed
                            // Display an error message indicating invalid credentials
                            Response.Write("<script>alert('Invalid username or password');</script>");
                            Response.Redirect("signup.aspx");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}
