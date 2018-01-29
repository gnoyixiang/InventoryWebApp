using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using System.Collections.Generic;

namespace InventoryWebApp.DAO
{
    public interface ICategoryDAO
    {
        int AddCategory(Category c);
        void DeleteCategory(string categoryCode);
        Category GetCategory(string categoryCode);
        List<Category> SearchByCategory(string keyword);
        int UpdateCategory(Category c);
        List<string> ListAllCategoryCode();
    }
}