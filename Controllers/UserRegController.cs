using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace OnlineJewelryShopping.Controllers
{
    public class UserRegController : ApiController
    {
        OnlineJewelryShopDBEntities db = new OnlineJewelryShopDBEntities();

        public IQueryable<UserRegMst> GetUserReg()
        {
            return db.UserRegMsts;
        }

        [ResponseType(typeof(UserRegMst))]
        public IHttpActionResult GetUserRegById(string id)
        {
            UserRegMst u = db.UserRegMsts.Find(id);
            if (u == null)
            {
                return NotFound();
            }
            return Ok(u);
        }
    }
}
