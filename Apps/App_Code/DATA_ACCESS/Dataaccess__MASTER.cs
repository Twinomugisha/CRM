using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common; 
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;


public class dataaccess
{
    public Database SYSTEM_DB;
    public DbCommand mycommand;
    private DataTable returndetailsDataTable;
    private DataSet returndetailsDataSet;
    //Businesslogic bll = new Businesslogic();

    public dataaccess()
    {
        try
        {
            SYSTEM_DB = DatabaseFactory.CreateDatabase("LOCALMACHINE"); // making a connection string
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }




    public DataTable GetReportFactoryDamage(string ProductionBakery, DateTime FromDate, DateTime ToDate)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetReportFactoryDamage__MDN101", ProductionBakery, FromDate, ToDate);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }




    public void SaveReconciliationQuantityItems(string ID, string Bucket, string Item, decimal Quantity, string Desc1, string Desc2, string Desc3, string
                                           Desc4, string Desc5, string Desc6, string Desc7, string Desc8, string Desc9, string Desc10,
                                           DateTime TransactionDate, bool Deleted, string RecordedBy, DateTime RecordDate)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("SaveReconciliationQuantityItems", ID, Bucket, Item, Quantity, Desc1, Desc2, Desc3, Desc4, Desc5,
                                                   Desc6, Desc7, Desc8, Desc9, Desc10, TransactionDate, Deleted, RecordedBy, RecordDate);
            SYSTEM_DB.ExecuteNonQuery(mycommand);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public DataTable CheckUser(string LastName, string Password)// creating a method CheckerUser which takes in parameters String Email and String Password
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("captureusers", LastName, Password);// calling Mycommand which takes in a stored procedure SaveUser withs its parameters
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];//Executing a dataSet using mymmand in the table
            return returndetailsDataTable;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetUsers(string FirstName, string LastName, string Emailaddress, string Access_Level , string Password, string Product)//stored procedure taking its parameters
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetUsers", FirstName, LastName, Emailaddress, Access_Level, Password, Product);//executing mycommand (ExecuteNonQuery for inserting parameters in the database)
            SYSTEM_DB.ExecuteNonQuery(mycommand);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetChangeRequest(DateTime Date_Submitted, string System, string What_needs_to_change, string Change_Type, string Reason, string Priority, DateTime Date_Required, string Change_Description, string current_business_status, string How_will_the_change_affect_other_related_business, string Change_expected_Value_out_come, string Change_cost_implication ,string Approval_Name, string user)//stored procedure taking its parameters
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetChangeRequest",Date_Submitted, System, What_needs_to_change, Change_Type, Reason, Priority, Date_Required, Change_Description, current_business_status, How_will_the_change_affect_other_related_business, Change_expected_Value_out_come, Change_cost_implication, Approval_Name, user);//executing mycommand (ExecuteNonQuery for inserting parameters in the database)
            SYSTEM_DB.ExecuteNonQuery(mycommand);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void StoreMoney(string CustName, string Area, string PaymentDate, decimal TransactionAmount, string TransactionType, string Action) //stored procedure taking its parameters
    {
        try
        {

            mycommand = SYSTEM_DB.GetStoredProcCommand("StoreMoney", CustName, Area, PaymentDate, TransactionAmount, TransactionType, Action);
            SYSTEM_DB.ExecuteNonQuery(mycommand);//executing mycommand (ExecuteNonQuery for inserting parameters in the database

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void save_invoice(string CustomerEmail, string Description, string Amount) //stored procedure taking its parameters
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("save_invoice", CustomerEmail, Description, Amount);
            SYSTEM_DB.ExecuteNonQuery(mycommand);//executing mycommand (ExecuteNonQuery for inserting parameters in the database

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public DataTable GetTransactions(string Customer, string Active, string Transactions, string currency, string days)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetTransactions", Customer, Active,  Transactions,  currency,  days);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GetRequests(string Requestor, string Product, DateTime Datefrom, DateTime DateTo)// stored procedure that stores paramters for get request
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetRequests", Requestor, Product, Datefrom, DateTo);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable GetRequests_Approval(string Requestor, string Product, DateTime Datefrom, DateTime DateTo, string product_name)  //stopred procedure that stores details of approvals 
    {
        try
       {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridRequest_approval", Requestor, Product, Datefrom, DateTo, product_name);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GetAssignRequest_approval(string Requestor, string Product, DateTime Datefrom, DateTime DateTo, string product_name)  //stopred procedure that stores details of approvals 
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridAssignRequest_approval", Requestor, Product, Datefrom, DateTo, product_name);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GetGridUser()
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridUser");
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GetGridUserdetailsByID(string requestid)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridUserdetailsByID", requestid);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable GetRequests(string Requestor, string Product, DateTime Datefrom, DateTime DateTo, string user)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetRequests", Requestor, Product, Datefrom, DateTo, user);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable GetReportTransactions(string Customer, string currency)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetReportTransactions", Customer, currency);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void SaveCredit_card(string CreditCard_Number, string Expire_END, string Security_Code)//stored procedure taking its parameters
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("SaveCredit_card", CreditCard_Number, Expire_END, Security_Code);//executing mycommand (ExecuteNonQuery for inserting parameters in the database)
            SYSTEM_DB.ExecuteNonQuery(mycommand);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable CheckCard_details(string CreditCard_Number, string Expire_END, string Security_Code)// creating a method CheckerUser which takes in parameters String Email and String Password
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("CheckCard_details", CreditCard_Number, Expire_END, Security_Code);// calling Mycommand which takes in a stored procedure SaveUser withs its parameters
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];//Executing a dataSet using mymmand in the table
            return returndetailsDataTable;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
public void StorereqMoney(string Name,string Email,string Amount) //stored procedure taking its parameters
    {
        try
        {

            mycommand = SYSTEM_DB.GetStoredProcCommand("StorereqMoney", Name, Email, Amount);
           SYSTEM_DB.ExecuteNonQuery(mycommand);//executing mycommand (ExecuteNonQuery for inserting parameters in the database

        }
        catch (Exception ex)
        {
           throw ex;
        }
     }

    public DataTable GetRequestDetailsByID(string ID)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetRequestDetailsByID", ID);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable UpdateApproval(string ID)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("UpdateApproval", ID);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void updateUsers( string id ,string FirstName, string LastName, string Emailaddress, string Access_Level, string Product)//stored procedure taking its parameters
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("updateUsers", id, FirstName, LastName, Emailaddress, Access_Level, Product);//executing mycommand (ExecuteNonQuery for inserting parameters in the database)
            SYSTEM_DB.ExecuteNonQuery(mycommand);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable GetGridAssignRequest_approval(string Requestor, string Product, DateTime Datefrom, DateTime DateTo, string user)  //stopred procedure that stores details of approvals 
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridAssignRequest_approval", Requestor, Product, Datefrom, DateTo, user);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GetReportRequests(string Requestor, string Product, DateTime Datefrom, DateTime DateTo)
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetReportRequests", Requestor, Product, Datefrom, DateTo);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
         public DataTable GetGridRequest_AllviewRequest(string Requestor, string Product, DateTime Datefrom, DateTime DateTo)  //stopred procedure that stores details of approvals 
    {
        try
        {
            mycommand = SYSTEM_DB.GetStoredProcCommand("GetGridRequest_AllviewRequest", Requestor, Product, Datefrom, DateTo);
            returndetailsDataTable = SYSTEM_DB.ExecuteDataSet(mycommand).Tables[0];
            return returndetailsDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}
