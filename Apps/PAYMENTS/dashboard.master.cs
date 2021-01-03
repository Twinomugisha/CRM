using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PAYMENTS_dashboard : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        loadControls();
    }


    private void loadControls()
    {
        if (Session["Name"] != null)
        {
            lbluser.Text = Session["Name"].ToString();
        }
        else
        {
            Response.Redirect("./Login.aspx");
            lbluser.Text = Session["Email"].ToString();

            Session.Remove("Name");
        }
    }
    private void Login_Click(object sender, EventArgs e)
    {

        Session.Remove("Name");

    }
}
    

