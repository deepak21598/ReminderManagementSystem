<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOtp.aspx.cs" Inherits="ReminderManagementSystem.VerifyOtp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
  form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] ,input[type=email] {
  width: 150px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=submit]{
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 50px%;
}

input[type=submit]:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}



span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
}
.container{
    margin:200px 0px 200px 550px;
 
}
table{
    /*border: 1px solid black;*/
}
body {
  background-color: lightblue;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <table>
        <tr>

    <td><label for="uname"><b>OTP :</b></label></td>
    <td><asp:TextBox ID="txtName" runat="server" placeholder="Enter Otp" ></asp:TextBox></td>
        
      <td><asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/></td>
         
 
        </tr>
            
      </table>
         </div>
    </form>
</body>
</html>
