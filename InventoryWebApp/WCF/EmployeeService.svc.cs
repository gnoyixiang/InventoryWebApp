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
                wcfDisbursement.Add(new WCF_Disbursement(d.DisbursementCode, d.Department.DepartmentName, d.Status));
            }
            return wcfDisbursement;
        }
        public List<WCF_DisbursementDetails> ListAllDisbursementDetails()
        {
            List<WCF_DisbursementDetails> wcfdisDetails = new List<WCF_DisbursementDetails>();
            List<DisbursementDetail> dlistDetails = ec.ListAllDisbursementDetails();
            foreach (DisbursementDetail db in dlistDetails)
            {
                wcfdisDetails.Add(new WCF_DisbursementDetails(db.DisbursementCode, db.StationeryCatalogue.Description, Convert.ToInt32(db.ActualQuantity), 
                    db.Disbursement.CollectionPoint.CollectionVenue,
                    db.Disbursement.UserName, db.Disbursement.Status));
            }
            return wcfdisDetails;
        }
        public void UpdateDisbursement(WCF_Disbursement wcfDisbursement)
        {
            
        }
    }
}
