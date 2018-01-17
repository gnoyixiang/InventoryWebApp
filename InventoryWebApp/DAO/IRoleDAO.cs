using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRoleDAO
    {
        int AddRole(string id, string name);
        void DeleteRole(string id);
        List<Role> ListRole();
        int UpdateRole(string id, string name);
    }
}