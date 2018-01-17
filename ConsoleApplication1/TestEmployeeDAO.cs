using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
namespace ConsoleTestApp
{
    class TestEmployeeDAO
    {

        public static void Main()
        {

            //EmployeeDAOTest
            IEmployeeDAO edao = new EmployeeDAO();

            /*Employee e = new Employee();
            e.EmployeeCode = "10037";
            e.UserName = "empl4@logic.edu.sg";
            Console.WriteLine(edao.AddEmployee(e));*/

            //edao.DeleteEmployee("empl4@logic.edu.sg");

            /*Employee e=edao.GetEmployeeInfo("amit");
            Console.WriteLine(e.UserName);*/

            //Console.WriteLine(edao.UpdateRole("tracy@logic.edu.sg", "Head"));

            /*List<Employee> elist = edao.ListEmployee();
            foreach(Employee e in elist)
            {
                Console.WriteLine(e.UserName);
            }*/

            //Console.WriteLine(edao.GetEmployeeName("tracy@logic.edu.sg"));

            /*List<Employee> elist = edao.SearchByRole("Head");
            foreach (Employee e in elist)
            {
                Console.WriteLine(e.UserName);
            }*/

            /*List<Employee> elist = edao.SearchByDept("ISS1");
            foreach (Employee e in elist)
            {
                Console.WriteLine(e.UserName);
            }*/

            /*List<string> slist = edao.ListEmpName("ISS1","Empl");
            foreach(string s in slist)         
            {
               Console.WriteLine(s);
            }*/












        }


    }
}
