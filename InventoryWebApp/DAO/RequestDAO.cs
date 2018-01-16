using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models;

namespace InventoryWebApp.DAO
{
    interface RequestDAO
    {
        List<Request> findAllRequests();
        Request findRequest(string RequestCode);
        Request createRequest(Request Req);
        Request changeRequest(Request Req);
        void removeRequest(Request Req);
        Request findRequestByID(string RequestCode);

    }
}
