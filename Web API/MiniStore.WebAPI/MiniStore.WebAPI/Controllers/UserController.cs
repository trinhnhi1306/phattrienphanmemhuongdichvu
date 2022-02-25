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
    public class UserController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

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
