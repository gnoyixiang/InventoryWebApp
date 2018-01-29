using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRetrievalDetailsDAO
    {
        void DeleteRetrievalDetails(RetrievalDetail rd);
        RetrievalDetail GetRetrievalDetails(string retrievalCode, string itemCode);
        List<RetrievalDetail> ListAllRetrievalDetails();
        List<RetrievalDetail> ListRetrievalDetailsByitemCode(string name);
        List<RetrievalDetail> ListRetrievalDetailsByRetrievalCode(string name);
        int UpdateRetrivalDetails(RetrievalDetail rd);
    }
}