<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="ViewchangeRequest.aspx.cs" Inherits="ViewchangeRequest" %>

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
            <td><asp:Button ID="btnSearchBar" runat="server" CssClass="btn btn-danger" Text="Search"  OnClick="Btndownload_Click" /></td>
       </tr>
       </table>
    <br />
    
  
      
         <table><tr><td>
             <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"  CssClass="table table-hover" AllowPaging="true" 
                                            CellPadding="4"  PageSize="20" pageButtonCount="5" GridLines="None" 
                                            OnItemCommand="DataGrid2_ItemCommand"  Width="100%" onDataItemBound="DataGrid2_ItemDataBound"
                                            OnPageIndexChanging="DataGrid2_PageIndexChanged">
                                           <ItemStyle CssClass="gridRowStyle"/>
                                            <AlternatingItemStyle CssClass="GridAlternatingItemStyle GridRows" />
                                            <PagerStyle  ForeColor="White"
                                              HorizontalAlign="Center" />
                                            <EditItemStyle CssClass="GridEditItemStyle"/>
                                             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                             <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <SelectedItemStyle CssClass="GridSelectedItemStyle"  BackColor="black"/>  
                                            <Columns> 
                                                <asp:BoundColumn DataField="id" HeaderText="id" visible="false">
                                                    <ItemStyle Width="15%" Font-Bold="true" ForeColor="black" Font-Size="10pt" />
                                                </asp:BoundColumn>
                                               <asp:ButtonColumn CommandName="view" HeaderText="Details" Text="Details">
                                                    <ItemStyle Width="10%" Font-Bold="true" ForeColor="red" Font-Size="10pt" />
                                                </asp:ButtonColumn>
                                              <asp:BoundColumn DataField="Requestor" HeaderText="Requestor">
                                                    <ItemStyle Width="15%" Font-Bold="true" ForeColor="black" Font-Size="10pt" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Date Submitted" HeaderText="Date Submitted">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Product" HeaderText="Product">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="black" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Priority" HeaderText="Priority">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" Width="15%" ForeColor="black" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Date Required" HeaderText="Date Required" >
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="30%" />
                                                </asp:BoundColumn>
                                                 <asp:BoundColumn DataField="Approved" HeaderText="Approved" >
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="0%" />
                                                </asp:BoundColumn>
                                           </Columns>
                                        </asp:DataGrid> </td></tr></table>
</asp:Content>

