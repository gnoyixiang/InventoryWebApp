using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InventoryWebApp
{
    public partial class PendingPO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridView1.DataSource = StoreSupervisorBusinessLogic.ListPendingOrders();
               // GridView1.DataBind();
            }

        }
    }
}