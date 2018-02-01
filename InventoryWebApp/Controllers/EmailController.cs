using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using InventoryWebApp.Controllers;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Controllers
{
    public class EmailController
    {
        EmployeeDAO employeeDAO = new EmployeeDAO();

        public void CreatePurchaseOrdersSendEmail(string fromEmail, string password, string username, List<PurchaseOrder> purchaseOrders)
        {
            string toEmail = Util.EMAIL;
            string emailSubject = "Create Purchase Orders";
            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendLine("The following purchase orders have been created:");
            foreach (PurchaseOrder po in purchaseOrders)
            {
                emailBody.AppendLine("http://localhost:15132/Store/PurchaseOrderDetail?PO=" + po.PurchaseOrderCode);
            }
            emailBody.AppendLine("The orders are created by " + employeeDAO.GetEmployeeName(username));
            emailBody.AppendLine();
            emailBody.AppendLine("This email is automatically generated");
            try
            {
                SendEmail(fromEmail, password, toEmail, emailSubject, emailBody.ToString());
            }
            catch (SmtpFailedRecipientsException ex)
            {
                throw ex;
            }
            catch (SmtpException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void SendEmail(string fromEmail, string password, string toEmail, string emailSubject, string emailBody)
        {
            //create email to inform of the purchase orders created to all store clerks for notification and store supervisor for approval
            //email should contain link to view purchase order detail          
            
            using (MailMessage mailMessage = new MailMessage(fromEmail, toEmail))
            {
                mailMessage.Subject = emailSubject;
                mailMessage.Body = emailBody;

                mailMessage.IsBodyHtml = false;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(fromEmail, password);
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = NetworkCred;
                smtpClient.Port = 587;
                try
                {
                    smtpClient.Send(mailMessage);
                }
                catch (SmtpFailedRecipientsException ex)
                {
                    throw ex;                    
                }
                catch (SmtpException ex)
                {
                    throw ex;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}