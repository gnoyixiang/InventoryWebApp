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
        IEmployeeDAO employeeDAO = new EmployeeDAO();
        IUserDAO userDAO = new UserDAO();
        IStationeryCatalogueDAO sDAO = new StationeryCatalogueDAO();
        AssignRoleDAO assignRoleDAO = new AssignRoleDAO();

        public string GetUserEmail(string username)
        {
            try
            {
                return userDAO.GetUserByUsername(username).Email;
            }
            catch (NullReferenceException ex)
            {
                throw ex;
            }
        }

        private string GetUserDeptCode(string username)
        {
            return employeeDAO.GetDeptCodeByUserName(username);
        }

        private List<String> GetRecepientsEmail(string deptCode, List<String> roles)
        {
            List<String> emails = new List<string>();
            foreach (string role in roles)
            {
                List<Employee> employees = employeeDAO.SearchByDept(deptCode);
                foreach (Employee e in employees)
                {
                    Role r = userDAO.getRoleNameByUsername(e.UserName);
                    if (r != null)
                    {
                        if (r.Id == role)
                        {
                            emails.Add(GetUserEmail(e.UserName));
                        }
                    }
                }
            }
            return emails;
        }

        private void GetDepartmentRepEmail(string deptCode)
        {
            
        }

        public void ConfirmDisbursementSendEmail(string fromEmail, string password, string username, List<Disbursement> dList)
        {
            List<String> toEmail = new List<string>();
            foreach (Disbursement d in dList)
            {
                string deptCode = d.DepartmentCode;
                toEmail.Add(GetDepartmentRepEmail(deptCode));
            }
            

            string emailSubject = "Create Purchase Orders";
            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendLine("The following purchase orders have been created:");
            foreach (PurchaseOrder po in purchaseOrders)
            {
                emailBody.AppendLine("http://localhost/Store/PurchaseOrderDetail?PO=" + po.PurchaseOrderCode);
            }
            emailBody.AppendLine("The orders are created by " + employeeDAO.GetEmployeeName(username));
            emailBody.AppendLine();
            emailBody.AppendLine("This email is automatically generated");
            try
            {
                SendMultipleEmail(fromEmail, password, toEmail, emailSubject, emailBody.ToString());
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


        public void CreatePurchaseOrdersSendEmail(string fromEmail, string password, string username, List<PurchaseOrder> purchaseOrders)
        {
            //send to store supervisor
            //get deptCode of username
            string deptCode = GetUserDeptCode(username);
            //get all employees in this dept with role store supervisor
            List<String> roles = new List<string>() { "SSupervisor" };
            List<String> toEmail = GetRecepientsEmail(deptCode, roles);
            
            string emailSubject = "Create Purchase Orders";
            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendLine("The following purchase orders have been created:");
            foreach (PurchaseOrder po in purchaseOrders)
            {
                emailBody.AppendLine("http://localhost/Store/PurchaseOrderDetail?PO=" + po.PurchaseOrderCode);
            }
            emailBody.AppendLine("The orders are created by " + employeeDAO.GetEmployeeName(username));
            emailBody.AppendLine();
            emailBody.AppendLine("This email is automatically generated");
            try
            {
                SendMultipleEmail(fromEmail, password, toEmail, emailSubject, emailBody.ToString());
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


        public void NewAdjustmentSendEmail(string fromEmail, string password, string username, Adjustment adjustment)
        {
            //get deptCode of username
            string deptCode = GetUserDeptCode(username);
            //get all employees in this dept with role store supervisor / manager
            StationeryCatalogue stationery = sDAO.GetStationery(adjustment.ItemCode);
            List<String> roles;
            if (adjustment.AdjustmentQuant * stationery.Price <= 250)
            {
                roles = new List<string>() { "SSupervisor" };
            }
            else
            {
                roles = new List<string>() { "SManager" };
            }
            List<String> toEmail = GetRecepientsEmail(deptCode, roles);

            string emailSubject = "Adjustment for Approval";
            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendLine("The following adjustment has been created:");

            emailBody.AppendLine("http://localhost/Store/AdjustmentByStoreManager?AdjustmentCode=" + adjustment.AdjustmentCode);

            emailBody.AppendLine("The stock adjustment is created by " + employeeDAO.GetEmployeeName(username));
            emailBody.AppendLine();
            emailBody.AppendLine("This email is automatically generated");

            try
            {
                SendMultipleEmail(fromEmail, password, toEmail, emailSubject, emailBody.ToString());
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
        public void NewRequestSendEmail(string fromEmail, string password, string username, string requestcode)
        {
            //send to Department Head
            //get deptCode of username
            string deptCode = GetUserDeptCode(username);
            //get all employees in this dept with role Department Head
            List<String> roles = new List<string>() { "Head" };
            List<String> toEmail = GetRecepientsEmail(deptCode, roles);

            string emailSubject = "Request for Approval";
            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendLine("The following request has been created:");

            emailBody.AppendLine("http://localhost/Dept/RequisitionDetails?REQUESTCODE=" + requestcode);

            emailBody.AppendLine("The request is created by " + employeeDAO.GetEmployeeName(username));
            emailBody.AppendLine();
            emailBody.AppendLine("This email is automatically generated");

            try
            {
                SendMultipleEmail(fromEmail, password, toEmail, emailSubject, emailBody.ToString());
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
        public void AdjApproveRejectSendEmail(string fromEmail, string password, string username, Adjustment adjustment)
        {
            //send to user email
            string toEmail = GetUserEmail(adjustment.UserName);
                        
            string emailSubject = "Adjustment approve/reject failed";
            StringBuilder emailBody = new StringBuilder("Adjustment approve/reject failed");
            if (adjustment.Status == "Approve")
            {
                emailSubject = "Adjustment Approved";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following adjustment has been approved:");

                emailBody.AppendLine("http://localhost/Store/StockAdjustmentView?AdjustmentCode=" + adjustment.AdjustmentCode);

                emailBody.AppendLine("The stock adjustment is approved by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }
            if (adjustment.Status == "Reject")
            {
                emailSubject = "Adjustment Rejected";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following adjustment has been rejected:");

                emailBody.AppendLine("http://localhost/Store/StockAdjustmentView?AdjustmentCode=" + adjustment.AdjustmentCode);

                emailBody.AppendLine("The stock adjustment is rejected by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }


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
        public void POApproveRejectSendEmail(string fromEmail, string password, string username, PurchaseOrder purchaseOrder)
        {
            string toEmail = GetUserEmail(purchaseOrder.UserName);
            string emailSubject = "PO approve/reject failed";
            StringBuilder emailBody = new StringBuilder("PO approve/reject failed");
            if (purchaseOrder.Status == "APPROVED")
            {
                emailSubject = "Purchase Order Approved";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following Purchase Order has been approved:");

                emailBody.AppendLine("http://localhost/Store/PurchaseOrderDetail?PO=" + purchaseOrder.PurchaseOrderCode);

                emailBody.AppendLine("The stock Purchase Order is approved by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }
            if (purchaseOrder.Status == "REJECTED")
            {
                emailSubject = "Purchase Order Rejected";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following Purchase Order has been rejected:");

                emailBody.AppendLine("http://localhost/Store/PurchaseOrderDetail?PO=" + purchaseOrder.PurchaseOrderCode);

                emailBody.AppendLine("The stock Purchase Order is rejected by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }


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
        public void RequestApproveRejectSendEmail(string fromEmail, string password, string username, Request RO)
        {
            string toEmail = GetUserEmail(RO.UserName);
            string emailSubject = "Request approve/reject failed";
            StringBuilder emailBody = new StringBuilder("Request approve/reject failed");
            if (RO.Status == "processing")
            {
                //email must belong to a store clerk
                toEmail = Util.EMAIL;
                emailSubject = "Request Approved";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following request has been approved:");
                emailBody.AppendLine(RO.RequestCode);

                emailBody.AppendLine();
                emailBody.AppendLine("This request can be accessed at");
                emailBody.AppendLine("http://localhost/Store/RequisitionList");

                emailBody.AppendLine("The request is approved by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }
            if (RO.Status == "rejected")
            {
                //email must belong to an employee
                toEmail = Util.EMAIL;
                emailSubject = "Request Rejected";
                emailBody = new StringBuilder();
                emailBody.AppendLine("The following request has been rejected:");
                emailBody.AppendLine(RO.RequestCode);

                emailBody.AppendLine();
                emailBody.AppendLine("This request can be accessed at");
                emailBody.AppendLine("http://localhost/Dept/RequisitionDetails?REQUESTCODE=" + RO.RequestCode);

                emailBody.AppendLine("The request is rejected by " + employeeDAO.GetEmployeeName(username));
                emailBody.AppendLine();
                emailBody.AppendLine("This email is automatically generated");
            }


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

        private void SendMultipleEmail(string fromEmail, string password, List<String> toEmail, string emailSubject, string emailBody)
        {
            try
            {
                foreach (string email in toEmail)
                {
                    SendEmail(fromEmail, password, email, emailSubject, emailBody);
                }
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