using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace OnlineJewelryShopping.Controllers
{
    public class AdminLoginController : ApiController
    {
        OnlineJewelryShopDBEntities context = new OnlineJewelryShopDBEntities();
        [AllowAnonymous]
        [Route("api/get/all")]
        public IEnumerable<ItemMst> GetUserReg()
        {
            return context.ItemMsts.ToList();
        }

        //This resource is For admin
        [Authorize]
        [HttpGet]
        [Route("api/test/admin")]
        public IHttpActionResult Admin()
        {
            var identity = (ClaimsIdentity)User.Identity;
            return Ok("Hello: " + identity.Name);
        }
    }
}
