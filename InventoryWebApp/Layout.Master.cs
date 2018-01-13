using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["UserRole"] = "storeClerk";
            //Session["UserRole"] = "storeSupervisor";
            Session["UserRole"] = "employee";
            //Session["UserRole"] = "departmentHead";

            //Session["ChangeRole"] = "actingStoreSupervisor";
            //Session["ChangeRole"] = "actingDepartmentHead";
            //Session["ChangeRole"] = "departmentRep";
        }
    }
}