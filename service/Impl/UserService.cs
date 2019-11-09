using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace OnlineJewelryShopping.service.Impl
{
    public class UserService: IUserService
    {
        OnlineJewelryShopDBEntities context = new OnlineJewelryShopDBEntities();

        public string addUser(UserRegMst userRegMst)
        {
            try
            {
                userRegMst.cdate = DateTime.Now;
                context.UserRegMsts.Add(userRegMst);
                context.SaveChanges();
                return "Add Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public List<UserRegMst> FindAll()
        {
            List<UserRegMst> users = context.UserRegMsts.ToList(); 
            return users;
        }

        public string updateUser(UserRegMst userRegMst)
        {
            try
            {
                context.Entry(userRegMst).State = EntityState.Modified;
                context.SaveChanges();
                return "update success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
           
        }
    }
}