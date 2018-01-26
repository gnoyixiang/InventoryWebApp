using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
using InventoryWebApp.Controllers;
using System.Collections;

namespace ConsoleTestApp
{
    class TestEmployeeDAO
    {

        //public static void Main()
        //{

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

            //This method will seacrch and return a list of Employee based on the employeeName
            //List<Employee> empNameList = edao.SearchByEmployeeName("Zh");

            //foreach (Employee e in empNameList)
            //{
            //    Console.WriteLine(e.EmployeeName);

            //}

            //This method will return a list of Employee based on the employeCode.
            //List<Employee> empCodeList = edao.SearchByEmployeeCode("10001");

            //foreach (Employee e in empCodeList)
            //{
            //    Console.WriteLine(e.EmployeeName);

            //}

            //This method search employee who are present only in store department.
            //List<Employee> stlist = edao.SearchStoreEmployee("10017");

            //foreach (Employee e in stlist)
            //{
            //    Console.WriteLine(e.EmployeeName);

            //}
            //Console.ReadLine();


            //StoreSupervisorController s = new StoreSupervisorController();

            //ArrayList al = s.ListOfEmployeeNameInStore("Koh");

            //foreach (Employee a in al)
            //{
            //    Console.WriteLine(a.EmployeeName);
            //}

            //Console.ReadLine();

        //}


    }
}
