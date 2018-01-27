using InventoryWebApp.DAO;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        IRequestDAO Ir = new RequestDAO();
        IRequestDetailsDAO Ird = new RequestDetailsDAO();
        ICollectionPointDAO Icp = new CollectionPointDAO();
        IDepartmentDAO Idpt = new DepartmentDAO();
        IDisbursementDAO Idbm = new DisbursementDAO();
        IEmployeeDAO Iempl = new EmployeeDAO();
        IDisbursementDetailsDAO IdbmDetails = new DisbursementDetailsDAO();


        public List<Disbursement> ListAllDisbursement()
        {
            return Idbm.ListAllDisbursement();
        }
        public List<DisbursementDetail> DisbursementDetails(string disbrusementCode)
        {
            return IdbmDetails.GetDisbursementDetails(disbrusementCode);
        }
        public int UpdateDisbursement(Disbursement d)
        {
            return Idbm.UpdateDbmStatus(d);
        }
         public Disbursement GetDisbursementCode(string disbursementCode)
         {
             return Idbm.GetDisbursementByCode(disbursementCode);
         }
        public Request GetRequestCode(string requestCode)
        {
            return Ir.GetRequest(requestCode);
        }
        public List<RequestDetail> ListRequestDetail(string requestCode)
        {
            return Ird.ListRequestDetail(requestCode);
        }
        public int UpdateRequestDetails(RequestDetail reDetails)
        {
            return Ird.UpdateRequestDetail(reDetails);
        }
        public int UpdateRequest(Request rq)
        {
            return Ir.UpdateRequest(rq);
        }
    }
}
 