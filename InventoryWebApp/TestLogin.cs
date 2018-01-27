using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace InventoryWebApp
{
    public class TestLogin:ApplicationSignInManager
    {
        public TestLogin(ApplicationUserManager userManager, IAuthenticationManager authenticationManager) : base(userManager, authenticationManager)
        {
        }

        public  void m1()
        {
            
            SignInManagerExtensions.PasswordSignIn( this, userName:"mengkiak@ssis.edu.sg", password:"!Passw0rd", isPersistent:false, shouldLockout: false);
        }

        
    }
}