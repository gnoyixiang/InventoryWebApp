using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ChangeCollectionPoint : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCP.DataSource = ec.DdlCollectionPoint();
                ddlCP.DataTextField = "CollectionVenue";
                ddlCP.DataValueField = "CollectionPointCode";
                ddlCP.DataBind();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show');", true);
                if (!String.IsNullOrEmpty(tbxCCP.Text) && ddlCP.SelectedItem.Selected)
                {
                    //TODO: change department code
                    ec.UpdateCollectionPoint("CPSC", ddlCP.SelectedValue);
                }
            }
        }
    }
}