<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisableReminder.aspx.cs" Inherits="ReminderManagementSystem.DisableReminder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>

<tr>
<th>Select a Date:</th>
<td><asp:TextBox ID="txtDate" AutoPostBack="true" runat="server" TextMode="Date" OnTextChanged="txtDate_TextChanged"></asp:TextBox></td>
</tr>



<tr>
<th>Subject :</th>
<td><asp:DropDownList Id="ddlSubject" AutoPostBack="true" runat="server" Width="280px" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">

</asp:DropDownList>
</td>
</tr>
<tr>
<th>Reminder Name :</th>
<%--<td><asp:TextBox ID="txtReminder" runat="server" Width="300px"></asp:TextBox></td>--%>
<td><asp:DropDownList Id="ddlReminder" AutoPostBack="true" runat="server" Width="280px" OnSelectedIndexChanged="ddlReminder_SelectedIndexChanged">
    </asp:DropDownList>

</td>
</tr>
<tr>
<th>Add Descryption :</th>
<td><asp:TextBox Id="txtDescryption" runat="server" Width="300px"></asp:TextBox></td>
</tr>


<tr>
<td><asp:Button ID="btnSubmit" runat="server" TextMode="submit" Text="confirm" OnClick="btnSubmit_Click"/></td>
</tr>
</table>
</asp:Content>
