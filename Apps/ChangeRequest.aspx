<%@ 
    Page Title="" Language="C#" 
    MasterPageFile="~/PAYMENTS/dashboard.master" 
    AutoEventWireup="true" 

    CodeFile="ChangeRequest.aspx.cs" Inherits="ChangeRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
                  <tbody>
                    <tr>
                        <td>
                        
                         <div class="row">
                            <div class="col-sm-6">
                               <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <tbody>
                      <div class="row"> 
                      
                     <%--<tr>
                        <div class="col-sm-6">
                        <td Bold="True" >
                         Requestor Name
                        </td>
                            </div>
                           
                      <div class="col-sm-6">
                       <td class="DataEntryFormTableColumn4">
                                                        <asp:TextBox ID="txtrequestName" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Width="330px" Height="30px" onblur="Change(this, event)" onfocus="Change(this, event)" ></asp:TextBox>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                          </td>
                            </div>
                         </tr>
                      --%>
                        <%--<tr Visible="false">
                        <div class="col-sm-6">
                        <td Bold="True">
                         Phone Number
                        </td>
                            </div>
                           
                      <div class="col-sm-6">
                       <td class="DataEntryFormTableColumn4">
                                                        <asp:TextBox ID="txtphoneNumber" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Width="330px" Height="30px" ></asp:TextBox>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                          </td>
                            </div>
                        </tr>--%>
                          <%--<tr visible="false">
                        <div class="col-sm-6">
                        <td>
                         Email
                        </td>
                            </div>
                           
                      <div class="col-sm-6">
                       <td class="DataEntryFormTableColumn4">
                                                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Width="330px" Height="30px"></asp:TextBox>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                          </td>
                            </div>
                        </tr>--%>
                          <tr Visible="false">
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" bold="True" visible="false">Date Submitted</td>
                            </div>
                      <div class="col-sm-6">
                        <td>
                         <asp:TextBox ID="txtDate" runat="server" AutoCompleteType="Disabled" CssClass="DataEntryFormTableTextbox DataEntryFormTableTextboxWidth"  Font-Size="11pt" Font-Strikeout="False" Height="30px" width= "300px" ></asp:TextBox>
                             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="assets/img/Calendar.jpg" Height="30" Width="30" ImageAlign="AbsBottom" OnClick="ImageButton1_Click" />

                              <asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_Selectionchanged" Visible="false"></asp:Calendar>
                            <asp:CompareValidator ID="CompareValidator1" ValidationGroup="Date" ForeColor="Red" runat="server" ControlToValidate="txtDate" ControlToCompare="txtcalender"
        Operator="LessThan" Type="Date" ErrorMessage="Start date must be less than End date."></asp:CompareValidator>
                            </td>
                        
                            <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text="*"  ></asp:Label>
                                 </td>
                        </td>
                            </div>
                        </tr>
                     
                      
                          <tr >
                        <div class="col-sm-6">
                       
                      <td class="DataEntryFormTableColumn2" Bold="True">System/Product<br />/ServiceName:</td>
                      
                            </div>
                      <div class="col-sm-6">
                        <td>
                    <asp:DropDownList ID="txtSystemName" runat="server"  CssClass="form-control input-sm" Font-Bold="True" Font-Size="10pt" Height="30px" Width="90%">
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
                        </td>
                                </div>
                                                    <td class="DataEntryFormTableColumn5">
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                                    </td>
                            </div>
                        </tr>
                       <tr Visible="false">
                        <div class="col-sm-6">
                        <td class="DataEntryFormTableColumn2" Bold="True">What needs <br/> to change</td>
                            </div>
                           
                      <div class="col-sm-6">
                         <td class="DataEntryFormTableColumn4">
                                                    <asp:DropDownList ID="txtchangeneeded" runat="server"  CssClass="form-control input-sm"  Font-Size="10pt" Height="30px" Width="90%" >
                                                            <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                           <asp:ListItem Value="Data">Hard Ware</asp:ListItem>
                                                             <asp:ListItem Value="Documentation">Networks</asp:ListItem>
                                                            <asp:ListItem Value="Interface">Interface</asp:ListItem>
                                                            <asp:ListItem Value="Data">Data</asp:ListItem>
                                                             <asp:ListItem Value="Documentation">Documentation</asp:ListItem>
                                                            <asp:ListItem Value="others">others</asp:ListItem>
                                                             
                                                        </asp:DropDownList>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                                          </td>
                            </div>
                        </tr>
                      <tr>
                           <div class="col-sm-6">
                      <td class="DataEntryFormTableColumn2" Bold="True">Items to be changed </td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtbussinessstatus" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="110px"  Width="300px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine"  ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                      <tr>
                        <div class="col-sm-6">
                      <td class="DataEntryFormTableColumn2" Bold="True">Work Required</td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtaffectbussiness" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="110px"  Width="300px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine" ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                         <tr>
                        <div class="col-sm-6">
                        <td class="DataEntryFormTableColumn2" Bold="True">Change Type</td>
                            </div>
                           
                      <div class="col-sm-6">
                         <td class="DataEntryFormTableColumn4">
                                                    <asp:DropDownList ID="txtchangetype" runat="server" CssClass="form-control input-sm" Font-Bold="True" Font-Size="10pt" Height="30px" Width="90%">
                                                     <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                     <asp:ListItem Value="Data"> New Hard Ware componet </asp:ListItem>
                                                     <asp:ListItem Value="Documentation"> New Network componet</asp:ListItem>
                                                     <asp:ListItem Value="New Requirement">New Requirement</asp:ListItem>
                                                     <asp:ListItem Value="Requirement Change">Requirement Change</asp:ListItem>
                                                     <asp:ListItem Value="design Change">design Change</asp:ListItem>
                                                     <asp:ListItem Value="others">others</asp:ListItem>
                                                             
                                                        </asp:DropDownList>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                                          </td>
                            </div>
                        </tr>
                         <tr>
                        <div class="col-sm-6">
                        <td class="DataEntryFormTableColumn2" Bold="True" ">Reason</td>
                            </div>
                           
                      <div class="col-sm-6">
                         <td class="DataEntryFormTableColumn4">
                                                    <asp:DropDownList ID="txtreason" runat="server"  CssClass="form-control input-sm" Font-Bold="True" Font-Size="10pt" Height="30px" Width="90%">
                                                            <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                            <asp:ListItem Value="Legal">legal</asp:ListItem>
                                                            <asp:ListItem Value="Markert">Market</asp:ListItem>
                                                             <asp:ListItem Value="Performance">performance</asp:ListItem>
                                                            <asp:ListItem Value="CustomerRequest">CustomerRequest</asp:ListItem>
                                                            <asp:ListItem Value="Defect">Defect</asp:ListItem>
                                                             <asp:ListItem Value="policy">Policy</asp:ListItem>
                                                             
                                                        </asp:DropDownList>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                          </td>
                            </div>
                        
                       </div>
             </tbody>
              </table>
             </div>
           </div>
                                <div class="col-sm-6">
                                    <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" visible="false">
                     <tbody>
                    <div class="row"> 
                      
                   
                      </tr>
                       
                            <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True" >Priority   </td>
                            </div>
                           
                      <div class="col-sm-6">
                         <td class="DataEntryFormTableColumn4">
                                                    <asp:DropDownList ID="txtpriority" runat="server"  CssClass="form-control input-sm" Font-Bold="True" Font-Size="10pt" Height="30px" Width="90%">
                                                            <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                            <asp:ListItem Value="Emergency">Emergency</asp:ListItem>
                                                            <asp:ListItem Value="urgent">urgent</asp:ListItem>
                                                             <asp:ListItem Value="Routine">Routine</asp:ListItem>
                                                             
                                                        </asp:DropDownList>
                                                    </td>
                          <td class="DataEntryFormTableColumn5">
                                         <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                          </td>
                            </div>
                        </tr>
                        <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True" >Date Required   </td>
                            </div>
                           
                      <div class="col-sm-6">
                        <td>
                         <asp:TextBox ID="txtcalender" runat="server" AutoCompleteType="Disabled" CssClass="DataEntryFormTableTextbox DataEntryFormTableTextboxWidth"  Font-Size="11pt" Font-Strikeout="False" Height="30px" width= "300px" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                             <asp:ImageButton ID="Calender2" runat="server" ImageUrl="assets/img/Calendar.jpg" Height="30" Width="30" ImageAlign="AbsBottom" OnClick="Calender2_Click" />

                              <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_Selectionchanged"></asp:Calendar>

                            <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                        </td>
                            </div>

                        </tr>
                        <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True" Visible="false">Change Description </td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtchangedescription" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="100px"  Width="330px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine" ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                         <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True">Expected outCome </td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtvalueoutcome" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="100px"  Width="330px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine" ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                         <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True">Estimated Costs </td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtcostimplication" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="100px"  Width="330px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine" ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                        <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True">Approver Name</td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:DropDownList ID="txtuser" runat="server"  CssClass="form-control input-sm">
                                                            <asp:ListItem Value="0">--- SELECT --</asp:ListItem>
                                                     <asp:ListItem Value=" manager Administrator"> Manager  system Administrator</asp:ListItem>
                                                             <asp:ListItem Value=" BPA NWSC Billing System"> BPA NWSC Billing System</asp:ListItem>
                                                            <asp:ListItem Value=" BPA Billing System Reports">BPA Billing System Reports</asp:ListItem>
                                                             <asp:ListItem Value="BPA Billing Interfacer">BPA Billing Interfacer</asp:ListItem>
                                                            <asp:ListItem Value="BPA Business Intelligence">BPA Business Intelligence</asp:ListItem>
                                                             <asp:ListItem Value="BPA iScala">BPA iScala</asp:ListItem>
                                                             <asp:ListItem Value="BPA Citrix">BPA Citrix</asp:ListItem>
                                                           <asp:ListItem Value="BPA E- Procurement">BPA E- Procurement</asp:ListItem>
                                                            <asp:ListItem Value="BPA E- Inventory">BPA E- Inventory</asp:ListItem>
                                                             <asp:ListItem Value="BPA Email - Outlook">BPA Email - Outlook</asp:ListItem>
                                                            <asp:ListItem Value="BPA Human Res. Mangt Sys">BPA Human Res. Mangt Sys</asp:ListItem>
                                                             <asp:ListItem Value="BPA SMS Service">BPA SMS Service</asp:ListItem>
                                                             <asp:ListItem Value="BPA ITSM - Help Desk">BPA ITSM - Help Desk</asp:ListItem>
                                                             <asp:ListItem Value="BPA CRM">BPA CRM</asp:ListItem>
                                                            <asp:ListItem Value="BPA Corporate Website">BPA Corporate Website</asp:ListItem>
                                                             <asp:ListItem Value="BPA SharePoint">BPA SharePoint</asp:ListItem>
                                                            <asp:ListItem Value=" BPA Water Quality - WaQIMS">BPA Water Quality - WaQIMS</asp:ListItem>
                                                             <asp:ListItem Value="BPA E Services">BPA E Services</asp:ListItem>
                                                             <asp:ListItem Value="BPA NWSC E- BIDS">BPA NWSC E- BIDS</asp:ListItem>
                                                            <asp:ListItem Value="BPA Contracts Mngt System">BPA Contracts Mngt System</asp:ListItem>
                                                            <asp:ListItem Value="BPA E- Library">BPA E- Library</asp:ListItem>
                                                             <asp:ListItem Value="BPA Desk Phone System">BPA Desk Phone System</asp:ListItem>
                                                            <asp:ListItem Value="BPA Phonebook">BPA Phonebook</asp:ListItem>
                                                             <asp:ListItem Value="BPA AfWA Presentations">BPA AfWA Presentations</asp:ListItem> 
                                                             <asp:ListItem Value="BPA AfWA">BPA AfWA</asp:ListItem>
                                                             <asp:ListItem Value="BPA Business Intel Training">BPA Business Intel Training</asp:ListItem>
          <asp:ListItem Value="others">0thers</asp:ListItem>
                                                        </asp:DropDownList>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
                 
                        </tr>
                          </div> 

                  </tbody>
                </table>
              </div>
                    <tr>
      <td colspan="2" style="padding-right: 4px; padding-left: 1px; vertical-align: top; text-align: center; padding-top: 40px;">
    <asp:Button ID="btnSave" runat="server" CssClass="DataEntryFormTableButtons" Font-Bold="True" OnClick="btnSave_Click" onclientclick="return confirm('Are you sure you want to post this request?');" Text="SUBMIT REQUEST" Width="150px" />
          </td>
    </tr>               
   </div>
  </div>
    </td>
    </tr>
    </tbody>
     </table>
     
</asp:Content>

