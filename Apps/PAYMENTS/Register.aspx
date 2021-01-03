<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="PAYMENTS_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            /*width: 100%;*/
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style5 {
            margin-left: 0;
        }
        .auto-style6 {
            text-align: center;
            height: 36px;
        }
        .auto-style7 {
            margin-left:96px;
        }
        </style>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />

   
    <link href="../assets/css/bootstrap-grid.css" rel="stylesheet"/>
    <script src="../assets/js/bootstrap.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
</head>
<body>
   
     <form id="form1" runat="server">
     <div class="jumbotron text-center">
         </div> 
       
        
          <div class="box-body">
            <div class="row">
                 <div class="col-md-3">

                     </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">First Name<a id="FirstName" tabindex="0" role="button" data-toggle="popover" data-placement="top" data-trigger="focus" data-html="true" title="Mandatory" data-content="<h6><i class='fa fa-info-circle' aria-hidden='true'></i> This is a mandatory field. First Name cannot be empty.</h6>"><i class="fa fa-info-circle" aria-hidden="true"></i></a><span class="text-danger"><i class="fa fa-angle-double-right" aria-hidden="true"></i></span></label>
                    <asp:TextBox CssClass="form-control input-sm txtFirstName" ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
                </div>
               
                <div class="form-group">
                  <label for="exampleInputEmail1">Last Name</label>
                  <asp:TextBox CssClass="form-control input-sm" ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
                </div>

                <!--Add the ID Field to DB-->
                <div class="form-group">
                  <label for="exampleInputEmail1">Emails address</label>
                  <asp:TextBox CssClass="form-control input-sm" ID="txtId" runat="server" placeholder="Emails address"></asp:TextBox>
                </div>
                <div class="form-group">
                      <label for="exampleInputEmail1">Access Level</label>
                    <asp:DropDownList ID="txtaccesslevel" runat="server"  CssClass="form-control input-sm">
                                                            <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                     <asp:ListItem Value="administrator">administrator</asp:ListItem>
                                                             <asp:ListItem Value="ChangeRequestor">ChangeRequestor</asp:ListItem>
                                                            <asp:ListItem Value="Approver">Approver</asp:ListItem>
                                                             <asp:ListItem Value="IT Officer">IT Officer</asp:ListItem>
                                                            
                                                 </asp:DropDownList>
                </div>
            </div>
            <div class="col-md-3">
                 
                <div class="form-group">
                      <label for="exampleInputEmail1">Product</label>

                     <asp:DropDownList ID="txtproduct" runat="server"  CssClass="form-control input-sm">
                                                 <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                <asp:ListItem Value="Hard ware">Hard ware</asp:ListItem>
                                                <asp:ListItem Value="Network">Network</asp:ListItem>
                                                 <asp:ListItem Value="NWSC Billing System">NWSC Billing System</asp:ListItem>                                                 
                                               <asp:ListItem Value="Billing System Reports">Billing System Reports</asp:ListItem>
                                               <asp:ListItem Value="Billing Interfacer">Billing Interfacer</asp:ListItem>
                                               <asp:ListItem Value="Business Intelligence">Business Intelligence</asp:ListItem>
                                                <asp:ListItem Value="iScala">iScala</asp:ListItem>
                                                <asp:ListItem Value="Citrix">Citrix</asp:ListItem>
                                                <asp:ListItem Value="E- Procurement">E- Procurement</asp:ListItem>
                                                <asp:ListItem Value="E- Inventory">E- Inventory</asp:ListItem>
                                                <asp:ListItem Value="Email - Outlook">Email - Outlook</asp:ListItem>
                                                <asp:ListItem Value="Human Res. Mangt Sys">Human Res. Mangt Sys</asp:ListItem>
                                                <asp:ListItem Value="SMS Service">SMS Service</asp:ListItem>
                                                <asp:ListItem Value="ITSM - Help Desk">ITSM - Help Desk</asp:ListItem>
                                                <asp:ListItem Value="CRM">CRM</asp:ListItem>
                                                <asp:ListItem Value="Corporate Website">Corporate Website</asp:ListItem>
                                                <asp:ListItem Value="SharePoint">SharePoint</asp:ListItem>
                                                <asp:ListItem Value="Water Quality - WaQIMS">Water Quality - WaQIMS</asp:ListItem>
                                               <asp:ListItem Value="E Services">E Services</asp:ListItem>
                                               <asp:ListItem Value="NWSC E- BIDS">NWSC E- BIDS</asp:ListItem>
                                               <asp:ListItem Value="Contracts Mngt System">Contracts Mngt System</asp:ListItem>
                                                <asp:ListItem Value="E- Library">E- Library</asp:ListItem>
                                               <asp:ListItem Value="Desk Phone System">Desk Phone System</asp:ListItem>
                                               <asp:ListItem Value="Phonebook">Phonebook</asp:ListItem>
                                             <asp:ListItem Value="AfWA Presentations">AfWA Presentations</asp:ListItem> 
                                              <asp:ListItem Value="AfWA">AfWA</asp:ListItem>
                                           <asp:ListItem Value="Business Intel Training">Business Intel Training</asp:ListItem>
                                          <asp:ListItem Value="Business Intel Training">Other</asp:ListItem>
                                                        </asp:DropDownList>
                </div>
                <div class="form-group">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Password</label>
                      <asp:TextBox CssClass="form-control input-sm" ID="txtPassword" runat="server" placeholder="password"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                <label><a id="btnAddNewDepartment">confirm Password</a> </label>
                <asp:Textbox ID="txtconfirmPassword" runat="server" CssClass="form-control input-sm" placeholder="password"></asp:Textbox>
                </div>
                
                   
                
                
            </div>
                    
                </div>
              <div class="form-group" align="center">
                     <asp:Button ID="BtnSignup" runat="server" Text="REGISTER" OnClick="BtnSignup_Click" Width="400px" class="btn btn-primary" />
                 
                     <asp:HiddenField ID="HiddenField_Action" runat="server" />
                    <asp:HiddenField ID="HiddenField_id" value = "0" runat="server" />
            </div>
              
            </div>
              
         
       </form>
       
        
</body>
</html>
