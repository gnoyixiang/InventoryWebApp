using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models
{
    public class BusinessModelRequests
    {
        EntityModel em = new EntityModel();
        public List<Request> SearchRequest(string SearchParam, string SearchString)
        {

            using (em)
            {
                if (SearchParam == "RequestCode")
                {
                    return em.Requests.Where(b => b.RequestCode.ToUpper().Contains(SearchString.Trim().ToUpper())).ToList();
                }
                if (SearchParam == "Status")
                {
                    return em.Requests.Where(b => b.Status.ToUpper().Contains(SearchString.Trim().ToUpper())).ToList();
                }
                if (SearchParam == "DateCreated")
                {
                    return em.Requests.Where(b => b.DateCreated == Convert.ToDateTime(SearchString)).ToList();
                }
                return em.Requests.ToList();
            }
        }

    }


}