<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="Approve_reject.aspx.cs" Inherits="Approve_reject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>

        <tr>
                        <div class="col-sm-6">
                          <td class="DataEntryFormTableColumn2" Bold="True">Reason </td>
                            </div>
                           
                      <div class="col-sm-6">
                        
                         <td>
                              <asp:TextBox ID="txtcostimplication" runat="server" CssClass="form-control input-sm" Font-Size="11pt" Height="200px"  width="1000px" onblur="Change(this, event)" onfocus="Change(this, event)" TextMode="MultiLine" ></asp:TextBox>
                          </td>
                          <td class="DataEntryFormTableColumn5">
                              <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text="*" ></asp:Label>
                                 </td>
                          
                          </div>
            </tr>
        <tr>
      <td colspan="2" style="padding-right: 4px; padding-left: 1px; vertical-align: top; text-align: center; padding-top: 40px;">
    <asp:Button ID="btnSave" runat="server" CssClass="DataEntryFormTableButtons" Font-Bold="True" OnClick="btnSave_Click" Text="save Reason" Width="150px" />
          </td>
    </tr>             

    </table>
     
</asp:Content>

