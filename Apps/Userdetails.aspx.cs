using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Userdetails : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    DataTable dtGetRequests;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetGridUser();
    }
    private void GetGridUser()
    {

        dtGetRequests = dac.GetGridUser();

        DataGrid6.DataSource = dtGetRequests;
        DataGrid6.DataBind();
    }
    protected void DataGrid6_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        try
        {
            string code = e.Item.Cells[1].Text;
            Response.Redirect("./PAYMENTS/Register.aspx?transferid=" + code);

        }
        catch (Exception ex)
        {
        }
    }
    protected void DataGrid6_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        e.Item.Cells[0].Visible = false;
    }
    protected void DataGrid6_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}