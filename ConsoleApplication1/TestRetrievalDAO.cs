using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
namespace ConsoleTestApp
{
    class TestRetrievalDAO
    {
        //static IRetrievalDAO re = new RetrievalDAO();
        //static IRetrievalDetailsDAO rd = new RetrievalDetailsDAO();
        //static DateTime now = DateTime.Now;
        //public static void Main(String[] args)
        //{
        //    Retrieval retrival = new Retrieval()
        //{
        //    RetrievalCode = "RE"+now.ToString("yyMMddHHmmssfff"),
        //    Status = "retrieving",
        //    Notes = "something",

        //};
        //RetrievalDetail rd1 = new RetrievalDetail()
        //{
        //    RetrievalCode = retrival.RetrievalCode,
        //    ItemCode = "C001",
        //    Quantity = 1

        //};
        //retrival.RetrievalDetails.Add(rd1);
        //var r = re.AddRetrieval(retrival);
        //Console.WriteLine(r);

        ////GetRetrieval with id
        //Retrieval r1 = re.GetRetrieval("RE180117112530712");
        //Console.WriteLine(r1.Notes);

        //    //ListAllRetrieval
        //    List<Retrieval> r2 = re.ListAllRetrieval();
        //    foreach (Retrieval re in r2)
        //    {
        //        Console.WriteLine(re.Notes);
        //    }


        //    //ListRetrievalByDate
        //    List<Retrieval> r3 = re.ListRetrievalByDate(new DateTime(2015, 02, 19));
        //    foreach (Retrieval re in r3)
        //    {
        //        Console.WriteLine(re.RetrievalCode);
        //    }


        //    //ListRetrivalByStatus
        //    List<Retrieval> r4 = re.ListRetrievalByStatus("retrieving");
        //    foreach (Retrieval re in r4)
        //    {
        //        Console.WriteLine(re.RetrievalCode);
        //    }

        //    //UpdateRetrieval
        //    Retrieval retrival1 = new Retrieval()
        //    {
        //        RetrievalCode = "RE180117112530712",
        //        Status = "retrieving",
        //        Notes = "bb",

        //    };
        //    re.UpdateRetrival(retrival1);

        //    //GetRetrievalDetails
        //    RetrievalDetail rde = rd.GetRetrievalDetails("RE180117112530712", "C001");
        //    Console.WriteLine(rde.Quantity);

        //    //ListRetrievalDetailsByitemCode
        //    List<RetrievalDetail> rde1 = rd.ListRetrievalDetailsByitemCode("C001");
        //    foreach (RetrievalDetail rd in rde1)
        //    {
        //        Console.WriteLine(rd.RetrievalCode);
        //    }

        //    //ListRetrievalDetailsByRetrievalCode
        //    List<RetrievalDetail> rde2 = rd.ListRetrievalDetailsByRetrievalCode("RE180117112530712");
        //    foreach (RetrievalDetail rd in rde2)
        //    {
        //        Console.WriteLine(rd.ItemCode);
        //    }

        //    //UpdateRetrievalDetail
        //    RetrievalDetail rd3 = new RetrievalDetail()
        //    {
        //        RetrievalCode = "RE180117112530712",
        //        ItemCode = "C001",
        //        Quantity = 100

        //    };
        //    rd.UpdateRetrivalDetails(rd3);


        //}
}
    }
