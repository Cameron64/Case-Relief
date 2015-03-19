using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class Input : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        if (IPhoto.Text == "")
        {
            error.Text = "Photo cannot be blank";
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




        Response.Redirect("Default.aspx");
    }
}