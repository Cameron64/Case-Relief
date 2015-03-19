using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Shop : System.Web.UI.Page
{
    public String final = "";
    int i = 0;
    public String data = "";
    public void Page_Load(object sender, EventArgs e)
    {

        SqlDataReader MyReader;

        SqlConnection myConnection = new SqlConnection("Data Source=mimas.itds.unt.edu;Initial Catalog=Student4720;Persist Security Info=True;User ID=StudentUser;Password=10nrszMoc1");
        string countQuery = "SELECT count(*) from [User]";
        SqlCommand countRecords = new SqlCommand(countQuery, myConnection);
        myConnection.Open();
        int count = (int)countRecords.ExecuteScalar();
        myConnection.Close();
        SqlCommand myCommand = new SqlCommand("SELECT [Email], [Password], [FName], [LName], [YoB] FROM [User]");
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
            data += "{'Email':'" + record[0].ToString().Trim() + "', 'Password':'" + record[1] + "'}]";

            i = 1;
            return;
        }
        if (i == count - 1)
        {
            data = data.TrimEnd(']');
            data += ", ";
            data += "{'Email':'" + record[0].ToString().Trim() + "','Password':'" + record[1].ToString().Trim() + "'}]";
            final += data;
            return;
        }

        data = data.TrimEnd(']');
        data += ", ";
        data += "{'Email':'" + record[0].ToString().Trim() + "','Password':'" + record[1].ToString().Trim() + "'}]";
        i++;
    }
    
}