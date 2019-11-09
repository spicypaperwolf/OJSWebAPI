using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineJewelryShopping.service.Impl
{
    public class UserService: IUserService
    {
        OnlineJewelryShopDBEntities context = new OnlineJewelryShopDBEntities();
        public List<UserRegMst> FindAll()
        {
            List<UserRegMst> users = context.UserRegMsts.ToList(); 
            return users;
        }
    }
}