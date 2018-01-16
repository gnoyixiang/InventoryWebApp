﻿using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class CatagoryDAO 
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
            if( category != null)
            {
                category.CategoryName = c.CategoryName;
                return em.SaveChanges();
            }
            else
                return 0;
        }
        public int DeleteCategory(string categoryCode)
        {
            Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).FirstOrDefault();
            em.Categories.Remove(category);
            return em.SaveChanges();
        }
        public string GetCategory(string categoryCode)
        {
            Category category = em.Categories.Where(x => x.CategoryCode == categoryCode).ToList<Category>()[0];
            return category.CategoryCode;
        }
    }
}
