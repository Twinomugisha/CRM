using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class ViewchangeRequest : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    DataTable dtGetRequests;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (IsPostBack == false)
            {

                GetGridRequest_AllviewRequest();
            }
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }
    private void GetGridRequest_AllviewRequest()
    {

        string Requestor = txtRequestor.Text.Trim();
        string Product = txtProduct.Text.Trim();
        DateTime Datefrom = (txtDatefrom.Text.Trim() == "") ? DateTime.Parse("January 1, 1900") : DateTime.Parse(txtDatefrom.Text);
        DateTime DateTo = (txtDateTo.Text.Trim() == "") ? DateTime.Parse("January 1, 3000") : DateTime.Parse(txtDateTo.Text);
        //string user = Session["userID"].ToString();

        dtGetRequests = dac.GetGridRequest_AllviewRequest(Requestor, Product, Datefrom, DateTo);
        DataGrid2.DataSource = dtGetRequests;
        DataGrid2.DataBind();
    }
    protected void Btndownload_Click(object sender, EventArgs e)

    {
        GetGridRequest_AllviewRequest();

            //////txtrequestName.Text, txtphoneNumber.Text ,txtemail.Text, txtDate.Text, txtSystemName.SelectedValue, txtchangeneeded.SelectedValue, txtchangetype.SelectedValue, txtreason.SelectedValue, txtpriority.SelectedValue, txtcalender.Text, txtchangedescription.Text, txtbussinessstatus.Text, txtaffectbussiness.Text, txtvalueoutcome.Text, txtcostimplication.Text, txtuser.Text);
    }

    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        try
        {
            string code = e.Item.Cells[0].Text;
            Response.Redirect("./ChangeRequest.aspx?transferid=" + code);

        }
        catch (Exception ex)
        {
        }
    }
    protected void DataGrid2_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        e.Item.Cells[0].Visible = false;
    }
    protected void txtActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetGridRequest_AllviewRequest();
        //////////txtrequestName.Text, txtphoneNumber.Text, txtemail.Text, txtDate.Text, txtSystemName.SelectedValue, txtchangeneeded.SelectedValue, txtchangetype.SelectedValue, txtreason.SelectedValue, txtpriority.SelectedValue, txtcalender.Text, txtchangedescription.Text, txtbussinessstatus.Text, txtaffectbussiness.Text, txtvalueoutcome.Text, txtcostimplication.Text, txtuser.Text);
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
        txtDatefrom.Text = Calendar3.SelectedDate.ToString("dd/MM/yyyy");
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
        txtDateTo.Text = Calendar4.SelectedDate.ToString("dd/MM/yyyy");
        Calendar3.Visible = true;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar4.Visible)
        {
            Calendar4.Visible = false;
        }
        else
        {
            Calendar3.Visible = true;
        }
        Calendar3.Attributes.Add("style", "position:absolute");
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