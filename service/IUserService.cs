using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineJewelryShopping.service
{
    public interface IUserService
    {
        List<UserRegMst> FindAll();
    }
}