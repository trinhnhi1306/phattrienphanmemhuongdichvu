using MiniStore.WebAPI.Models;
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
        public IEnumerable<Poster> GetPosters()
        {
            return db.Posters.Where(p => p.isActive == true);
        }
    }
}
