using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        String ReturnEmail = "";
        String ReturnPassword = "";
        String Admin = "";
        SqlDataReader MyReader;

        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@UserEmail", UserEmail.Text);
        myCommand.Parameters.AddWithValue("@UserPassword", UserPassword.Text);
        myConnection.Open();
        MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        while (MyReader.Read())
        {
            ReturnEmail = MyReader.GetString(2).Trim() + " " + MyReader.GetString(3).Trim();
            ReturnPassword = MyReader.GetString(1).Trim();
            Admin = MyReader.GetString(4);
        }
        myConnection.Close();
        if (UserPassword.Text == "" || UserEmail.Text == "")
            ErrorMessage.Text = "Fields cannot be left blank";
        else if (UserPassword.Text.Trim() == ReturnPassword)
        {
            Session["SessionEmail"] = UserEmail.Text.Trim();
            Session["authenticated"] = "true";
            Session["Admin"] = Admin;
            Response.Redirect("http://ecom.unt.edu/TeamNet");
        }
        else
        {
            ErrorMessage.Text = "<script>if(confirm('These credentials do not apear to match our records. Would you like to register?')){window.location.replace('http://ecom.unt.edu/TeamNet/Register.aspx');}</script>";
        }
    }

}