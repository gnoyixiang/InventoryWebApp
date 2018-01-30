using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class CatagoryDAO : ICatagoryDAO
    {
        public List<Category> SearchByCategory(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Categories.Where(x => x.CategoryCode.Contains(keyword)).ToList();
            }
        }
        public List<Category> ListAllCategory()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Categories.ToList();
            }
        }
        public int AddCategory(Category c)
        {
            using (EntityModel em = new EntityModel())
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
        }
        public int UpdateCategory(Category c)
        {
            using (EntityModel em = new EntityModel())
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
        }
        public void DeleteCategory(string categoryCode)
        {
            using (EntityModel em = new EntityModel())
            {
                Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).FirstOrDefault();
                em.Categories.Remove(category);
                em.SaveChanges();
            }
        }
        public Category GetCategory(string categoryCode)
        {
            using (EntityModel em = new EntityModel())
            {
                Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).ToList<Category>()[0];
                return category;
            }
        }
    }
}
