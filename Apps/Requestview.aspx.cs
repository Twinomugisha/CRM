using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Requestview : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    DataTable dtGetRequests;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (IsPostBack == false)
            {
                ////////Calendar3.Visible = false;
                ////////Calendar2.Visible = false;
                GetRequests();
               


            }
        }
        catch (Exception ex)
        {


        }

    }
    private void GetRequests()
    {
       
        string Requestor = txtRequestor.Text.Trim();
        string Product = txtProduct.Text.Trim();
        DateTime Datefrom = (txtDatefrom.Text.Trim() == "") ? DateTime.Parse("January 1, 1900") : DateTime.Parse(txtDatefrom.Text);
        DateTime DateTo = (txtDateTo.Text.Trim() == "") ? DateTime.Parse("January 1, 3000") : DateTime.Parse(txtDateTo.Text);
        string user = Session["userID"].ToString();

        dtGetRequests = dac.GetRequests(Requestor, Product, Datefrom, DateTo, user);
        DataGrid1.DataSource = dtGetRequests;
        DataGrid1.DataBind();
    }
    
    protected void Btndownload_Click(object sender, EventArgs e)

    {
        GetRequests();

        
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        //try
        //{
        string code = e.Item.Cells[1].Text;
        //bll.Page_Redirect_LargeWindow("./SYSTEMSETUP__AddSupplier.aspx?transfereid=" + code);
        //}
        //catch (Exception ex)
        //{

        //}
    }
    protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        e.Item.Cells[0].Visible = true;
    }

    protected void txtActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetRequests();
        
    }
    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsOtherMonth)
        {
            e.Day.IsSelectable = false;
        }
    }

    protected void Calendar3_Selectionchanged(object sender, EventArgs e)
    {
        txtDatefrom.Text = Calendar3.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar3.Visible = true;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar3.Visible)
        {
            Calendar3.Visible = false;
        }
        else
        {
            Calendar3.Visible = true;
        }
        Calendar3.Attributes.Add("style", "position:absolute");
    }
    protected void Calendar4_Selectionchanged(object sender, EventArgs e)
    {
        txtDateTo.Text = Calendar4.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar4.Visible = true;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar4.Visible)
        {
            Calendar4.Visible = false;
        }
        else
        {
            Calendar4.Visible = true;
        }
        Calendar4.Attributes.Add("style", "position:absolute");
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsOtherMonth)
        {
            e.Day.IsSelectable = false;
        }
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}