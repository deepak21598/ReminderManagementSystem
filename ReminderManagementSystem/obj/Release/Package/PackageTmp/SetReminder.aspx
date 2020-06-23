<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetReminder.aspx.cs" Inherits="ReminderManagementSystem.SetReminder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function alertMessage() {
            alert("Thank You! Your Transaction is Confirmed !");
        }
        function calReminderName() {
            debugger;
            var date = document.getElementById("<%=txtDate.ClientID%>").value;
            var ddlSubject = document.getElementById("<%=ddlSubject.ClientID%>").value;
            var txtDescryption = document.getElementById("<%=txtDescryption.ClientID%>").value;
            var calReminderName = date + '_' + ddlSubject + '_' + txtDescryption.slice(0, 6);
            document.getElementById("<%=txtReminder.ClientID%>").value = calReminderName;
        } 
        function validateData() {
            debugger;
            var date = document.getElementById("<%=txtDate.ClientID%>").value;
            var txtReminder = document.getElementById("<%=txtReminder.ClientID%>").value;
            var ddlSubject = document.getElementById("<%=ddlSubject.ClientID%>").value;
            var txtDescryption = document.getElementById("<%=txtDescryption.ClientID%>").value;
            var txtEmail = document.getElementById("<%=txtEmail.ClientID%>").value;
            var txtContact = document.getElementById("<%=txtContact.ClientID%>").value;
            var txtSms = document.getElementById("<%=txtSms.ClientID%>").value;
            

            if (date == '') {
                alert("Please Select a Date!");
                return false;
            }
            else if (txtReminder == '') {
                alert("Please give reminder name!");
                return false;
            }
            else if (ddlSubject == '') {
                alert("Please select reminder subject!");
                return false;
            }
            else if (txtDescryption == '') {
                alert("Please add a descryption!");
                return false;
            }
            else if (txtEmail == '' && txtContact == '' && txtSms == '') {
                alert("One of the options - email, contact no, sms is mandatory !");
            return false;
          }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>

<tr>
<th>Select a Date:</th>
<td><asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox></td>
</tr>

<tr>
<th>Reminder Name :</th>
<td><asp:TextBox ID="txtReminder" runat="server" Width="300px" ReadOnly="false"></asp:TextBox></td>
</tr>

<tr>
<th>Subject :</th>
<td>
<asp:DropDownList ID="ddlSubject" AppendDataBoundItems="true" runat="server" Width="280px">
     <asp:ListItem Text="-Select-" Value="" />
     <asp:ListItem Text="Birthday" Value="Birthday" />
     <asp:ListItem Text="Meeting" Value="Meeting" />
     <asp:ListItem Text="Party" Value="Party" />
</asp:DropDownList>

</td>
</tr>

<tr>
<th>Add Descryption :</th>
<td><asp:TextBox Id="txtDescryption" runat="server" Width="300px" onchange="return calReminderName();" ></asp:TextBox></td>
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
<%--<asp:RadioButton ID="RadioButton1" runat="server" GroupName="recur" Text="7 days" Value="7"/>
<asp:RadioButton ID="RadioButton2" runat="server" GroupName="recur" Text="5 days" Value="5" />
<asp:RadioButton ID="RadioButton3" runat="server" GroupName="recur" Text="3 days" Value="3" />
<asp:RadioButton ID="RadioButton4" runat="server" GroupName="recur" Text="2 days" Value="2"/>--%>
</td>
</tr>

<tr>
<td><asp:Button ID="btnSubmit" runat="server" TextMode="submit" Text="confirm" OnClick="btnSubmit_Click" OnClientClick="return validateData();"/></td>
</tr>
</table>
</asp:Content>
