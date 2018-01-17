using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
namespace ConsoleTestApp
{
    class TestAssignRoleAndRole
    {
        public static void Main(string[] args)
        {
            // IAssignRoleDAO adao = new AssignRoleDAO();
            //AssignRole a = adao.GetAssignRoleInfo("1");
            //Console.WriteLine(a.EmployeeCode);
            //adao.UpdateAssignRole("1", "ActSMan",new DateTime(2017,01,11), new DateTime(2017, 01, 15));
            //List<AssignRole> alist = adao.ListAssignRole();
            //foreach(AssignRole a in alist)
            //{
            //   Console.WriteLine(a.EndDate);
            // }
            //adao.AddAssignRole("4","ActHead","10003", new DateTime(2017, 04, 05), new DateTime(2017, 04, 11), null);
            // adao.UpdateEndDate("1", new DateTime(2017, 01, 16));
            // adao.DeleteAssignRole("4");

            IRoleDAO rdao = new RoleDAO();
            //Role r = rdao.GetRoleInfo("Head");
            //Console.WriteLine(r.Name);
            //rdao.AddRole("hash", "hashcode");
            rdao.DeleteRole("hash");




        }

    }
}
