using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["authenticated"] == "true")
        {
            String[] S_Info;
            S_Info = Get_Shipping();
            String Address;
            String City;
            String State;

            Address = S_Info[1];
            City = S_Info[2];
            State = S_Info[3];

            FAddress.Text = Address;
            FCity.Text = City;
            FState.Text = State;
        }
        else
        { Response.Redirect("Authenticate.aspx"); }
            
    }
        
       
    
    public String[] Get_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlDataReader MyReader;
        String[] Records_Found = new String[4];

        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myConnection.Open();
        MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        while (MyReader.Read())
        {
            for (int i = 0; i < 4; i++)
            {
                Records_Found[i] = MyReader.GetString(i).Trim();
            }
        }
        myConnection.Close();
        return Records_Found;
    }
    public void btn_click(object sender, EventArgs e)
    {
        Response.Redirect("ThankYou.aspx");
    }
}