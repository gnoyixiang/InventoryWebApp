using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.WCF;
using InventoryWebApp.Controllers;

namespace ConsoleTestApp
{
    class Program
    {
        public static void Main(String[] args)
        {
            //DepartmentService d = new DepartmentService();
            //WCFRequest req = new WCFRequest();
            //DepartmentHeadController d1 = new DepartmentHeadController();

            //req.RequestCode = "RQ123456791";
            //req.Status = "processing";
            //req.ApprovedBy = "liong@logic.edu.sg";
            //req.HeadRemark = "testing";
            //// DateApproved = DateTime.Now


            //d.Update(req);

            // Console.WriteLine(DateTime.Now.Date);
            // string sdate = DateTime.Now.ToString("dd/MM/yyyy");

            //// DateTime s2 = Convert.ToDateTime(sdate);


            // string iDate = "2005-05-05";
            // DateTime oDate = DateTime.Parse(iDate);

            // // DateTime d = new DateTime();
            // Console.WriteLine(oDate);

            // Console.ReadLine();

            // //List<RequestDetail> rdlist =    d1.ListRequestDetail("RQ123456790");

            // //foreach (RequestDetail rd in rdlist)
            // //{
            // //    Console.WriteLine(rd.RequestCode);
            // //}
            // Console.ReadLine();

            //IEmployeeService s = new EmployeeService();
            //WCF_Disbursement d = new WCF_Disbursement();
            //d.DisbursementCode="DBM1801230808388890";
            //d.RepName = "derek@logic.edu.sg";
            //d.Status = "completed";
            //s.UpdateDisbursement(d);
        } 
    }
}
