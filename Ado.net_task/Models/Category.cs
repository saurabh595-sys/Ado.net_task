using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ado.net_task.Models
{
    public class Category
    {
        [Required]
     public int CategoryId { get; set; }

        [Required]
        public string CategoryName { get; set; }
    }
}