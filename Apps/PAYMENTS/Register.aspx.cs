using System; 
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
public partial class PAYMENTS_Register : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();//calling a constructor method dataaccess 
    DataTable dtUserDetails;

    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField_Action.Value = "Add";
        if (Request.QueryString["transferid"] != null)
        {
            string requestid = Request.QueryString["transferid"].ToString();
            HiddenField_id.Value = requestid;
            LoadControls(requestid);
            HiddenField_Action.Value = "Edit";
        }
    }
     private void RegUser() //  creating a method registering a user
    {
        if (HiddenField_Action.Value == "Add")
        {
            dac.GetUsers(txtFirstName.Text, txtLastName.Text, txtId.Text, txtaccesslevel.Text, txtPassword.Text, txtproduct.Text);
        }
        else
        {
            dac.updateUsers(HiddenField_id.Value, txtFirstName.Text, txtLastName.Text, txtId.Text, txtaccesslevel.Text, txtproduct.Text);
        }

     }

    private void LoadControls(string requestid)
    {
        DataTable dtUserDetails = dac.GetGridUserdetailsByID(requestid);

        foreach (DataRow dr in dtUserDetails.Rows)
        {
            txtFirstName.Text = dr["FirstName"].ToString();
            txtLastName.Text = dr["LastName"].ToString();
            txtId.Text = dr["EmailAddress"].ToString();
            txtaccesslevel.Text = dr["AccessLevel"].ToString();
            txtPassword.Text = dr["Password"].ToString();
            txtproduct.Text = dr["Product"].ToString(); 
             
        }
        //BtnSignup.Enabled = false;
    }
    protected void BtnSignup_Click(object sender, EventArgs e)


     {
      if ( txtFirstName.Text == "" || txtFirstName.Text == "" || txtId.Text == "" || txtaccesslevel.Text ==""|| txtPassword.Text == "" || txtconfirmPassword.Text== "" )
     {
       Response.Write("Select a missing Field");//validating the fields 
     }
     else if ((txtPassword.Text != txtconfirmPassword.Text) && HiddenField_Action.Value =="Add")
     {
      Response.Write("passwords dont match");//validating passwords should be the same for a user to continue else passwords dont match


     }
    else
     {
     Response.Write("you have successfull registered");
      RegUser();//user registered
     this.ClearControls();// clears all fields after Onclick button
     Response.Write("Login.aspx");


        }


     }
   
     private void ClearControls()// method clears fields
    {
        txtFirstName.Text = "";
        txtFirstName.Text = "";
        txtId.Text = "";
        txtaccesslevel.Text = "";
        txtPassword.Text  = "";

    }

}


