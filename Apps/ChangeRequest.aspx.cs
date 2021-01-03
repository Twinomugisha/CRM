using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ChangeRequest : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (IsPostBack == false)
            {
                Calendar3.Visible = false;
                Calendar2.Visible = false;
                // autoPopulateSomeFields();
                if (Request.QueryString["transferid"] != null)
                {
                    string requestid = Request.QueryString["transferid"].ToString();
                    LoadControls(requestid);
                } else
                {
                    //txtrequestName.Text = Session["Name"].ToString();
                    //txtemail.Text = Session["Email"].ToString();
                    //txtrequestName.ReadOnly = true;
                    //txtemail.ReadOnly = true;
                }
                
            }
        }
        catch (Exception ex)
        {


        }

    }

    // private void autoPopulateSomeFields()
    //{
    //    DataTable bbbb = dac.SomeMethod(...);
    //    txtrequestName.Text = ];// bbbb.Rows[0]["name"];
    //    txtSystemName.SelectedValue = Session[];
    //}
    private void GetChangeRequest() //  a method for creating an invoice
    {
        DateTime DateRequired = (txtcalender.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtcalender.Text);
        //DateTime SubmittedDate = (txtDate.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtDate.Text);
        DateTime SubmittedDate = (txtDate.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtDate.Text);
        string user =  Session["userID"].ToString();

        dac.GetChangeRequest(SubmittedDate, txtSystemName.SelectedValue, txtchangeneeded.SelectedValue, txtchangetype.SelectedValue, txtreason.SelectedValue, txtpriority.SelectedValue, DateRequired, txtchangedescription.Text, txtbussinessstatus.Text, txtaffectbussiness.Text, txtvalueoutcome.Text, txtcostimplication.Text, txtuser.Text, user);

    }


    private void LoadControls(string requestid)
    {
        DataTable dtRequestDetails = dac.GetRequestDetailsByID(requestid);

        foreach(DataRow dr in dtRequestDetails.Rows)
        {
            //txtrequestName.Text = dr["RequestorName"].ToString();
            //txtphoneNumber.Text = dr["PhoneNumber"].ToString();
            //txtemail.Text = dr["Email"].ToString();
            txtDate.Text = dr["DateSubmitted"].ToString();
            txtSystemName.Text = dr["product"].ToString();
            txtchangeneeded.Text = dr["change"].ToString();
            txtbussinessstatus.Text = dr["Bussinesstutus"].ToString();
            txtreason.Text = dr["Reason"].ToString();
            txtaffectbussiness.Text = dr["RelatedBusiness"].ToString();
            txtchangetype.Text = dr["Change_type"].ToString();
            txtpriority.Text = dr["Priority"].ToString();
            txtcalender.Text = dr["DateRequired"].ToString();
            txtchangedescription.Text = dr["ChangeDescription"].ToString();
            txtvalueoutcome.Text = dr["Change_Expected"].ToString();
            txtcostimplication.Text = dr["cost_Implication"].ToString();
            txtuser.Text = dr["Approval_Name"].ToString();
        }
        btnSave.Enabled = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)

    {
        if(txtDate.Text == "" || txtSystemName.SelectedValue == "" || txtchangeneeded.SelectedValue == "" || txtchangetype.SelectedValue == "" || txtreason.SelectedValue == "" || txtpriority.SelectedValue == "" || txtcalender.Text == "" || txtchangedescription.Text == "" || txtbussinessstatus.Text == "" || txtaffectbussiness.Text == "" || txtvalueoutcome.Text == "" || txtcostimplication.Text == "")
        {
            Response.Write("All  Field are required");//checking if all fields have been entered
        }

        else 
        {

            GetChangeRequest();// invoice created
            this.ClearControls();// clears fields after onclick button
            Response.Write("you have successfull submitted your Request");

        }
       

    }

    private void ClearControls()
    {

        //txtrequestName.Text = "";
        //txtphoneNumber.Text = "";
        //txtemail.Text = "";
        txtDate.Text = "";
        txtSystemName.SelectedValue = "";
        txtchangeneeded.SelectedValue = "";
        txtchangetype.SelectedValue = "";
        txtreason.SelectedValue = "";
        txtpriority.SelectedValue = "";
        txtcalender.Text = "";
        txtchangedescription.Text = "";
        txtvalueoutcome.Text = "";
        txtcostimplication.Text = "";
        txtuser.Text = "";
        txtbussinessstatus.Text = "";
        txtaffectbussiness.Text ="";
    }


    //protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    //{
    //    if (e.Day.IsOtherMonth)
    //    {
    //        e.Day.IsSelectable = false;
    //    }
    //}

    protected void Calendar2_Selectionchanged(object sender, EventArgs e)
    {
        txtcalender.Text = Calendar2.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar2.Visible = true;
    }
    protected void Calender2_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar2.Visible)
        {
            Calendar2.Visible = false;
        }
        else
        {
            Calendar2.Visible = true;
        }
        Calendar2.Attributes.Add("style", "position:absolute");
    }
    protected void Calendar3_Selectionchanged(object sender, EventArgs e)
    {
        txtDate.Text = Calendar3.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar3.Visible = true;
        CompareValidator1.ValueToCompare = DateTime.Now.ToString("MMMM dd, yyyy");
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

    //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    //{
    //    if (e.Day.IsOtherMonth)
    //    {
    //        e.Day.IsSelectable = false;
    //    }
    //}
}
