using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Configuration;

namespace TrendyStore.User
{
    public partial class signup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the request is a postback (i.e., form submission)
            if (IsPostBack)
            {
                // Get the connection string from web.config file
                string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

                // Create a new SqlConnection using the connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Create a SQL command to insert data into the database
                        string query = "INSERT INTO UserInfo (Name, Email, Password) VALUES (@Name, @Email, @Password)";
                        SqlCommand command = new SqlCommand(query, connection);

                        // Add parameters to the command to prevent SQL injection
                        command.Parameters.AddWithValue("@Name", TextBox1.Text);
                        command.Parameters.AddWithValue("@Email", Textbox2.Text);
                        command.Parameters.AddWithValue("@Password", Textbox3.Text);

                        // Execute the command
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the insertion was successful
                        
                            if (rowsAffected > 0)
                            {
                                // Data inserted successfully
                                Response.Write("<script>alert('Registration successful');</script>");
                                Response.Redirect("login.aspx");
                            }

                            else
                            {
                            // Failed to insert data
                            Response.Write("<script>alert('Registration failed');</script>");
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL exceptions
                        if (ex.Number == 2627 || ex.Number == 2601)
                        {
                            // Unique constraint violation error (duplicate entry)
                            Response.Write("<script>alert('Email already registered');</script>");
                            Response.Redirect("login.aspx");
                        }
                        else
                        {
                            // Other SQL errors
                            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions
                        Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                    }
                    finally
                    {
                        // Close the connection
                        connection.Close();
                    }
                }
            }
        }
    }
}
        
    
    
