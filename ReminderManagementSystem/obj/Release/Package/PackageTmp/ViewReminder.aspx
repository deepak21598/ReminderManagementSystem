<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewReminder.aspx.cs" Inherits="ReminderManagementSystem.ViewReminder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div>
     <table>

<tr>
<th>Select From Date:</th>
<td><asp:TextBox ID="txtFromDate" runat="server" TextMode="Date"></asp:TextBox></td>
<th>Select To Date:</th>
<td><asp:TextBox ID="txtToDate" runat="server" TextMode="Date"></asp:TextBox></td>
</tr>
 <tr>
  <th>Subject :</th>
<td><asp:DropDownList Id="ddlSubject" runat="server" Width="280px">
    <asp:ListItem Text="-Select-" Value="" />
     <asp:ListItem Text="Birthday" Value="Birthday" />
     <asp:ListItem Text="Meeting" Value="Meeting" />
     <asp:ListItem Text="Party" Value="Party" />
    </asp:DropDownList ></td>
 <td><asp:Button ID="btnSubmit" runat="server" TextMode="submit" Text="confirm" OnClick="btnSubmit_Click"/></td>
 </tr>
   </table>
     </div>

    <div style="overflow-x:scroll; overflow-y: scroll; margin-top: 5px; height: 430px; width: 100%; border-radius: 1px; color: black; border-style: groove">
         <asp:Panel ID="PanelGrid" runat="server" Visible="True" >
            <%--<ContentTemplate>--%>
        <asp:GridView ID="gvdetails" runat="server" AutoGenerateColumns="False" ShowFooter="False"
            Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"  
            CellPadding="3" ShowHeaderWhenEmpty="True" >
            <AlternatingRowStyle BackColor="#CCFFCC" />
           

            <EmptyDataTemplate>
                No Record Found...
            </EmptyDataTemplate>

            <FooterStyle BackColor="#bfbfbf" />
            <HeaderStyle BackColor="#05345C" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <%--</ContentTemplate>--%>
        </asp:Panel>
    </div>
</asp:Content>
