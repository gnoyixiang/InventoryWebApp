using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Dept
{
    public partial class ViewDisbursement : System.Web.UI.Page
    {
        private static EmployeeController ec;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ec = new EmployeeController();
                lvDisbursement.DataSource = ec.ListDisbursementList().Where(r => r.DepartmentCode == this.Master.UserDepartmentCode).ToList();
                lvDisbursement.DataBind();
            }

        }

    }
}