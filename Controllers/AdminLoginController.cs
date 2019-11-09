using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Security.Claims;

namespace OnlineJewelryShopping.Controllers
{
    public class AdminLoginController : ApiController
    {
        [AllowAnonymous]
        [Route("api/get/all")]
        public IHttpActionResult Get()
        {
            return Ok("Server time is " + DateTime.Now.ToString());
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
