using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ITenderDetailsDAO
    {
        int addTenderDetail(TenderDetail tenderDetail);
        TenderDetail getTenderDetail(string tenderCode, string itemCode);
        List<TenderDetail> ListAllTenderDetails();
        List<TenderDetail> ListTenderDetailsByItemCode(string itemCode);
        List<TenderDetail> ListTenderDetailsByPrice(decimal price);
        List<TenderDetail> ListTenderDetailsByPrice(decimal startPrice, decimal endPrice);
        List<TenderDetail> ListTenderDetailsByTenderCode(string tenderCode);
        int updateTenderDetail(TenderDetail tenderDetail);
    }
}