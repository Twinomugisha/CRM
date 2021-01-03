using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using System.Net.Mail;
using System.IO;

public partial class Reports : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();

    DataTable dtData = new DataTable();
    public ReportDocument doc = new ReportDocument();

    DataTable dtRequests;
    protected void Page_Load(object sender, EventArgs e)
    {
        loadreport();
    }
    public void loadreport()

    {

        string Requestor = txtRequestor.Text.Trim();
        string Product = txtProduct.Text.Trim();
        DateTime Datefrom = (txtDatefrom.Text.Trim() == "") ? DateTime.Parse("January 1, 1900") : DateTime.Parse(txtDatefrom.Text);
        DateTime DateTo = (txtDateTo.Text.Trim() == "") ? DateTime.Parse("January 1, 3000") : DateTime.Parse(txtDateTo.Text);
        //string user = Session["userID"].ToString();
        dtData = dac.GetReportRequests(Requestor, Product, Datefrom, DateTo);



        string appPath, physicalPath, rptName;
        appPath = HttpContext.Current.Request.ApplicationPath;
        physicalPath = HttpContext.Current.Request.MapPath(appPath);

        rptName = physicalPath + "\\PAYMENTS\\REPORT_FILES\\" + "Request.rpt";


        doc.Load(rptName);
        doc.SetDataSource(dtData);
        CrystalReportViewer.ReportSource = doc;
    }

    protected void Btndownload_Click(object sender, EventArgs e)
    {
        loadreport();
    }
    private void PrintTheReport()
    {
        this.loadreport();
        Response.Buffer = false;
        Response.ClearContent();
        Response.ClearHeaders();

        if (rbnExportType.SelectedValue == "PDF")
        {
            doc.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "REPORT");
        }
        else if (rbnExportType.SelectedValue == "EXCEL 1")
        {
            doc.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "REPORT");
        }
        else if (rbnExportType.SelectedValue == "EXCEL 2")
        {
            doc.ExportToHttpResponse(ExportFormatType.ExcelRecord, Response, true, "REPORT");
        }
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
   
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        try
        {
            PrintTheReport();
        }
        catch (Exception ex)
        {

        }
    }


}