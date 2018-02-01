using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRoleDAO
    {
        int AddRole(string id, string name);
        void DeleteRole(string id);
        string GetRoleName(string id);
        List<Role> ListRole();

        Role GetRoleInfo(string roleid);
        int UpdateRole(string id, string name);
        List<Role> ListAllDepartmentRole();
    }
}