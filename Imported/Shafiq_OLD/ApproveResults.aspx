<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" 
AutoEventWireup="true" CodeFile="ApproveResults.aspx.cs" 
Inherits="ApproveResults" Title="Approve Results" %>


<%@ Register 
 Assembly="AjaxControlToolkit" 
 Namespace="AjaxControlToolkit" 
 TagPrefix="ajaxToolkit" %>
 <%@ Import
  Namespace="System.Threading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
               
   <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View2" runat="server">
              <div class="row">
               <div class="col-sm-12">    
                     <asp:Label ID="lblmessage" runat="server" 
                                    Font-Bold="False" Font-Names="Verdana" 
                                                       Font-Size="Larger" 
        Text="" ForeColor="Red" ></asp:Label>     
            <h4>Approve Results</h4>
             
                            <asp:Label ID="Label7" runat="server" 
                                Text="List of the samples results sent for Approval"></asp:Label>
                      


 <asp:GridView ID="GridView1" runat="server" CssClass="gridgeneralstyle" 
                    HorizontalAlign="Center" PageSize="7" Width="98%" EmptyDataText="No Samples Available from frontdesk" 
        OnSelectedIndexChanged="GridSamples_SelectedIndexChanged"
         CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                    >
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle CssClass="gridRowStyle" BackColor="#EFF3FB" />
        <Columns>
                         <asp:CommandField ShowSelectButton="true"
                 ButtonType="Link" SelectText="Approve"
                   HeaderText="Approve"> 
                         <ItemStyle Width="100px" />
                         </asp:CommandField>
                        <asp:BoundField DataField="SampleCode" HeaderText="Sample" >
                          <ItemStyle Width="200px" />
                         </asp:BoundField>
                          <asp:BoundField DataField="CName" HeaderText="Client" />
                     <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                     <asp:BoundField DataField="DateSampleAtReceiption" HeaderText="DateSampleAtReceiption" >
                         <ItemStyle Width="150px" />
                         </asp:BoundField>
                   
                   <asp:BoundField DataField="SampleCategory" HeaderText="Category" />
                   <asp:BoundField DataField="Parameters4MyLab" HeaderText="Parameters4MyLab" />
                                  <asp:BoundField DataField="TotalSamples" HeaderText="TotalParameters" />
                     </Columns>
                         
                  
                        
                         
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle CssClass="gridAlternatingRowStyle" BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

















<asp:Label ID="lblaccesslevel" runat="server" 
                                    Font-Bold="True" Font-Names="Verdana" 
                                                       Font-Size="9pt" 
        Text="message" ForeColor="Red" Visible="False"></asp:Label>
        
                
    <asp:GridView ID="GridSamples" runat="server" CssClass="gridgeneralstyle" 
                    HorizontalAlign="Center" PageSize="7" Width="98%" EmptyDataText="No new results have been sent for approval from laboratory." 
        OnSelectedIndexChanged="GridSamples_SelectedIndexChanged"
         CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                    >
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle CssClass="gridRowStyle" BackColor="#EFF3FB" />
        <Columns>
                         <asp:CommandField ShowSelectButton="true"
                 ButtonType="Link" SelectText="Approve"
                   HeaderText="Approve"> 
                         <ItemStyle Width="100px" />
                         </asp:CommandField>
                        <asp:BoundField DataField="SampleCode" HeaderText="Sample" >
                          <ItemStyle Width="200px" />
                         </asp:BoundField>
                          <asp:BoundField DataField="CName" HeaderText="Client" />
                     <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                     <asp:BoundField DataField="DateSampleAtReceiption" HeaderText="DateSampleAtReceiption" >
                         <ItemStyle Width="150px" />
                         </asp:BoundField>
                     <asp:BoundField DataField="OfficerInCharge" HeaderText="OfficerInCharge" />
                   <asp:BoundField DataField="SampleCategory" HeaderText="Category" />
                   <asp:BoundField DataField="Parameters4MyLab" HeaderText="Parameters4MyLab" />
                                  <asp:BoundField DataField="TotalSamples" HeaderText="TotalParameters" />
                     </Columns>
                         
                  
                        
                         
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle CssClass="gridAlternatingRowStyle" BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                
                            <asp:Label ID="lblSampleMessage" runat="server" Font-Bold="True" Font-Names="Cambria"
                                Font-Size="15pt" ForeColor="Blue" Text="Sample Results" Visible="False" Width="85%"></asp:Label>
                   </div>

