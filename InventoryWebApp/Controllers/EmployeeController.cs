using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        IDisbursementDetailsDAO IdbmDetails = new DisbursementDetailsDAO();
        IDisbursementDAO Idbm = new DisbursementDAO();
        public List<DisbursementDetail> ListAllDisbursementDetails()
        {
            return IdbmDetails.ListAllDisbursementDetails();
        }

        public List<Disbursement> ListAllDisbursement()
        {
            return Idbm.GetAllDisbursement();
        }
    }
}