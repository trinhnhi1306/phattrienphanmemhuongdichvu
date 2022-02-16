using MiniStore.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniStore.WebAPI.Controllers
{
    public class UsersController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        private User ToJsonUser(User user)
        {
            if (user != null)
            {
                user.Address.Ward.Addresses.Clear();
                user.Address = null;
                user.Carts.Clear();
                user.Feedbacks.Clear();
                user.Orders.Clear();
                user.Permission.Users.Clear();
                user.Permission = null;
            }
            return user;
        }

        // GET: api/Users
        public User Get()
        {
            //return new ResultModel()
            //{
            //    Success = true,
            //    Message = "Tên đăng nhập hoặc mật khẩu không chính xác",
            //};
            return null;
        }

        // GET: api/Users/5
        public User Get(int id)
        {
            //User user = db.Users.Find(id);
            //if (user == null)
            //{
            //    return new ResultModel()
            //    {
            //        Success = true,
            //        Message = "Tên đăng nhập hoặc mật khẩu không chính xác",
            //    };
            //}
            //return new ResultModel()
            //{
            //    Success = true,
            //    Message = "Tìm thấy",
            //    Items = new List<object>() { ToJsonUser(user) }
            //};
            return null;
        }

        // POST: api/Users
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Users/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Users/5
        public void Delete(int id)
        {
        }
    }
}
