using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class assignview : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    DataTable dtGetRequests;

    DataTable dt, dtUpdate;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (IsPostBack == false)
            {

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


        dtGetRequests = dac.GetGridAssignRequest_approval(Requestor, Product, Datefrom, DateTo, user);

        Session["dt"] = dtGetRequests;
        DataGrid1.DataSource = dtGetRequests;
        DataGrid1.DataBind();
    }

    private void SaveData()
    {
        UpdateDatasetFromGrid();
        dtUpdate = (DataTable)Session["dt"];
        foreach (DataRow dr in dtUpdate.Rows)
        {
            if (dr["Action"].ToString() == "1" )
            {
                dac.mycommand = dac.SYSTEM_DB.GetStoredProcCommand("UpdateImplement", dr["ID"].ToString(), dr["Action"].ToString());
                dac.SYSTEM_DB.ExecuteNonQuery(dac.mycommand);
            }
        }

        ////////////////Message("DATA SAVED SUCCESSFULLY", false);
        GetRequests();
    }

    protected void Btndownload_Click(object sender, EventArgs e)

    {
        GetRequests();


    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
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
    protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        e.Item.Cells[0].Visible = false;
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
    protected void btnSaver_Click(object sender, EventArgs e)
    {
        try
        {
            SaveData();
        }
        catch (Exception ex)
        {

        }
    }

    #region ATLAS GRID EVENTS & METHODS

    // Atlas Grid Methods

    private enum DatasetColumnNameToGridColumnIndex : int
    {
        Action = 8
    }

    private void UpdateDatasetFromGrid()
    {
        foreach (DataGridItem itm in DataGrid1.Items)
        {
            foreach (DatasetColumnNameToGridColumnIndex ColName in System.Enum.GetValues(typeof(DatasetColumnNameToGridColumnIndex)))
            {
                UpdateDataTableFromGrid(dt, ColName.ToString(), itm, (int)ColName);
            }
        }

        DataGrid1.DataSource = dt;
        Session["dt"] = dt;
        DataGrid1.DataBind();
    }

    private void UpdateDataTableFromGrid(DataTable DataTable, string DataTableColumnName, DataGridItem DataGridItem, int DataGridCellIndex)
    {
        if (dt == null) dt = (DataTable)Session["dt"];

        foreach (Control control in DataGridItem.Cells[DataGridCellIndex].Controls)
        {
            if (control is CheckBox)
            {
                this.dt.Rows[DataGridItem.DataSetIndex][DataTableColumnName] = ((CheckBox)control).Checked;
                System.Diagnostics.Debug.WriteLine("SET " + control.ID + " TO: " + ((CheckBox)control).Checked.ToString());
                break;
            }
            else if (control is TextBox)
            {
                this.dt.Rows[DataGridItem.DataSetIndex][DataTableColumnName] = ((TextBox)control).Text;
                System.Diagnostics.Debug.WriteLine("SET " + control.ID + " TO: " + ((TextBox)control).Text);
                break;
            }
            else if (control is DropDownList)
            {
                this.dt.Rows[DataGridItem.DataSetIndex][DataTableColumnName] = ((DropDownList)control).SelectedValue;
                System.Diagnostics.Debug.WriteLine("SET " + control.ID + " TO: " + ((DropDownList)control).SelectedValue);
                break;
            }
        }
    }


    #endregion


}