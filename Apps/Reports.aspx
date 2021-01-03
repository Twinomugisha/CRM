<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="padding-bottom:30px; width:100%;">
        <tr><td>
  <asp:TextBox ID="txtRequestor" runat="server" claoss="form-cntrol" type="text" placeholder="Search for requests" aria-label="Search"/>
       </td>
            <td>
  <asp:TextBox ID="txtProduct" runat="server" claoss="form-cntrol" type="text" placeholder="Search for Products" aria-label="Search"/>
       </td>
            <td>
  <asp:TextBox ID="txtDatefrom" runat="server" claoss="form-cntrol" type="text" placeholder="Search for Datefrom" aria-label="Search"/>
       </td>
            <td>
             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="assets/img/Calendar.jpg" Height="30" Width="30" ImageAlign="AbsBottom" OnClick="ImageButton1_Click" />

                              <asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_Selectionchanged" OnDayRender="Calendar2_DayRender" Visible="false"></asp:Calendar>
                </td>

            <td>
  <asp:TextBox ID="txtDateTo" runat="server" claoss="form-cntrol" type="text" placeholder="Search for DateTo" aria-label="Search"/>
       </td>
             <td><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="assets/img/Calendar.jpg" Height="30" Width="30" ImageAlign="AbsBottom" OnClick="ImageButton2_Click" />

                         <asp:Calendar ID="Calendar4" runat="server" OnSelectionChanged="Calendar4_Selectionchanged" OnDayRender="Calendar1_DayRender" Visible="false"></asp:Calendar>
                   </td>
            <td style="padding-bottom:40px;"><asp:Button ID="btnSearchBar" runat="server" CssClass="btn btn-danger" Text="Search"  OnClick="Btndownload_Click" /></td>
       </tr>
       </table>
    <%-- <table align="center">
    <tr>
      <td colspan="2" style="padding-right: 4px; padding-left: 1px; vertical-align: top; text-align: center; padding-top: 40px;">
    <asp:Button ID="btnSaver" runat="server" CssClass="DataEntryFormTableButtons" Font-Bold="True" OnClick="btnSaver_Click" Text="Save" Width="100px" />
          </td>
    </tr>
          </table>--%>
    <br />
    <table align="center">
         <tr>
        <td style="padding-bottom: 2px; vertical-align: top; padding-top: 5px; text-align: right; width: 20%; padding-right: 20px;">
                 
                                    <asp:RadioButtonList ID="rbnExportType" runat="server"  
                                        Font-Bold="True" Font-Names="cambria" Font-Size="11pt" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">PDF 1</asp:ListItem>
                                        <asp:ListItem>EXCEL 2</asp:ListItem>
                                        <asp:ListItem>EXCEL 3</asp:ListItem>
                                    </asp:RadioButtonList>

           

            </td>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <td>
                                
                                    <asp:Button ID="btnPrint" runat="server" CssClass="DataEntryFormTableButtons" 
                                        Font-Bold="True" 
                                        OnClick="btnPrint_Click" Text="PRINT" Width="100px" />
                               
         </td>
        </tr>
        <br />
        
     </table>
    <br />
    <br />
    <br />
    <br />

    <table   align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            
            <td   style="width:100px">
                                                 <CR:CrystalReportViewer ID="CrystalReportViewer" runat="server" align="center"
                                                  AutoDataBind = "False" 
                                                  Visible="true" 
                                                  HasToggleGroupTreeButton = "false"
                                                  HasCrystalLogo="False" 
                                                  SeparatePages="False" 
                                                  GroupTreeStyle-ShowLines ="false" 
                                                  DisplayToolbar = "False"
                                                  EnableDatabaseLogonPrompt = "false"
                                                  EnableParameterPrompt = "false"
                                                  ToolPanelView = "None"
                                                  Height="50px"
                                                  Width="350px" />

                                                </td>
        </tr>
    </table>

</asp:Content>

