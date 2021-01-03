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
using System.Drawing;

public partial class ApproveResults : System.Web.UI.Page
{
    dataaccess dac = new dataaccess();
    Businesslogic bll = new Businesslogic();
    string Pagename = "SamplesSentLab";
    DataTable dset = new DataTable();
    string constring, CertTime;
    bool ChangeControl = false;
    bool ReloadDatasetFromDB;
    string title;
    string Department;
    string LabDept4Sample;
    string Samplecode;
    string[] wordArray;
    dataaccess2 dac2 = new dataaccess2();
    DataTable DataSamples = new DataTable();
    string s;

    SendEmail mail = new SendEmail();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            MultiView2.ActiveViewIndex = 0;
            constring = dac.ConnectionHandler();
            lblmessage.Visible = false;
            ReloadDatasetFromDB = false;

            if (IsPostBack == false)
            {
                GetAccessCreditials();
            }
        }
        catch (Exception ex)
        {
           // 
            lblmessage.Visible = true;
            lblmessage.Text = ex.Message;
        }
    }

    private void GetAccessCreditials()
    {
       
              GetSamplesSentFromReceiption();
         
    }

  private void GetSamplesSentFromReceiption()
    {
        String accesslevel = Session["Accesslevel"].ToString().Trim();
        String user = Session["StaffCode"].ToString().Trim();
        string type = "0";
        //type 0 picks all pending approvals with filters
        //type 1 picks Central Labs samples pending results approvals with filters
        //type 2 picks all regional samples pending results approvals with filters
        String entry = "1";
        DataTable dt = null;
        String logged = Session["StaffCode"].ToString();


        if (accesslevel.Equals("13"))
        {
            LabDept4Sample = "Chemistry";
            type = "1";
            logged = "0";
        }
        else if (accesslevel.Equals("14"))
        {
            LabDept4Sample = "Biology";
            type = "1";
            logged = "0";
        }
        /*
        else if (accesslevel.Equals("19"))
        {
            LabDept4Sample = "0";
            type = "2";
        }
        */
        else if (
           accesslevel.Equals("18"))
        {
            LabDept4Sample = "0";
            type = "2";
            entry = "2";
        }
        if(accesslevel.Equals("15"))
        {
            LabDept4Sample = "0";
            type = "5";
            entry = "3";
        }
        dt = dac2.WQ_GetJobs4(LabDept4Sample, "0", logged, entry, "3", type).Tables[0];

        // LabDept4Sample = "0";
        //jobs for approving

        GridSamples.DataSource = dt;
        GridSamples.DataBind();
    }

  
 
    private void ClearControls()
    {

    }

   
   
    protected void GridSamples_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int selectedRowIndex = GridSamples.SelectedIndex;
            GridViewRow row = GridSamples.Rows[selectedRowIndex];
            string sampleCode = row.Cells[1].Text.Trim();
            string name = row.Cells[2].Text.Trim(); ;
            string noSamples = row.Cells[3].Text.Trim();
            string datereceived = row.Cells[4].Text.Trim();
            string name1 = name.ToUpper();
            MultiView2.ActiveViewIndex = 1;

            Session["approceCode"] = sampleCode;

            DataTable dtsingle = dac2.GetJobs("0", sampleCode,"0","0").Tables[0];
            String classification = dac2.GetSampleByCode(sampleCode).Tables[0].Rows[0]["SampleClassification"].ToString().Trim();
            

            gvsamplesingle.DataSource = dtsingle;
            gvsamplesingle.DataBind();

            GetParameters(sampleCode);





        }
        catch (Exception ex)
        {
            
            lblmessage.Visible = true;
            lblmessage.Text = ex.Message;
        } 
    }

   
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 0;
    }
    private void GetParameters(String sampleCode)
    {
        String accesslevel = Session["Accesslevel"].ToString().Trim();
        if (accesslevel.Equals("13"))
        {
            LabDept4Sample = "Chemistry";
        }
        else if (accesslevel.Equals("14"))
        {
            LabDept4Sample = "Biology";
        }
        else if (accesslevel.Equals("18")||
            accesslevel.Equals("19")||
            accesslevel.Equals("15")
            )
        {
            LabDept4Sample = "0";
        }
        LabDept4Sample = "0";
        DataTable Data = dac2.GetParameters4Testing(LabDept4Sample, sampleCode).Tables[0];
        DataGrid1.DataSource = Data;
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
      
        e.Item.Cells[0].Visible = false;

   
    }
    private void GetColourStrings()
    {
        DataSamples = dac.GetSampleCodes4SelectedClient(Session["Client4Samples4Testing"].ToString(), Session["Date4Samples4Testing"].ToString());
        int TotalSampleNumber = DataSamples.Rows.Count;

        int i;
        s = "";
        double a, c;
        double b = 2;

        for (i = 0; i < TotalSampleNumber; i++)
        {
            a = (double)(i);
            c = a / b;
            if (bll.IsNumeric(c.ToString()) == true)
            {
                s += DataSamples.Rows[i]["SampleCode"].ToString() + ",";
            }
        }
    }



    protected void btncancel_Click(object sender, EventArgs e)
    {
        //decide whether to undo results or .....
        string approver = Session["StaffCode"].ToString();
        string comment = txtcomment.Text;
        String sample = Session["approceCode"].ToString();
        //set this cancelled
        /*
         dac2.WQ_CancellSample(sample, comment, approver);
         //send a main back to person assigned to handle this

         DataTable dtsample = dac2.GetSampleByCode(sample).Tables[0];
         String labofficer = dtsample.Rows[0]["LabOfficerAssigned"].ToString();
         DataTable dtsupervisor = dac.GetUsers("0", labofficer);

         string notify = dtsupervisor.Rows[0]["Email"].ToString();
         string fullName = dtsupervisor.Rows[0]["fullName"].ToString();
         String msg = "Dear " + fullName + " Sample ("+sample+") Results have been Rejected Reason :("+comment+") Kindly Logon to redo the Tests ";
         mail.sendEmail(notify, "New Sample Test Alert", msg);

         //send to lab
         dac2.WQ_UpdateSampleStatus(sample, "2");
         */
        MultiView2.ActiveViewIndex = 0;

    }

    protected void btnapprove_Click(object sender, EventArgs e)
    {
        String sample = Session["approceCode"].ToString();
        DataTable dtsample = dac2.GetSampleByCode(sample).Tables[0];
        String classification = dtsample.Rows[0]["SampleClassification"].ToString().Trim();
        String EntryType = dtsample.Rows[0]["EntryType"].ToString().Trim();

        String senderemail= dtsample.Rows[0]["Email"].ToString().Trim();
        string sendername=dtsample.Rows[0]["fullName"].ToString().Trim();


        String accesslevel = Session["Accesslevel"].ToString().Trim();
        if (accesslevel.Equals("13"))
        {
            LabDept4Sample = "Chemistry";
        }
        else if (accesslevel.Equals("14"))
        {
            LabDept4Sample = "Biology";
        }
        else
        {
            LabDept4Sample = "0";
        }
          //get opposite lab
        string comment = txtcomment.Text;
        string approver = Session["StaffCode"].ToString();
        //send this manager central lab
        Boolean cannotiymanagercentral = false;

        if (dac2.WQ_Approveresults(LabDept4Sample,sample, comment, approver,"1"))
        {
            if (classification.Equals("2") && !EntryType.Equals("2"))
            {
                String oppositeLab = Businesslogic.OppositeLab(LabDept4Sample);
                //check this lab has carried out its tests
                DataTable istested = dac2.WQ_GetIsRemarked(oppositeLab, sample);
                Boolean hasTested = Businesslogic.IsRecord(istested);


                if (hasTested)
                {
                    cannotiymanagercentral = true;                
                }
                else
                {

                    if (EntryType.Equals("3"))
                    {
                        cannotiymanagercentral = true;
                    }
                    else
                    {
                        cannotiymanagercentral = false;
                    }
                    //
                    if (!EntryType.Equals("3"))
                    {
                        String nextlab = Businesslogic.getNextLabaratory(LabDept4Sample);
                        if (nextlab.Equals(""))
                        {
                            showMessage("Please There is No Active Head at "+ oppositeLab+" Labaratory", true);
                        }
                        else
                        {
                            //notify the next labaratory supervisor
                            DataTable dtsup = dac.GetEmailByUserCode(nextlab);
                            if (dtsup.Rows.Count > 0)
                            {
                                //of the oppos
                                string email = dtsup.Rows[0]["Email"].ToString();
                                string fullname = dtsup.Rows[0]["Email"].ToString();
                                string message = "Sample Number: " + sample + " has been submited for remarking " +
                                    "from  Head of Department of The  " + LabDept4Sample + " Labaratory";
                                //email = "richard.ezama@nwsc.co.ug";
                                string subject = "Sample Pending remarking -WaQIMS";
                                mail.sendEmail(email, subject, message);
                            }
                        }
                    }
                    else
                    {
                        //find the person who captured this sample for audit
                    }

                }
            }
            else
            {
                cannotiymanagercentral = true;
            
            }
            showMessage("Details Successfully Saved", false);


        }
        else
        {
            showMessage("error contact system administration", false);

        }


        if (cannotiymanagercentral)
        {
            string notify = "";
            string fullName = "";
            String msg = "Dear " + fullName + " Sample (" + sample + ") has been sent for Certificate printing approval kindly login to approve it<br/> Comment from Head of Department :" + comment + "";


            DataTable dtsupervisor = dac.GetUsers("15", "0");
            if(accesslevel.Equals("18"))
            {
                dtsupervisor = dac.GetUsers("19", "0");
            }
           
            string state = "4";
            if (dtsupervisor.Rows.Count > 0)
            {
                if (EntryType.Equals("3")
                    ||
                    EntryType.Equals("4")
                    )
                {
                    //finish this to certification
                    fullName = sendername;
                    notify = senderemail;
                    state = "5";
                    msg = "Dear " + fullName + " Sample (" + sample + ") has been Approved by Regional Cordinator login to view the Results :" + comment + "";

                }
                else
                {
                    state = "4";
                }
                
                dac2.WQ_UpdateSampleStatus(sample, state);

                 }
            else
            {
                showMessage("Please add a Supervisor please check", false);

            }
           // notify = "richard.ezama@nwsc.co.ug";
             mail.sendEmail(notify, "Sample Certificate Approval Request - WaQIMS", msg);
            showMessage("Sample Results Successfully Captured", false);


        }
        //notify
        //nect is auditing and tracking
    }
    protected void showMessage(string msg, Boolean color)
    {
        if (color)
        {
            lblmessage.ForeColor = Color.Red;
        }
        else
        {
            lblmessage.ForeColor = Color.Green;
        }
        lblmessage.Visible = true;

        lblmessage.Text = msg;
    }

}
