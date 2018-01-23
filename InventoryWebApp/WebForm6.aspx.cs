using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System.Collections.ObjectModel;

namespace InventoryWebApp
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        EntityModel em = new EntityModel();
        IUserDAO uDAO = new UserDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = "tom@ssis.edu.sg";
            
            Role role = uDAO.getRoleNameByUsername(username);
            Label1.Text = role.Name;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = "liong@logic.edu.sg";
            Role role = uDAO.getRoleNameByUsername(username);
            Role r = em.Roles.Where(x => x.Id == "ActHead").FirstOrDefault();
            em.Users.Where(x => x.UserName == username).FirstOrDefault<User>().Roles.Remove(role);
            em.SaveChanges();
            em.Users.Where(x => x.UserName == username).FirstOrDefault<User>().Roles.Add(r);
            em.SaveChanges();
            Role r1 = uDAO.getRoleNameByUsername(username);
            Label1.Text = r1.Name;

        }
    }
}