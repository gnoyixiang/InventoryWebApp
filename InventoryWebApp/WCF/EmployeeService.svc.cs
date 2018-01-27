using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "EmployeeService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select EmployeeService.svc or EmployeeService.svc.cs at the Solution Explorer and start debugging.
    public class EmployeeService : IEmployeeService
    {
        EmployeeController ec = new EmployeeController();

        public List<WCF_Disbursement> ListAllDisbursement()
        {
            List<WCF_Disbursement> wcfDisbursement = new List<WCF_Disbursement>();
            List<Disbursement> dlist = ec.ListAllDisbursement();
            foreach (Disbursement d in dlist)
            {
                if (d.Status == "disbursing")
                {
                    string deptName = ec.GetDeptNameByCode(d.DepartmentCode);
                    wcfDisbursement.Add(new WCF_Disbursement(d.DisbursementCode, deptName, d.Status, d.UserName));
                }
            }
            return wcfDisbursement;
        }
        public List<WCF_DisbursementDetails> DisbursementDetails(string disbursementCode)
        {
            List<DisbursementDetail> dDetailslist = ec.DisbursementDetails(disbursementCode);
            List<WCF_DisbursementDetails> wcfDisbursementDetails = new List<WCF_DisbursementDetails>();
            foreach (DisbursementDetail db in dDetailslist)
            {
                var stationery = ec.GetStationery(db.ItemCode);
                var disbursCode = ec.GetDisbursementCode(db.DisbursementCode);
                string deptName = ec.GetDeptNameByCode(disbursCode.DepartmentCode);
                var collectionVenue = ec.GetCollectionPoint(deptName);
                string userName = ec.GetEmployeeNameByUserName(disbursCode.UserName);
                wcfDisbursementDetails.Add(new WCF_DisbursementDetails(db.DisbursementCode, stationery.Description,
                    Convert.ToString(db.ActualQuantity), Convert.ToString(db.Quantity),
                    collectionVenue, deptName, userName, disbursCode.Status));
            }
            return wcfDisbursementDetails;
            // Convert.ToString(db.Disbursement.CollectionPoint.CollectionTime)
        }
        public void UpdateDisbursement(WCF_Disbursement wcfDisbursement)
        {
            // Check valid disbursement
            if (wcfDisbursement != null && !string.IsNullOrEmpty(wcfDisbursement.DisbursementCode)
                 && !string.IsNullOrEmpty(wcfDisbursement.Status)
                  && !string.IsNullOrEmpty(wcfDisbursement.RepName))
            {
                Disbursement d = ec.GetDisbursementCode(wcfDisbursement.DisbursementCode);
                //Update disbursement status
                if (d != null)
                {
                    d.DisbursementCode = wcfDisbursement.DisbursementCode;
                    d.Status = wcfDisbursement.Status;
                    d.ReceivedBy = wcfDisbursement.RepName;
                    d.DateDisbursed = DateTime.Now;
                    ec.UpdateDisbursement(d);
                }
                // Update item status in the request details table
                List<DisbursementDetail> db = ec.DisbursementDetails(wcfDisbursement.DisbursementCode);
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
                // Update the request status in the request table
                foreach (DisbursementDetail disburseDetails in db)
                {
                    Request request = ec.GetRequestCode(disburseDetails.RequestCode);
                    List<RequestDetail> rqList = ec.ListRequestDetail(request.RequestCode);
                    var imcompletedRequestDetails = rqList.Where(x => !x.Status.
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
}
