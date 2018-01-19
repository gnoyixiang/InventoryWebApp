using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestAdjustmentDAO
    {
        private static IAdjustmentDAO adjDAO = new AdjustmentDAO();
        public static void Main(String[] args)
        {
            DateTime now = DateTime.Now;
            Adjustment adj1 = new Adjustment();
            adj1.AdjustmentCode = "ALPA" + now.ToString("yyMMddHHmmssfff");
            adj1.ItemCode = "C001";
            adj1.AdjustmentQuant = 25;
            adj1.DateCreated = now;
            //adj1.DateApproved = now;
            adj1.Status = "PENDING";
            adj1.Notes = "Test1";
            adj1.Reason = "broken";
            //adj1.HeadRemarks = "ALPA";
            adj1.UserName = "yixiang@ssis.edu.sg";
            //adj1.ApprovedBy = now;

            AddAdjustment(adj1);
            ListAllAdjustments();
        }
        private static List<Adjustment> ListAllAdjustments()
        {
            List<Adjustment> adjList = adjDAO.ListAllAdjustments();
            foreach (Adjustment a in adjList)
            {
                Console.WriteLine(a.AdjustmentCode);
            }
            return adjList;
        }
        private static List<Adjustment> SearchAdjustmentByStatus(String b)
        {
            List<Adjustment> c = new List<Adjustment>();
            c = adjDAO.SearchAdjustmentByStatus(b);
            return c;
        }
        private static int AddAdjustment(Adjustment adj)
        {
            Console.WriteLine("Adding adjustment id: " + adj.AdjustmentCode);
            int a = adjDAO.AddAdjustment(adj);
            return a;
        }
        private static int UpdateAdjustment(Adjustment c)
        {
            int a = UpdateAdjustment(c);
            return a;
        }
        private static int UpdateAdjustment(string adjustmentCode, int adjustmentQuant, string reason)
        {
            int a = UpdateAdjustment(adjustmentCode, adjustmentQuant, reason);
            return a;
        }
        private static int ApproveAdjustment(string adjustmentCode, string headRemarks)
        {
            int a = ApproveAdjustment(adjustmentCode, headRemarks);
            return a;
        }

    }
}


