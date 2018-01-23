using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IUserDAO
    {
        Role getRoleNameByUsername(string username);
        User GetUserByUsername(string username);
        int UpdateUser(User user);
        //int UpdateUserRole(User user, Role role);
    }
}