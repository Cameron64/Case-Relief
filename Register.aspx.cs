using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {        
        string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
        Match match = Regex.Match(email.Text.Trim(), pattern, RegexOptions.IgnoreCase);
        
        if (fName.Text == "")
        {
            error.Text = "First name cannot be left blank";
            return;
        }
        if (lName.Text == "")
        {
            error.Text = "Last name cannot be left blank";
            return;
        }
        if (!match.Success)
        {
            error.Text = "email is not valid";
            return;
        }
        
        if (password.Text != passwordConfirm.Text)
        {
            error.Text = ("Passwords do not match");
            return;
        }
        if (password.Text == "")
        {
            error.Text = "Password cannot be blank";
            return;
        }

        String admin = "yes";

        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@returnemail", email.Text);
        myCommand.Parameters.AddWithValue("@returnPassword", password.Text);
        myCommand.Parameters.AddWithValue("@returnFName", fName.Text);
        myCommand.Parameters.AddWithValue("@returnLName", lName.Text);
        myCommand.Parameters.AddWithValue("@admin", admin);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();

        Response.Redirect("Login.aspx");
    }
}