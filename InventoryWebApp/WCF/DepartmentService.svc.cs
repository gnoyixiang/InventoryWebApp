using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DepartmentService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select DepartmentService.svc or DepartmentService.svc.cs at the Solution Explorer and start debugging.
    public class DepartmentService : IDepartmentService
    {
        DepartmentHeadController dController = new DepartmentHeadController();
        public WCFAssignRole GetAssignRole(string assignrolecode)
        {

            AssignRole a = dController.GetAssignRoleInfo(assignrolecode);
            string emName = dController.GetEmployeeName(a.EmployeeCode);
            WCFAssignRole ass = new WCFAssignRole(a.AssignRoleCode, a.TemporaryRoleCode, a.EmployeeCode,
                string.Format("{0:dd/MM/yyyy}", a.StartDate), string.Format("{0:dd/MM/yyyy}", a.EndDate),
                a.AssignedBy, emName);
            return ass;
        }
        /*public  List<WCFAssignRole> GetListAssignrole()
    {
        List<WCFAssignRole> wcfASList = new List<WCFAssignRole>();
        List<AssignRole> alist = dController.ListAssignRole();
        foreach (AssignRole a in alist)
        {
            string emName = dController.GetEmployeeName(a.EmployeeCode);
            wcfASList.Add(new WCFAssignRole(a.AssignRoleCode, a.TemporaryRoleCode, a.EmployeeCode,
                string.Format("{0:dd/MM/yyyy}", a.StartDate), string.Format("{0:dd/MM/yyyy}", a.EndDate),
                a.AssignedBy,emName));
        }
        return wcfASList;
    }*/
        public List<WCFAssignRole> GetAssignRoleInDepartment(string deptCode)
        {
            List<WCFAssignRole> wcfASList = new List<WCFAssignRole>();
            List<AssignRole> alist = dController.ListOfAssignRoleInDepartment(deptCode);
            foreach (AssignRole a in alist)
            {
                string emName = dController.GetEmployeeName(a.EmployeeCode);
                wcfASList.Add(new WCFAssignRole(a.AssignRoleCode, a.TemporaryRoleCode, a.EmployeeCode,
                    string.Format("{0:dd/MM/yyyy}", a.StartDate), string.Format("{0:dd/MM/yyyy}",
                    a.EndDate), a.AssignedBy, emName));
            }
            return wcfASList;
        }
        public WCFEmployee GetEmployee(string employeecode)
        {

            Employee emp = dController.GetEmployeeInfoByEmployeeCode(employeecode);
            WCFEmployee e = new WCFEmployee(emp.EmployeeCode, emp.ReportTo, emp.DepartmentCode,
                    emp.CurrentRoleCode, emp.EmployeeName, emp.EmployeeTitle, emp.UserName);
            return e;
        }

        /*public List<WCFEmployee> GetListEmployee()
        {
            List<WCFEmployee> wcfEList = new List<WCFEmployee>();
            List<Employee> elist = dController.ListEmployee();
            foreach (Employee e in elist)
            {
                wcfEList.Add(new WCFEmployee(e.EmployeeCode, e.ReportTo, e.DepartmentCode,
                    e.CurrentRoleCode, e.EmployeeName, e.EmployeeTitle, e.UserName));
            }
            return wcfEList;
        }*/

        public List<WCFEmployee> GetEmployeeInDepartment(string deptCode)
        {
            List<WCFEmployee> wcfEList = new List<WCFEmployee>();
            List<Employee> elist = dController.ListAllEmployeeNameInDepartment(deptCode);
            foreach (Employee e in elist)
            {
                wcfEList.Add(new WCFEmployee(e.EmployeeCode, e.ReportTo, e.DepartmentCode,
                    e.CurrentRoleCode, e.EmployeeName, e.EmployeeTitle, e.UserName));
            }
            return wcfEList;
        }
        public WCFRole GetRole(string id)
        {

            Role rl = dController.GetRoleInfo(id);
            WCFRole r = new WCFRole(rl.Id, rl.Name);
            return r;
        }

        public List<WCFRole> GetRoleNameInDepartment()
        {
            List<WCFRole> wcfRList = new List<WCFRole>();
            List<Role> rlist = dController.ListAllDepartmentRoles();
            foreach (Role r in rlist)
            {
                wcfRList.Add(new WCFRole(r.Id, r.Name));
            }
            return wcfRList;

        }


        public String AddAssignRole(WCFAssignRole wcfassignrole)
        {
            //try
            //{
            AssignRole a = new AssignRole()
            {
                AssignRoleCode = "AS" + DateTime.Now.ToString("yyyyMMddHHmmssfff"),
                TemporaryRoleCode = wcfassignrole.TemporaryRoleCode,
                EmployeeCode = wcfassignrole.EmployeeCode,

                // StartDate = Convert.ToDateTime( wcfassignrole.StartDate) ,
                //EndDate = Convert.ToDateTime(wcfassignrole.EndDate),
                AssignedBy = wcfassignrole.AssignedBy
            };
            if (wcfassignrole.TemporaryRoleCode!="ActHead")
            {
                a.StartDate = null;
                a.EndDate = null;
            }
            else
            {
                a.StartDate = Convert.ToDateTime(wcfassignrole.StartDate);
                a.EndDate = Convert.ToDateTime(wcfassignrole.EndDate);
            }

            if (wcfassignrole.TemporaryRoleCode == "ActHead")
            {
                if (dController.CheckTemporaryRoleAndDates(wcfassignrole.TemporaryRoleCode, Convert.ToDateTime(a.StartDate),
                    Convert.ToDateTime(a.EndDate)) 
                    &&
                    dController.CheckEmployee(wcfassignrole.EmployeeCode))
                {
                    dController.AddAssignRole(a.AssignRoleCode, a.TemporaryRoleCode,
                        a.EmployeeCode, a.StartDate, a.EndDate, a.AssignedBy);
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                if (dController.CheckTemporaryRole(wcfassignrole.TemporaryRoleCode)&&
                    dController.CheckEmployee(wcfassignrole.EmployeeCode))
                {
                    dController.AddAssignRole(a.AssignRoleCode, a.TemporaryRoleCode,
                        a.EmployeeCode, a.StartDate, a.EndDate, a.AssignedBy);
                    return "true";

                }
                else
                {
                    return "false";
                }
                    

            }
            //}
            //catch (Exception ex)
            //{
            //    //ex.Message;

            //}

        }

    }
}
        

