<%@ Page Title="" Language="C#" MasterPageFile="~/PAYMENTS/dashboard.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="PAYMENTS_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBox1.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m,  %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Panel runat="server">
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                    <img src="calender.png" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

