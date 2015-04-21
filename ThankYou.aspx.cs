using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class PassProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string Process(List<RootObject> Product)
    {
        PassProducts pass = new PassProducts();
        string[] names = new string[Product.Count];
        int[] quantities = new int[Product.Count];
        int i = 0;
        string build = "";
        foreach (var prop in Product)
        {
            names[i] = prop.Name;
            quantities[i] = prop.Quantity;
            i++;
        }
        SqlDataReader MyReader;

        for (var j = 0; j < names.Length; j++)
        {

            Boolean Record_Found = false;
            string query = "SELECT [Name], [NumInStock] FROM [Phones] WHERE ([Name] = @Name AND [NumInStock] >= @Quantity)";
            SqlConnection myConnection = new SqlConnection("Data Source=mimas.itds.unt.edu;Initial Catalog=TeamNet;Persist Security Info=True;User ID=TeamNetAdmin;Password=63R1AQK9w");
            SqlCommand myCommand = new SqlCommand(query);
            myCommand.Connection = myConnection;
            myCommand.Parameters.AddWithValue("@Name", names[j]);
            myCommand.Parameters.AddWithValue("@Quantity", quantities[j]);

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


            if (Record_Found)
            {
                build += "Name: " + names[j] + " ";
                build += "Quantity: " + quantities[j].ToString() + " ,";
            }
            else
            {
                return build = "0";
            }
        }
        return build;
    }
    public class RootObject
    {
        public string Name { get; set; }
        public string Model { get; set; }
        public int Rating { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Photo { get; set; }
        public string InStock { get; set; }
        public int NumInStock { get; set; }
        public int Quantity { get; set; }
    }

    public Boolean Check_Product(String Name, int Quantity)
    {
        SqlDataReader MyReader;
        Boolean Record_Found = false;

        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@Name", Name);
        myCommand.Parameters.AddWithValue("@Quantity", Quantity);

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
}