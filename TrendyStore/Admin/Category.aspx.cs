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

namespace TrendyStore.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["breadCumbTitle"] = "Manage Category";
            Session["breadCumbPage"] = "Category";
            lblmsg.Visible = false;
            getCategories();
        }

        void getCategories()
        {
            con = new SqlConnection(Utils.getConncetion());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();

        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidExecute = false;
            int categoryId = Convert.ToInt32(hfCategoryId.Value);
            con = new SqlConnection(Utils.getConncetion());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
            if (fuCategoryImage.HasFile)
            {
                if (Utils.isValidExtension(fuCategoryImage.FileName))
                {
                    string newImageName = Utils.getUniqueId();
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "Images/Category/" + newImageName.ToString() + fileExtension;
                    fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + newImageName.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@CategoryImageUrl", imagePath);
                    isValidExecute = true;
                }
                else
                {
                    lblmsg.Visible = false;
                    lblmsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblmsg.CssClass = "alert alert-danger";
                    isValidExecute = false;

                }
            }
            else
            {
                isValidExecute = true;
            }

                if(isValidExecute)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        actionName = categoryId == 0 ? "inserted" : "Updated";
                        lblmsg.Visible = true;
                        lblmsg.Text = "Category " + actionName + " successfully!";
                        lblmsg.CssClass = "alert alert-Success";
                         getCategories();
                    clear();

                    }
                    catch (Exception ex)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Error " + ex.Message;
                        lblmsg.CssClass = "alert alert-danger";
                    }
                    finally
                    {
                        con.Close();
                    
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

            void clear()
            {
                txtCategoryName.Text = string.Empty;
            cbIsActive.Checked = false;
                hfCategoryId.Value = "0";
                btnAddOrUpdate.Text = "Add";
                imagePreview.ImageUrl = string.Empty;
            }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblmsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Utils.getConncetion());
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtCategoryName.Text = dt.Rows[0]["CategoryName"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imagePreview.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["CategoryImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["CategoryImageUrl"].ToString();
                imagePreview.Height = 200;
                imagePreview.Width = 200;
                hfCategoryId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
            }
            else if (e.CommandName == "delete");
            {
                con = new SqlConnection(Utils.getConncetion());
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblmsg.Visible = true;
                    lblmsg.Text = "Category deleted successfully!";
                    lblmsg.CssClass = "alert alert-Success";
                    getCategories();
                }
                catch (Exception ex)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error " + ex.Message;
                    lblmsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();

                }
            }
        }
    }
}