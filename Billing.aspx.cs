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

    public void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["authenticated"] == "true"){  }
        else
        {
            Response.Redirect("Authenticate.aspx");
        }
        if (Check_Billing())
        {
            String[] B_Info;
            B_Info = Get_Billing();
            Address.Text = B_Info[1];
            City.Text = B_Info[2];
            DropDownListState.Text = B_Info[3];
        }
        if (Check_Shipping())
        {
            String[] S_Info;
            S_Info = Get_Shipping();
            SAddress.Text = S_Info[1];
            SCity.Text = S_Info[2];
            SDropDownListState.Text = S_Info[3];
        }
        if (Check_Billing() && Check_Shipping())
        {
            Form_Enabled(false);
        }
    }
    //if Shipping address is the same as Billing
    public void Submit_Click(object sender, EventArgs e)
    {
        //if email is not null
        if (!CB(Session["SessionEmail"].ToString()))
        {
            //Check if blank fields in Billing
            if (CB(Address.Text) || CB(City.Text))
            {
                error.Text = "Fields cannot be left blank";
                return;
            }
            //if no blanks
            else
            {
                error.Text = "";
                //check if user's billing address is in database
                if (Check_Billing())
                {
                    //if also in shipping DB
                    if (Check_Shipping())
                    {
                        //update both to = billing input
                        Update_Shipping_With_Billing();


                        return;
                    }
                    Update_Billing_With_Shipping();

                    //set current shipping to = billing input
                }
                else
                {
                    //if user's billing info not in db, update shipping = billing
                    
                        if (Update_Billing())
                        {
                        }
                        else
                        {
                            error.Text = "Problem inserting into billing database";
                            return;
                        }
                        if (Insert_Billing_Into_Shipping())
                        {
                            Response.Redirect("Finalize.aspx");
                        }
                        else
                        {
                            error.Text = "Problem inserting into billing database";
                            return;
                        }

                }
            }
        }
        else
        {
            Response.Redirect("Authenticate.aspx");
            return;
        }
    }
    public void SSubmit_Click(object sender, EventArgs e)
    {
        if (!CB(SAddress.Text) && !CB(SCity.Text) && !CB(Address.Text) && !CB(City.Text))
        {
            //if kept record
            if (Check_Billing())
            {
                Response.Redirect("Finalize.aspx");
            }
            else
            {
                Update_Billing();
                Update_Shipping();
                Response.Redirect("Finalize.aspx");
            }
        }
        else
        {
            Serror.Text = "Fields cannot be left blank";
            return;
        }
    }
    //end main line
    // CB(string) returns true if blank
    public void Form_Enabled(Boolean tf)
    {
        Address.Enabled = tf;
        City.Enabled = tf;
        DropDownListState.Enabled = tf;
        SAddress.Enabled = tf;
        SCity.Enabled = tf;
        SDropDownListState.Enabled = tf;

    }
    public void Clear_Form(object sender, EventArgs e)
    {
        if (Check_Shipping() && Check_Billing())
        {
            Delete_Billing();
            Delete_Shipping();
            Response.Redirect("Billing.aspx");
        }
        
    }
    public Boolean Check_Shipping()
    {
        String Email = Session["SessionEmail"].ToString().Trim();
        SqlDataReader MyReader;
        Boolean Record_Found = false;

        SqlConnection myConnection = new SqlConnection(SqlDataSource4.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource4.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myConnection.Open();
        MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

        while (MyReader.Read())
        {

            if (MyReader.GetString(0).Length < 1)
            {
                Record_Found = false;
            }
            else
            {
                Record_Found = true;
            }
        }
       

        myConnection.Close();
        return Record_Found;
    }

    public Boolean Check_Billing()
    {
        String Email = Session["SessionEmail"].ToString().Trim();
        SqlDataReader MyReader;
        Boolean Record_Found = false;

        SqlConnection myConnection = new SqlConnection(SqlDataSource3.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource3.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myConnection.Open();
        MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        
        while (MyReader.Read())
        {
            if (MyReader.GetString(0).Length < 1)
            {
                Record_Found = false;
            }
            else
            {
                Record_Found = true;
            }
        }
       
        myConnection.Close();
        return Record_Found;
    }
    
    public String[] Get_Billing()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlDataReader MyReader;
        String[] Records_Found = new String[4];

        SqlConnection myConnection = new SqlConnection(SqlDataSource3.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource3.SelectCommand);
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
        error.Text = Records_Found[3];

        return Records_Found;
    }

    public String[] Get_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlDataReader MyReader;
        String[] Records_Found = new String[4];

        SqlConnection myConnection = new SqlConnection(SqlDataSource4.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource4.SelectCommand);
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

    public Boolean Update_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource2.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@SAddress", SAddress.Text);
        myCommand.Parameters.AddWithValue("@SCity", SCity.Text);
        myCommand.Parameters.AddWithValue("@SState", SDropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        return true;
    }

    public Boolean Update_Billing()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", Address.Text);
        myCommand.Parameters.AddWithValue("@City", City.Text);
        myCommand.Parameters.AddWithValue("@State", DropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        return true;
    }

    public Boolean Update_Billing_With_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource8.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource8.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", SAddress.Text);
        myCommand.Parameters.AddWithValue("@City", SCity.Text);
        myCommand.Parameters.AddWithValue("@State", SDropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        return true;
    }

    public Boolean Insert_Billing_Into_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource7.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource7.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", Address.Text);
        myCommand.Parameters.AddWithValue("@City", City.Text);
        myCommand.Parameters.AddWithValue("@State", DropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        return true;
    }

    public Boolean Update_Shipping_With_Billing()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource5.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource5.UpdateCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", Address.Text);
        myCommand.Parameters.AddWithValue("@City", City.Text);
        myCommand.Parameters.AddWithValue("@State", DropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        error.Text = "updating";
        return true;

    }
    public Boolean Delete_Shipping()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource5.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource5.DeleteCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", Address.Text);
        myCommand.Parameters.AddWithValue("@City", City.Text);
        myCommand.Parameters.AddWithValue("@State", DropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        error.Text = "updating";
        return true;

    }

    public Boolean Delete_Billing()
    {
        String Email = Session["SessionEmail"].ToString();
        SqlConnection myConnection = new SqlConnection(SqlDataSource6.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource6.DeleteCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Email", Email);
        myCommand.Parameters.AddWithValue("@Address", Address.Text);
        myCommand.Parameters.AddWithValue("@City", City.Text);
        myCommand.Parameters.AddWithValue("@State", DropDownListState.Text);

        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();
        error.Text = "updating";
        return true;

    }

    
    //returns true if blank
    public Boolean CB(String s)
    {
        return (s == "" || s == null );
    }

    
}