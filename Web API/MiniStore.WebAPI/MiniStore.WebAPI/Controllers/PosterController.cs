using MiniStore.WebAPI.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/posters")]
    public class PosterController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        [HttpGet]
        [Route("")]
        public JArray GetPosters()
        {
            List<Poster> data = db.Posters.Where(p => p.isActive == true).ToList();
            return JArray.Parse(JsonConvert.SerializeObject(data));
        }
    }
}
