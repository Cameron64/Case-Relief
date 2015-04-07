using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.SqlClient;
using System.Data;



public partial class Input : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Session["Admin"].ToString() == "yes"))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            
        }
    }
   
    protected void submit_Click(object sender, EventArgs e)
    {

      


        if (IName.Text == "")
        {
            error.Text = "Item name cannot be left blank";
            return;
        }
        if (IModel.Text == "")
        {
            error.Text = "Model name cannot be left blank";
            return;
        }
        if (IRating.Text == "")
        {
            error.Text = "Rating cannot be left blank";
            return;
        }
        
        if (IDescription.Text == "")
        {
            error.Text = "Description cannot be blank";
            return;
        }
        if (IPrice.Text == "")
        {
            error.Text = "Price cannot be blank";
            return;
        }
        /*if (IPhoto.HasFile)
        {
            try
            {
                if (IPhoto.PostedFile.ContentType == "image/jpeg")
                {
                    if (IPhoto.PostedFile.ContentLength < 512000)
                    {
                        string filename = Path.GetFileName(IPhoto.FileName);
                        IPhoto.SaveAs(Server.MapPath("~/img/phones/") + filename);
                        StatusLabel.Text = "Upload status: File uploaded!";
                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 500 kb!";
                    return;
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
                return;
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                return;
            }
        } */
        if (IPhoto.Text == "")
        {
            error.Text = "Photo name cannot be blank";
            return;
        }
        if (IStock.Text == "")
        {
            error.Text = "Stock boolean cannot be blank";
            return;
        }
        if (INStock.Text == "")
        {
            error.Text = "Number In stock cannot be blank";
            return;
        }


        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand MyCommand = new SqlCommand(SqlDataSource1.InsertCommand);
        MyCommand.Connection = myConnection;
        MyCommand.Parameters.AddWithValue("@IName", IName.Text);
        MyCommand.Parameters.AddWithValue("@IModel", IModel.Text);
        MyCommand.Parameters.AddWithValue("@IRating", IRating.Text);
        MyCommand.Parameters.AddWithValue("@IDescription", IDescription.Text);
        MyCommand.Parameters.AddWithValue("@IPrice", IPrice.Text);
        MyCommand.Parameters.AddWithValue("@IPhoto", IPhoto.Text);
        MyCommand.Parameters.AddWithValue("@IStock", IStock.Text);
        MyCommand.Parameters.AddWithValue("@INStock", INStock.Text);



        SqlDataReader myReader;
        myConnection.Open();
        myReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();

        Response.Redirect("Input.aspx");

    }
}