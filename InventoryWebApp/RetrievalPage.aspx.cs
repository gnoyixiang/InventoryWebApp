using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class RetrievalPage : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<RequestDetail> rdList = bl.getNotDisbursedRequestDetails();

        }
    }
}