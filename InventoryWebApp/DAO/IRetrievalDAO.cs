using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRetrievalDAO
    {
        int AddRetrieval(Retrieval r);
        void DeleteRetrieval(string retrievalCode);
        Retrieval GetRetrieval(string retrievalCode);
        List<Retrieval> ListAllRetrieval();
        List<Retrieval> ListRetrievalByDate(DateTime name);
        List<Retrieval> ListRetrievalByStatus(string name);
        int UpdateRetrival(Retrieval r);
    }
}