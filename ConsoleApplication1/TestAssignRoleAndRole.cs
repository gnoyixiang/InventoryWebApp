using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
using InventoryWebApp.Controllers;
using System.Globalization;

namespace ConsoleTestApp
{
    class TestAssignRoleAndRole
    {
        public static void Main(string[] args)
        {
            IAssignRoleDAO adao = new AssignRoleDAO();
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
            //rdao.DeleteRole("hash");


            StoreSupervisorController s = new StoreSupervisorController();

            //string role = s.GetTemporaryRole("10015");

            //Console.WriteLine(role);

            //Console.ReadLine();


            //Calendar c = CultureInfo.InvariantCulture.Calendar;


            //DateTime d = c.ToDateTime(2018, 01, 19, 09, 43, 07, 100);


            //string date = d.ToShortDateString();

            //DateTime d1 = new DateTime();

            //Console.WriteLine(d1);

            //DateTime result = DateTime.ParseExact(d.ToString(),
            //                            "yy/MM/dd",
            //                             CultureInfo.InvariantCulture);




            //string dt = "AS"+DateTime.Now.ToString( "yyyyMMddHHmmssfff");



            //List<AssignRole> list = s.ListOfEmployeeCodeInStore("10021");

            //foreach (AssignRole a in list)
            //{

            //    Console.WriteLine(a.EmployeeCode);
            //}

            //List<AssignRole> list1 =  s.ListOfEmployeeNameInStore("Suriya");

            //foreach (AssignRole a in list1)
            //{

            //    Console.WriteLine(a.EmployeeCode);
            //}
            //Console.WriteLine("Hello");
            //Console.ReadLine();


         List<AssignRole> e =   s.ListOfEmployeeNameInAssignRole("e");

            foreach (AssignRole e2 in e)
            {
                Console.WriteLine(e2.EmployeeCode);

            }

            Console.ReadLine();
        }

    }
}
