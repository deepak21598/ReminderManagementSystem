using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace ReminderManagementSystem.App_Start
{
    public class SendEmail
    {
        public void SendMail(string to,string subject,string descryption)
        {
            // Specify the from and to email address
            MailMessage mailMessage = new MailMessage("remindme958@gmail.com", "deepak21598@gmail.com");
            // Specify the email body
            mailMessage.Body = descryption;
            // Specify the email Subject
            mailMessage.Subject = subject;

            // Specify the SMTP server name and post number
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            // Specify your gmail address and password
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "remindme958@gmail.com",
                Password = "Remind@123"
            };
            // Gmail works on SSL, so set this property to true
            smtpClient.EnableSsl = true;
            // Finall send the email message using Send() method
            smtpClient.Send(mailMessage);


        }
    }
}