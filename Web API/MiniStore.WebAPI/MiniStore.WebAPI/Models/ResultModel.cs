using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniStore.WebAPI.Models
{
    public class ResultModel
    {
        public String Message { get; set; }
        public User Item { get; set; }
    }
}