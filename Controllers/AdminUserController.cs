using OnlineJewelryShopping.service.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OnlineJewelryShopping.Controllers
{
    public class AdminUserController : ApiController
    {
        UserService userService = new UserService();

        [HttpGet] 
        [Route("api/admin/user")]
        public IEnumerable<UserRegMst> GetAllUser()
        {
            return userService.FindAll();
        }
        [HttpGet]
        [Route("api/admin/user/update")]
        public IHttpActionResult UpdateUser()
        {
            return Ok("aaa  ");
        }
    }
}
