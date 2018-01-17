using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{
    public class CategoryDAO : ICategoryDAO
    {
        EntityModel em = new EntityModel();
        public List<Category> SearchByCategory(string keyword)
        {
            return em.Categories.Where(x => x.CategoryCode.Contains(keyword)).ToList();
        }
        public int AddCategory(Category c)
        {
            try
            {
                em.Categories.Add(c);
                return em.SaveChanges();
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        public int UpdateCategory(Category c)
        {
            Category category = em.Categories.Where(x => x.CategoryCode == c.CategoryCode).FirstOrDefault();
            if (category != null)
            {
                category.CategoryName = c.CategoryName;
                return em.SaveChanges();
            }
            else
                return 0;
        }
        public void DeleteCategory(string categoryCode)
        {
            Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).FirstOrDefault();
            em.Categories.Remove(category);
            em.SaveChanges();
        }
        public Category GetCategory(string categoryCode)
        {
            Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).ToList<Category>()[0];
            return category;
        }
    }
}