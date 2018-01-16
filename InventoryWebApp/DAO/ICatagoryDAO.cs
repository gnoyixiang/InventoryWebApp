using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ICatagoryDAO
    {
        int AddCategory(Category c);
        void DeleteCategory(string categoryCode);
        Category GetCategory(string categoryCode);
        List<Category> SearchByCategory(string keyword);
        int UpdateCategory(Category c);
    }
}