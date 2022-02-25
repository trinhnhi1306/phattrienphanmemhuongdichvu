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

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/feedbacks")]
    public class FeedbackController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        [HttpGet]
        [Route("")]
        public JArray GetFeedbacksByProductId(int productId)
        {
            List<Feedback> data;
            Product product = db.Products.Find(productId);
            if (product != null)
            {
                data = product.Feedbacks.ToList();
            }
            else
            {
                data = new List<Feedback>();
            }
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
            { ContractResolver = IgnorePropertiesResolver.FeedbackIgnoreProperites }));
        }
    }
}
