using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestUpdateDisbursement
    {

        public static void Main(string[] args)
        {
            EmployeeController ec = new EmployeeController();
            Disbursement d = ec.GetDisbursementCode("DC001");

            if (d != null)
            {
                d.ReceivedBy = "yufei@logic.edu.sg";
                d.DateDisbursed = DateTime.Now;
                d.Status = "completed";
                d.Notes = "";
                ec.UpdateDisbursement(d);
            }
            List<DisbursementDetail> db = ec.DisbursementDetails("DC001");
            foreach (DisbursementDetail disDetails in db)
            {
                Request request = ec.GetRequestCode(disDetails.RequestCode);

                List<RequestDetail> requestDetails = ec.ListRequestDetail(request.RequestCode);

                foreach (RequestDetail rqDetails in requestDetails)
                {
                    if (rqDetails.ItemCode == disDetails.ItemCode)
                    {
                        if (rqDetails.RemainingQuant - disDetails.ActualQuantity == 0)
                        {
                            rqDetails.Status = "completed";
                            rqDetails.RemainingQuant = 0;
                        }
                        else
                        {
                            rqDetails.Status = "incompleted";
                            rqDetails.RemainingQuant -= disDetails.ActualQuantity;
                        }
                        ec.UpdateRequestDetails(rqDetails);
                    }
                }
            }
            foreach (DisbursementDetail disburseDetails in db)
            {
                Request request = ec.GetRequestCode(disburseDetails.RequestCode);
                List<RequestDetail> requestDetails = ec.ListRequestDetail(request.RequestCode);

                var imcompletedRequestDetails = requestDetails.Where(x => !x.Status.
                                                    Equals("completed", StringComparison.InvariantCultureIgnoreCase));

                if (imcompletedRequestDetails != null &&
                    imcompletedRequestDetails.Any())
                {
                    request.Status = "incompleted";
                }
                else
                {
                    request.Status = "completed";
                }
                ec.UpdateRequest(request);
            }
        }
    }
}