</div>

            </asp:View>
       <asp:View ID="View3" runat="server">
           
 
           <div class="row">
               <div class="col-sm-12">
           <h4 class="center_txt">Details</h4>
          <asp:GridView ID="gvsamplesingle" runat="server" CssClass="gridgeneralstyle" 
                    HorizontalAlign="Center" PageSize="7" Width="95%"
                EmptyDataText="No Samples Available from frontdesk" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    >
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle CssClass="gridRowStyle" BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle CssClass="gridAlternatingRowStyle" BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
           <p></p>
           <hr />
             <h4 class="center_txt">View Submited Results</h4>
                   
                          <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="background-color: GhostWhite">
                          
                            <b>Sample Number: </b>
                            <asp:Label ID="lblquestion" runat="server" Text='<%# Eval("[SampleCode]") %>'> 
                            </asp:Label>
                            </ItemTemplate> </asp:Repeater>

          </div> 
</div>
           <div class="row">
               <div class="col-sm-6">
                                                                   <asp:DataGrid id="DataGrid1" runat="server" Width="100%" 
                        AutoGenerateColumns="False" BorderColor="White" CellPadding="3" 
                        onitemdatabound="DataGrid1_ItemDataBound">
                                                                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                                                                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                                                                <ItemStyle ForeColor="#000066" />
                                                                                                <HeaderStyle BackColor="#5695DA" Font-Bold="True" ForeColor="White" />
                                                                                                <Columns>
                                                                                                
                                                                                                    
                                                                                                     <asp:BoundColumn DataField="SampleCode" HeaderText="SAMPLE">
                                                                                                        <ItemStyle Width="50px"/>
                                                                                                    </asp:BoundColumn>
                                                                                                    
                                                                                                     <asp:BoundColumn DataField="Pname" HeaderText="PARAMETER">
                                                                                                        <ItemStyle Width="220px"/>
                                                                                                    </asp:BoundColumn>
                                                                                                    
                                                                                                     <asp:BoundColumn DataField="Unit" HeaderText="UNITS">
                                                                                                        <ItemStyle Width="50px"/>
                                                                                                    </asp:BoundColumn>
                                                                                                    
                                                                                                    <asp:TemplateColumn HeaderText="RESULTS">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:TextBox ID="ParameteResult" runat="server" EnableViewState="true" Height="40px" Enabled="false"
                                                                                                                Text='<%# DataBinder.Eval(Container, "DataItem.ParameteResult") %>' TextMode="MultiLine"
                                                                                                                Width="100%" >
					</asp:TextBox>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateColumn>
                                                                                                </Columns>
                                                                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" Mode="NumericPages" />
                                                                                            </asp:DataGrid>

               </div>
               <div class="col-sm-6">
                   <p>Remark</p>
                    <asp:TextBox ID="txtcomment" runat="server" EnableViewState="true" Height="40px" 
                TextMode="MultiLine"
               Width="250"/>

              <div class="row pad_from_top">

                        <div class="col-sm-5">
                            <div class="row">
                      <div class="col-sm-6">
                               <asp:Button CssClass="btn-primary" ID="btnapprove" runat="server"
                                    Font-Bold="True" Font-Size="9pt" Height="40"
                                OnClick="btnapprove_Click" Text="Approve" Width="100" />
                       
                      </div>
                          <div class="col-sm-6">
                              
                            <asp:Button CssClass="btn-warning pad_left" ID="btncancel" runat="server"
                                 Font-Bold="True" Font-Size="9pt" Height="40px"
                                OnClick="btncancel_Click" Text="Cancel" Width="100" />  
                              </div>
                                </div>
                            </div>
                      <div class="col-sm-1"></div>

                  <div class="col-sm-7">  <hr />               
                               

              

              </div>

               </div>

           </div>
                 <div class="col-sm-2"></div>
               <br><br><br><br><br><br><br><br><br><br>
               <a title ="Print This Page " alt="Print This Page" onclick="window.print();"target="_blank" 
                   style="cursor:pointer"><input type="submit" value="PRINT THIS PAGE" CssClass="btn-primary" /></a>
                                <asp:Button CssClass="btn-success" Font-Bold="True" Font-Size="9pt" Height="40px"
                                OnClick="window.print();"target="_blank" 
                   style="cursor:pointer" Text="Print Test Results" Width="100" />  </asp:Button>
                                </div>
          
            
       </asp:View>
            </asp:MultiView>
                </div>
            </div>
        </div>
</asp:Content>
