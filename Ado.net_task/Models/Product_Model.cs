using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ado.net_task.Models
{
    public class Product_Model
    {
        [Required]
        public  int ProductId { get; set; }

        [Required]
       public string ProductName { get; set; }

        [Required]
      public  int CategoryId { get; set; }
        
            public MyListTable MyListTable { get; set; }
       
    }

    public class MyListTable
    {
        public SelectList DropDownList { get; set; }
        public int Key { get; set; }
        public string Display { get; set; }
    }

}