<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ReminderManagementSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        $(document).ready(function () {
            debugger;
            var v = String(new Date());
            document.getElementById("h20").innerHTML = "Today is " + v ;
        });
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to RemindMe Application <%=Session["UserId"].ToString()%></h2>
    <h2 id="h20">Today is </h2>
</asp:Content>
