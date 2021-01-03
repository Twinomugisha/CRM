<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="Userdetails.aspx.cs" Inherits="Userdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;"><tr><td style="width:100%;">
                       <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" AllowPaging="true" 
                                            CellPadding="4"  PageSize="20" pageButtonCount="5" GridLines="None" 
                                            OnItemCommand="DataGrid6_ItemCommand"  Width="100%" 
                                             onDataItemBound="DataGrid6_ItemDataBound"
                                            OnPageIndexChanging="DataGrid6_PageIndexChanged">
                                           <ItemStyle CssClass="gridRowStyle"/>
                                            <AlternatingItemStyle CssClass="GridAlternatingItemStyle GridRows" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                             <HeaderStyle CssClass="gridHeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" />
                                           <EditItemStyle CssClass="GridEditItemStyle"/>
                                           <SelectedItemStyle CssClass="GridSelectedItemStyle"  BackColor="black"/>                                        
                                            <Columns>
                                               <asp:ButtonColumn CommandName="view" HeaderText="Details" Text="Details">
                                                    <ItemStyle Width="5%" Font-Bold="true" ForeColor="red" Font-Size="10pt" />
                                                </asp:ButtonColumn>
                                              <asp:BoundColumn DataField="Eid" HeaderText="Eid">
                                                    <ItemStyle Width="10%" Font-Bold="true" ForeColor="red" Font-Size="10pt" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="FirstName" HeaderText="FirstName">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="blue" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="LastName" HeaderText="LastName">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="black" Width="10%" />
                                                </asp:BoundColumn>
                                                
                                                <asp:BoundColumn DataField="EmailAddress" HeaderText="EmailAddress">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="AccessLevel" HeaderText="AccessLevel">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="red" Width="10%" />
                                                </asp:BoundColumn>
                                               <asp:BoundColumn DataField="Product" HeaderText="Product">
                                                    <ItemStyle Font-Bold="true" Font-Size="10pt" ForeColor="red" Width="10%" />
                                                </asp:BoundColumn>
                                           </Columns>
                                        </asp:DataGrid> 
                         </td></tr></table>         
</asp:Content>

