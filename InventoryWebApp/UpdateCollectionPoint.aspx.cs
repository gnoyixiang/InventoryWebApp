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
        EntityModel SSIS = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            CollectionPointController cpl = new CollectionPointController();
            if (!IsPostBack)
            {
                ddlCP.DataSource = cpl.CollectionPoint();
                ddlCP.DataTextField = "CollectionVenue";
                ddlCP.DataValueField = "CollectionPointCode";
                ddlCP.DataBind();
            }
        }
    }
}