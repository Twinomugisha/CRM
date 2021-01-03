using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{

    dataaccess dac = new dataaccess();    // calling a constructor method and creating an object of dac  


    
    private void CheckUser()
    {
        
        DataTable  dtusers = dac.CheckUser(txtLastName.Text, txtPassword.Text);
        if (dtusers.Rows.Count > 0)
        {
          
            foreach (DataRow dr in dtusers.Rows)
            {
                Session["userID"] = dr["ID"].ToString();
                Session["Name"] = dr["Name"].ToString();
                Session["AccessLevel"] = dr["AccessLevel"].ToString();
                Session["product"] = dr["product"].ToString();
                Session["Email"] = dr["EmailAddress"].ToString();
                
            }
            string AccessLevel = Session["AccessLevel"].ToString();
            if (AccessLevel == "ChangeRequestor")
            {
                Response.Redirect("ChangeRequest.aspx");
            }
            if (AccessLevel == "Approver")
            {
                Response.Redirect("ApprovalView.aspx");
            }
            if (AccessLevel == "IT Officer")
            {
                Response.Redirect("assignview.aspx");
            }
            if (AccessLevel == "administrator")
            {
                Response.Redirect("ViewchangeRequest.aspx");
            }
            else
            {
               
                Response.Redirect("ChangeRequest.aspx");
            }

            //  After logging in successully, if password is correct, and also username is correct, take the user to the Dashboard
        }
       
    }

    
    protected void btn_Click(object sender, EventArgs e)
    {
        if (txtLastName.Text == "" || txtPassword.Text == "")
        {
            Response.Write("please fill the missing field");// if the user misses the  email or password should enter them

        }
        else
        {
            CheckUser(); //checking a user if is in the database
            Response.Write("Please you are invalid user");

        }


    }

    protected void BtnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");//redirect user to Register page

    }

    private void ClearControls()
    {
        txtLastName.Text = "";      // when a user has finished clicking tne Onclick button the text fields should clear
        txtPassword.Text = "";
    }
}   