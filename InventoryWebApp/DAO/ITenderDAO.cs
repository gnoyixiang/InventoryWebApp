using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ITenderDAO
    {
        int AddTender(Tender tender);
        Tender getTender(string tenderCode);
        List<Tender> ListAllTenders();
        List<Tender> ListTendersByDateCreated(DateTime startDate, DateTime endDate);
        List<Tender> ListTendersByDateCreated(DateTime dateCreated);
        List<Tender> ListTendersBySupplierCode(string supplierCode);
        List<Tender> ListTendersByUsername(string username);
        int UpdateTender(Tender tender);
        
    }
}