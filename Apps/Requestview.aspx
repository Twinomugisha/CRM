<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="Requestview.aspx.cs" Inherits="Requestview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="padding-bottom:40px; width:100%;">
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
    
  
      
                   <table><tr><td>
                        <asp:GridView ID="DataGrid1"
                        runat="server" GridLines="None"
                        CssClass="table table-hover" EmptyDataText="Area Data empty"
                        HorizontalAlign="Center"
                        OnItemCommand="DataGrid1_ItemCommand"
                       OnItemDataBound="DataGrid1_ItemDataBound"
                        OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged"
                        PageSize="7" Width="100%" AutoGenerateColumns="False">
                        <PagerStyle BackColor="#2461BF" ForeColor="White"
                            HorizontalAlign="Center" />
                        <RowStyle CssClass="gridRowStyle" BackColor="#EFF3FB" />
                           <Columns>            
                           
                            <asp:BoundField DataField="Date Submitted"
                                HeaderText="Date Submitted">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Product"
                                HeaderText="Product">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Reason"
                                HeaderText="Reason">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Priority"
                                HeaderText="Priority">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Date Required"
                                HeaderText="Date Required">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Change Description"
                                HeaderText="Change Description">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Approved"
                                HeaderText="Status">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                              
                              
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataRowStyle HorizontalAlign="Center" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle CssClass="gridAlternatingRowStyle" BackColor="White" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                       
                    </asp:GridView>
     </td></tr></table>
</asp:Content>

