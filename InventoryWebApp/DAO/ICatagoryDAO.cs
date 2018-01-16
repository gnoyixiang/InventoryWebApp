using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ICatagoryDAO
    {
        int AddCategory(Category c);
        int DeleteCategory(string categoryCode);
        Category GetCategory(string categoryCode);
        List<Category> SearchByCategory(string keyword);
        int UpdateCategory(Category c);
    }
}