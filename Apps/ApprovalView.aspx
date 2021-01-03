<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="ApprovalView.aspx.cs" Inherits="ApprovalView" %>

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
    <br />
    <table align="center">
 
        <tr>
      <td colspan="2" style="padding-right: 4px; padding-left: 1px; vertical-align: top; text-align: center; padding-top: 40px;">
    <asp:Button ID="btnSaver" runat="server" CssClass="DataEntryFormTableButtons" Font-Bold="True" OnClick="btnSaver_Click" Text="Save" Width="100px" />
          </td>
    </tr>

    </table> 
              
   <table style="width:100%;"><tr><td style="width:100%;">
                       <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"  CssClass="table table-hover" AllowPaging="true" 
                                            CellPadding="4"  PageSize="20" pageButtonCount="5" GridLines="None" 
                                            OnItemCommand="DataGrid1_ItemCommand"  Width="100%" onDataItemBound="DataGrid1_ItemDataBound"
                                            OnPageIndexChanging="DataGrid1_PageIndexChanged">
                                           <ItemStyle CssClass="gridRowStyle"/>
                                            <AlternatingItemStyle CssClass="GridAlternatingItemStyle GridRows" />
                                            <PagerStyle  ForeColor="White"
                                              HorizontalAlign="Center" />
                                            <EditItemStyle CssClass="GridEditItemStyle"/>
                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                             <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <SelectedItemStyle CssClass="GridSelectedItemStyle"  BackColor="black"/>                                        
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                    <ItemStyle  Font-Bold="true" ForeColor="red" Font-Size="10pt" />
                                                </asp:BoundColumn>
                                               <asp:ButtonColumn CommandName="view" HeaderText="Details" Text="Details">
                                                    <ItemStyle Width="5%" Font-Bold="true" ForeColor="red" Font-Size="10pt" />
                                                </asp:ButtonColumn>
                                                 <asp:BoundColumn DataField="Requestor" HeaderText="Requestor">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="10%" />
                                                </asp:BoundColumn>
                                              
                                                <asp:BoundColumn DataField="Date Submitted" HeaderText="Date Submitted">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Product" HeaderText="Product">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="black" Width="10%" />
                                                </asp:BoundColumn>
                                                
                                                <asp:BoundColumn DataField="Priority" HeaderText="Priority">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" Width="10%" ForeColor="black" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Date Required" HeaderText="Date Required" >
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="10%" />
                                                </asp:BoundColumn>
                                               <asp:BoundColumn DataField="Approved" HeaderText="status">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="green" Width="10%" />
                                                </asp:BoundColumn>
                                                
                                                 <asp:TemplateColumn HeaderText="APPROVE">
                                                     <ItemTemplate>

                                                        <asp:SqlDataSource ID="GetStatus_GridCombo" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:LOCALMACHINE %>"
                                                                SelectCommandType="StoredProcedure"
                                                                 SelectCommand="GetStatus_GridCombo">
                                                        </asp:SqlDataSource>

                                                        <asp:DropDownList ID="cboStatus_grid1" runat="server" 

                                                               DataSourceID="GetStatus_GridCombo"
                                                               DataTextField="Status" 
                                                               DataValueField="ID"

                                                               CssClass="SystemDropdownListOthers2 DataEntryFormTableTextboxWidth" 
                                                               Font-Bold="True" Font-Names="cambria" Font-Size="10pt" Height="25px"                                                                
                                                               SelectedValue='<%# DataBinder.Eval(Container, "DataItem.Status") %>' 
                                                               Enabled='<%# DataBinder.Eval(Container, "DataItem.RecordActive") %>'
                                                               Width="90%">
                                                          </asp:DropDownList>
                                                  </ItemTemplate>
                                                  <ItemStyle HorizontalAlign="Center" Width="10%" font-Bold="true" />
                                               </asp:TemplateColumn>
                                               <asp:TemplateColumn HeaderText="REASON">
                                                       <ItemTemplate>
                                                               <asp:TextBox ID="txtreason__grid" runat="server" AutoCompleteType="Disabled"
                                                                                            CssClass="NewTextBoxes2 AlgRgh" EnableViewState="true" ForeColor="red" Font-Bold="true"                                                      Height="40px"   multline="true"                                  
                                                                                            Text='<%# DataBinder.Eval(Container, "DataItem.ReasonForRejection") %>' Width="90%">
                                                                                 </asp:TextBox>

                                                                                    
                                                              </ItemTemplate>

                                                    <ItemStyle HorizontalAlign="left" Width="20%" />
                                                </asp:TemplateColumn>  
                                                <asp:TemplateColumn HeaderText="AssignRequest">
                                                     <ItemTemplate>

                                                        <asp:SqlDataSource ID="GetUser_GridCombo" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:LOCALMACHINE %>"
                                                                SelectCommandType="StoredProcedure"
                                                                 SelectCommand="GetUser_GridCombo">
                                                        </asp:SqlDataSource>

                                                        <asp:DropDownList ID="cboUsers_grid1" runat="server" 
                                                               DataSourceID="GetUser_GridCombo"
                                                               DataTextField="Name" 
                                                               DataValueField="ID"

                                                               CssClass="SystemDropdownListOthers2 DataEntryFormTableTextboxWidth" 
                                                               Font-Bold="True" Font-Names="cambria" Font-Size="10pt" Height="25px"                                                                
                                                               SelectedValue='<%# DataBinder.Eval(Container, "DataItem.AssignRequest") %>' 
                                                               Enabled='<%# DataBinder.Eval(Container, "DataItem.AssignRequestactive") %>'
                                                               Width="90%">
                                                          </asp:DropDownList>
                                                  </ItemTemplate>
                                                  <ItemStyle HorizontalAlign="Center" Width="10%" font-Bold="true" />
                                               </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Confirm">
                                                       <ItemTemplate>

                                                            <asp:CheckBox ID="CheckBox1" runat="server" Width="10%" />              
                                                              </ItemTemplate>

                                                    <ItemStyle HorizontalAlign="left" Width="20%" />
                                                </asp:TemplateColumn>  
                                           </Columns>
                                        </asp:DataGrid> 
                         </td></tr></table>         
                                                
                     
    
</asp:Content>

