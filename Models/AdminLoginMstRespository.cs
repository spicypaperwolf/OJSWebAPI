using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineJewelryShopping.Models
{
    public class AdminLoginMstRespository : IDisposable
    {
        // SECURITY_DBEntities it is your context class
        OnlineJewelryShopDBEntities context = new OnlineJewelryShopDBEntities();
        //This method is used to check and validate the user credentials
        public AdminLoginMst ValidateAdmin(string username, string password)
        {
            return context.AdminLoginMsts.FirstOrDefault(user =>
            user.username.Equals(username, StringComparison.OrdinalIgnoreCase)
            && user.password == password);
        }
        public void Dispose()
        {
            context.Dispose();
        }
    }
}