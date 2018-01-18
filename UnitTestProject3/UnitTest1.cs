using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace UnitTestProject3
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            IDisbursementDAO disbursementDAO = new DisbursementDAO();
            DateTime dt = DateTime.ParseExact("2017-12-01", "yyyy-MM-dd", null);
            //Disbursement d = disbursementDAO.GetDisbursementByCode("DBM180101162312123");
            //Console.WriteLine(d.ToString());
            List<Disbursement> dList = disbursementDAO.SearchDbmByDateCreated(dt);
            foreach (Disbursement d in dList)
            {
                Console.WriteLine(d.ToString());
            }
            Console.ReadLine();

        }
    }
}
