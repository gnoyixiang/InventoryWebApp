﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models.Entities
{
   
        public static class Util
        {
            public static void EnsureStaticReference<T>()
            {
                var dummy = typeof(T);
                if (dummy == null)
                    throw new Exception("This code is used to ensure that the compiler will include assembly");
            }
        }
    
}