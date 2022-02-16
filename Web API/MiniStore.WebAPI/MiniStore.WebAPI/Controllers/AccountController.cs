using MiniStore.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/account")]
    public class AccountController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        private User ToJsonUser(User user)
        {
            user.Address = null;
            user.Carts = null;
            user.Feedbacks = null;
            user.Orders = null;
            user.Permission = null;
            return user;
        }

        [HttpPost]
        [Route("login")]
        public User Login([FromBody] User tmp)
        {
            User user = db.Users.FirstOrDefault(u => u.username == tmp.username);
            if (user == null)
            {
                return new User();
            }
            if (BCrypt.Net.BCrypt.Verify(tmp.password, user.password))
            {
                return ToJsonUser(user);
            }
            return new User();
        }

        [HttpPost]
        [Route("signup")]
        public string SignUp([FromBody] User user)
        {
            if (db.Users.Any(u => u.username == user.username))
            {
                return "Tên đăng nhập đã tồn tại!";
            }
            if (db.Users.Any(u => u.email == user.email))
            {
                return "Email này đã được dùng để đăng ký tài khoản!";
            }

            user.password = BCrypt.Net.BCrypt.HashPassword(user.password);
            user.created_at = DateTime.Now;
            user.permission_id = 1;
            user.status = true;
            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        // PUT: api/Login/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Login/5
        public void Delete(int id)
        {
        }


    }
}
