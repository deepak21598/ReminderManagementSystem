<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateReminder.aspx.cs" Inherits="ReminderManagementSystem.UpdateReminder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
<td><asp:DropDownList ID="txtReminder" AutoPostBack="true" runat="server" Width="280px" OnSelectedIndexChanged="txtReminder_SelectedIndexChanged">
    </asp:DropDownList></td>
</tr>



<tr>
<th>Add Descryption :</th>
<td><asp:TextBox Id="txtDescryption" runat="server" Width="300px"></asp:TextBox></td>
</tr>

<tr>
<th>Email Address :</th>
<td><asp:TextBox id="txtEmail" runat="server" ReadOnly="true" TextMode="Email" Width="300px"></asp:TextBox></td>
</tr>

<tr>
<th>Contact No :</th>
<td><asp:textBox ID="txtContact" runat="server" TextMode="Phone" Width="300px"></asp:textBox></td>
</tr>

<tr>
<th>SMS No :</th>
<td><asp:textBox ID="txtSms" runat="server" TextMode="Phone" Width="300px"></asp:textBox></td>
</tr>


<tr>
<th>Recur for Next :</th>
<td>
<input type="radio" value="7" name="recur">7 days
<input type="radio" value="5" name="recur">5 days
<input type="radio" value="3" name="recur">3 days
<input type="radio" value="2" name="recur">2 days

</td>
</tr>

<tr>
<td><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" TextMode="submit" Text="confirm"/></td>
</tr>
</table>
</ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtReminder" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlSubject" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="txtDate" EventName="TextChanged" />
        </Triggers>
        </asp:UpdatePanel>
</asp:Content>
