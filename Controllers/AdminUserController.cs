using Newtonsoft.Json.Linq;
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
        [Authorize]
        [Route("api/admin/user")]
        public IEnumerable<UserRegMst> GetAllUser()
        {
            return userService.FindAll();
        }
        [HttpPut]
        [Authorize]
        [Route("api/admin/user/update")]
        public IHttpActionResult UpdateUser([FromBody]UserRegMst data)
        {
            return Ok(userService.updateUser(data));
        }
        [HttpPost]
        [Authorize]
        [Route("api/admin/user/add")]
        public IHttpActionResult AddUser([FromBody]UserRegMst data)
        {
            return Ok(userService.addUser(data));
        }
    }
}
