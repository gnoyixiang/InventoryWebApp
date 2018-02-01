using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DepartmentService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select DepartmentService.svc or DepartmentService.svc.cs at the Solution Explorer and start debugging.
    public class DepartmentService : IDepartmentService
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        ILoginService loginService = new LoginService();

        public List<WCFRequest> ListAllPendingRequest(string deptCode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFRequest> wcfReqList = new List<WCFRequest>();
                List<Request> rlist = dCon.ListPendingRequest(deptCode);
                foreach (Request r in rlist)
                {
                    string empName = dCon.GetEmployeeName(r.UserName);
                    wcfReqList.Add(new WCFRequest(r.RequestCode, r.DepartmentCode, string.Format("{0:dd/MM/yyyy}", r.DateCreated)
                        , r.Status, r.Notes, r.UserName, empName));
                }
                return wcfReqList;
            }
            else
            {
                return null;
            }
        }

        public List<WCFRequestDetail> ListRequestDetail(string code, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFRequestDetail> wcfReqDetailList = new List<WCFRequestDetail>();
                List<RequestDetail> rqlist = dCon.ListRequestDetail(code);
                foreach (RequestDetail rq in rqlist)
                {

                    StationeryCatalogue s = dCon.GetStationeryCatalogue(rq.ItemCode);
                    string category = s.CategoryCode;
                    string description = s.Description;
                    //string description = dCon.GetDescription(rq.ItemCode);
                    wcfReqDetailList.Add(new WCFRequestDetail(rq.ItemCode, rq.Quantity.ToString(), category, description));

                }
                return wcfReqDetailList;
            }
            else
            {
                return null;
            }
        }

        public String Update(WCFRequest r, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                //try {
                Request req = new Request
                {
                    RequestCode = r.RequestCode,
                    Status = r.Status,
                    ApprovedBy = r.ApprovedBy,
                    HeadRemarks = r.HeadRemark,
                    DateApproved = DateTime.Now

                };
                dCon.UpdateRequest(req, req.Status);
                return "success";
                //}catch(Exception ex)
                //{
                // return ex.Message;
                //}
            }
            else
            {
                return null;
            }
        }





       
        public WCFAssignRole GetAssignRole(string assignrolecode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {

                AssignRole a = dCon.GetAssignRoleInfo(assignrolecode);
            string emName = dCon.GetEmployeeName(a.EmployeeCode);
            WCFAssignRole ass = new WCFAssignRole(a.AssignRoleCode, a.TemporaryRoleCode, a.EmployeeCode,
                string.Format("{0:dd/MM/yyyy}", a.StartDate), string.Format("{0:dd/MM/yyyy}", a.EndDate),
                a.AssignedBy, emName);
            return ass;
            }
            else
            {
                return null;
            }

        }
        public List<WCFAssignRole> GetAssignRoleInDepartment(string deptCode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFAssignRole> wcfASList = new List<WCFAssignRole>();
            List<AssignRole> alist = dCon.ListOfAssignRoleInDepartment(deptCode);
            foreach (AssignRole a in alist)
            {
                string emName = dCon.GetEmployeeName(a.EmployeeCode);
                wcfASList.Add(new WCFAssignRole(a.AssignRoleCode, a.TemporaryRoleCode, a.EmployeeCode,
                    string.Format("{0:dd/MM/yyyy}", a.StartDate), string.Format("{0:dd/MM/yyyy}",
                    a.EndDate), a.AssignedBy, emName));
            }
            return wcfASList;
            }
            else
            {
                return null;
            }
        }
        public WCFEmployee GetEmployee(string employeecode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {

                Employee emp = dCon.GetEmployeeInfoByEmployeeCode(employeecode);
            WCFEmployee e = new WCFEmployee(emp.EmployeeCode, emp.ReportTo, emp.DepartmentCode,
                    emp.CurrentRoleCode, emp.EmployeeName, emp.EmployeeTitle, emp.UserName);
            return e;
            }
            else
            {
                return null;
            }
        }
        public List<WCFEmployee> GetEmployeeInDepartment(string deptCode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFEmployee> wcfEList = new List<WCFEmployee>();
            List<Employee> elist = dCon.ListAllEmployeeNameInDepartment(deptCode);
            foreach (Employee e in elist)
            {
                wcfEList.Add(new WCFEmployee(e.EmployeeCode, e.ReportTo, e.DepartmentCode,
                    e.CurrentRoleCode, e.EmployeeName, e.EmployeeTitle, e.UserName));
            }
            return wcfEList;
            }
            else
            {
                return null;
            }
        }
        public WCFRole GetRole(string id, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {

                Role rl = dCon.GetRoleInfo(id);
            WCFRole r = new WCFRole(rl.Id, rl.Name);
            return r;
            }
            else
            {
                return null;
            }
        }
        public List<WCFRole> GetRoleNameInDepartment( string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFRole> wcfRList = new List<WCFRole>();
            List<Role> rlist = dCon.ListAllDepartmentRoles();
            foreach (Role r in rlist)
            {
                wcfRList.Add(new WCFRole(r.Id, r.Name));
            }
            return wcfRList;
            }
            else
            {
                return null;
            }

        }


        public String AddAssignRole(WCFAssignRole wcfassignrole, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                //try
                //{
                string rolecodeselected = wcfassignrole.TemporaryRoleCode;
            string assignrolecode = "AS" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            if (rolecodeselected == "ActHead")
            {
                DateTime startdateselected = Convert.ToDateTime(wcfassignrole.StartDate);
                DateTime enddateselected = Convert.ToDateTime(wcfassignrole.EndDate);

                bool checkvalue = dCon.CheckTemporaryRoleAndDates(rolecodeselected, startdateselected, enddateselected);
                bool checkemployee = dCon.CheckEmployee(wcfassignrole.EmployeeCode);
                if (checkvalue && checkemployee)
                {
                    dCon.AddAssignRole(assignrolecode, rolecodeselected, wcfassignrole.EmployeeCode, startdateselected, enddateselected, null);
                    return "true";
                    
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                bool checkvalue = dCon.CheckTemporaryRole(rolecodeselected);
                bool checkemployee = dCon.CheckEmployee(wcfassignrole.EmployeeCode);
                if (checkvalue && checkemployee)
                {
                    dCon.AddTemporaryRole(assignrolecode, rolecodeselected, wcfassignrole.EmployeeCode);
                    return "true";
                  

                }
                else
                {
                    return "false";
                }
              

            }
            }
            else
            {
                return null;
            }
            //AssignRole a = new AssignRole()
            //{
            //    AssignRoleCode = "AS" + DateTime.Now.ToString("yyyyMMddHHmmssfff"),
            //    TemporaryRoleCode = wcfassignrole.TemporaryRoleCode,
            //    EmployeeCode = wcfassignrole.EmployeeCode,

            //    // StartDate = Convert.ToDateTime( wcfassignrole.StartDate) ,
            //    //EndDate = Convert.ToDateTime(wcfassignrole.EndDate),
            //    AssignedBy = wcfassignrole.AssignedBy
            //};
            //if (wcfassignrole.TemporaryRoleCode != "ActHead")
            //{
            //    a.StartDate = null;
            //    a.EndDate = null;
            //}
            //else
            //{
            //    a.StartDate = Convert.ToDateTime(wcfassignrole.StartDate);
            //    a.EndDate = Convert.ToDateTime(wcfassignrole.EndDate);
            //}

            //if (wcfassignrole.TemporaryRoleCode == "ActHead")
            //{
            //    if (dController.CheckTemporaryRoleAndDates(wcfassignrole.TemporaryRoleCode, Convert.ToDateTime(a.StartDate),
            //        Convert.ToDateTime(a.EndDate))
            //        &&
            //        dController.CheckEmployee(wcfassignrole.EmployeeCode))
            //    {
            //        dController.AddAssignRole(a.AssignRoleCode, a.TemporaryRoleCode,
            //            a.EmployeeCode, a.StartDate, a.EndDate, a.AssignedBy);
            //        return "true";
            //    }
            //    else
            //    {
            //        return "false";
            //    }
            //}
            //else
            //{
            //    if (dController.CheckTemporaryRole(wcfassignrole.TemporaryRoleCode) &&
            //        dController.CheckEmployee(wcfassignrole.EmployeeCode))
            //    {
            //        dController.AddAssignRole(a.AssignRoleCode, a.TemporaryRoleCode,
            //            a.EmployeeCode, a.StartDate, a.EndDate, a.AssignedBy);
            //        return "true";

            //    }
            //    else
            //    {
            //        return "false";
            //    }


            //}
            ////}
            ////catch (Exception ex)
            ////{
            ////    //ex.Message;

            ////}

        }

    }
}