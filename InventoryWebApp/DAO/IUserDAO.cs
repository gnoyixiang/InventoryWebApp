using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IUserDAO
    {
        Role getRoleNameByUsername(string username);
    }
}