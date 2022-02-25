using MiniStore.WebAPI.Models;
using MiniStore.WebAPI.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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

        [HttpPost]
        [Route("login")]
        public JArray Login([FromBody] User loginUser)
        {
            List<User> data = new List<User>();
            User user = db.Users.FirstOrDefault(u => u.username == loginUser.username);
            if (user != null)
            {
                if (BCrypt.Net.BCrypt.Verify(loginUser.password, user.password))
                {
                    data.Add(user);
                }
            }
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
                { ContractResolver = IgnorePropertiesResolver.UserIgnoreProperites }));
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
    }
}
