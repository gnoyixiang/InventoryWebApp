using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ITenderDetailsDAO
    {
        int addTenderDetail(TenderDetail tenderDetail);
        TenderDetail getTenderDetail(string tenderCode, string itemCode);
        List<TenderDetail> ListAllTenderDetails();
        List<TenderDetail> ListTendersByItemCode(string itemCode);
        List<TenderDetail> ListTendersByPrice(decimal price);
        List<TenderDetail> ListTendersByPrice(decimal startPrice, decimal endPrice);
        List<TenderDetail> ListTendersByTenderCode(string tenderCode);
        int updateTenderDetail(TenderDetail tenderDetail);
    }
}