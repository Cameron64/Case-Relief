using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Shopping : System.Web.UI.Page
{
    public String final = "";
    int i = 0;
    public String data = "";
    public void Page_Load(object sender, EventArgs e)
    {

        SqlDataReader MyReader;

        SqlConnection myConnection = new SqlConnection("Data Source=mimas.itds.unt.edu;Initial Catalog=TeamNet;Persist Security Info=True;User ID=ECUser;Password=10nrszMoc1");
        string countQuery = "SELECT count(*) from [Phones]";
        SqlCommand countRecords = new SqlCommand(countQuery, myConnection);
        myConnection.Open();
        int count = (int)countRecords.ExecuteScalar();
        myConnection.Close();
        SqlCommand myCommand = new SqlCommand("SELECT [Name], [Model], [Rating], [Description], [Price], [Photo], [InStock], [NumInStock] FROM [Phones]");
        myCommand.Connection = myConnection;
        myConnection.Open();

        MyReader = myCommand.ExecuteReader();

        while (MyReader.Read())
        {
            ReadSingleRow((IDataRecord)MyReader, count);

        }

        myConnection.Close();

    }
    public void ReadSingleRow(IDataRecord record, int count)
    {

        if (i == 0)
        {
            data += "[";
            data += "{'Name':'" + record[0].ToString().Trim() + "', 'Model':'" + record[1] + "', 'Rating':" + record[2] + ", 'Description':'" + record[3] + "', 'Price':" + record[4] + ", 'Photo':'" + record[5] + "', 'InStock':'" + record[6] + "', 'NumInStock':" + record[7] + "}]";

            i = 1;
            return;
        }
        if (i == count - 1)
        {
            data = data.TrimEnd(']');
            data += ", ";
            data += "{'Name':'" + record[0].ToString().Trim() + "', 'Model':'" + record[1] + "', 'Rating':" + record[2] + ", 'Description':'" + record[3] + "', 'Price':" + record[4] + ", 'Photo':'" + record[5] + "', 'InStock':'" + record[6] + "', 'NumInStock':" + record[7] + "}]";
            final += data;
            return;
        }

        data = data.TrimEnd(']');
        data += ", ";
        data += "{'Name':'" + record[0].ToString().Trim() + "', 'Model':'" + record[1] + "', 'Rating':" + record[2] + ", 'Description':'" + record[3] + "', 'Price':" + record[4] + ", 'Photo':'" + record[5] + "', 'InStock':'" + record[6] + "', 'NumInStock':" + record[7] + "}]";
        i++;
    }

}