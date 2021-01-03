using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class capturereqestail_details : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (IsPostBack == false)
            {
               
            }
        }
        catch (Exception ex)
        {


        }

    }
    private void GetChangeRequest() //  a method for creating an invoice
    {
        DateTime DateRequired = (txtcalender.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtcalender.Text);
        //DateTime SubmittedDate = (txtDate.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtDate.Text);
        DateTime SubmittedDate = (txtDate.Text.Trim() == "") ? DateTime.Now : DateTime.Parse(txtcalender.Text);
        string user = Session["userID"].ToString();

        dac.GetChangeRequest( SubmittedDate, txtSystemName.SelectedValue, txtchangeneeded.SelectedValue, txtchangetype.SelectedValue, txtreason.SelectedValue, txtpriority.SelectedValue, DateRequired, txtchangedescription.Text, txtbussinessstatus.Text, txtaffectbussiness.Text, txtvalueoutcome.Text, txtcostimplication.Text, txtuser.Text, user);

    }
    protected void btnSave_Click(object sender, EventArgs e)

    {
        if (txtDate.Text == "" || txtSystemName.SelectedValue == "" || txtchangeneeded.SelectedValue == "" || txtchangetype.SelectedValue == "" || txtreason.SelectedValue == "" || txtpriority.SelectedValue == "" || txtcalender.Text == "" || txtchangedescription.Text == "" || txtbussinessstatus.Text == "" || txtaffectbussiness.Text == "" || txtvalueoutcome.Text == "" || txtcostimplication.Text == "")
        {
            Response.Write("All  Field are required");//checking if all fields have been entered
        }

        else
        {

            GetChangeRequest();// invoice created
            this.ClearControls();// clears fields after onclick button
            Response.Write("You have successfully submitted your request ");

        }





    }

    private void ClearControls()
    {

        //txtrequestName.Text = "";
        //txtphoneNumber.Text = "";
        //txtemail.Text = "";
        //txtDate.Text = "";
        txtSystemName.SelectedValue = "";
        txtchangeneeded.SelectedValue = "";
        txtchangetype.SelectedValue = "";
        txtreason.SelectedValue = "";
        txtpriority.SelectedValue = "";
        txtcalender.Text = "";
        txtchangedescription.Text = "";
    }


    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsOtherMonth)
        {
            e.Day.IsSelectable = false;
        }
    }

   
   
    
}