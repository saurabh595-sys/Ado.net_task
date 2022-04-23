using Ado.net_task.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using static Ado.net_task.Models.Product_Model;

namespace Ado.net_task.Controllers
{
    public class HomeController : Controller
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);


       
        public async Task<ActionResult> Index( int Pg= 1)//product index
        {
          
            if (Pg < 1)
            {
                Pg = 1;
            }
            List<Product_Model> product_Model = new List<Product_Model>();

            SqlCommand comm = new SqlCommand("selectProduct", con);
            int PageSize = 10;
            SqlCommand com = new SqlCommand("spGetRowsPerPage", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@PageNumber", Pg);
            com.Parameters.AddWithValue("@PageSize", PageSize);

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dtuser = new DataTable();

            SqlDataAdapter dadapter = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            dadapter.Fill(dt);

            da.Fill(dtuser);
            int rescount = dt.Rows.Count;
            var pager = new Pager(rescount, Pg, PageSize);


            await con.OpenAsync();
            
            

            foreach (DataRow dr in dtuser.Rows)
            {
                product_Model.Add(new Product_Model
                {
                    ProductId = Convert.ToInt32(dr["ProductId"]),
                    ProductName = dr["ProductName"].ToString(),
                    CategoryId = Convert.ToInt32(dr["CategoryId"]),
                });



            }
            con.Close();
            var data = product_Model;
            this.ViewBag.pager = pager;


            //var datalist =Db.Product_Model().ToList();
            return View(data);

        }

        public async Task <ActionResult> CategoryIndex()//category index
        {
            List<Category> Category = new List<Category>();

            SqlCommand com = new SqlCommand("selectcatogry", con);
            
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dtuser = new DataTable();
           await con.OpenAsync(); 
            da.Fill(dtuser);
            con.Close();

            foreach (DataRow dr in dtuser.Rows)
            {
                Category.Add(new Category
                {
                    CategoryId = Convert.ToInt32(dr["CategoryId"]),
                    CategoryName = dr["CategoryName"].ToString(),

                });



            }


            var datalist= Category.ToList();


            //var datalist =  Db.Categories();
            return View(datalist);

        }

        public async Task<ActionResult> Create()//product Insert
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            var list = new List<MyListTable>();
            SqlCommand com = new SqlCommand("selectcatogry", con);

            com.CommandType = CommandType.StoredProcedure;
            await con.OpenAsync();
            SqlDataReader rdr =  com.ExecuteReader();

            while (rdr.Read())
            {
                list.Add(new MyListTable
                {
                    Key = rdr.GetInt32(0),
                    Display = rdr.GetString(1)
                });
            }


            ViewBag.dataList = new SelectList(list, "Key", "Display");

            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Create(  Product_Model p)//product insert
        {
            SqlCommand com = new SqlCommand("AddProd", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@productId", p.ProductId);
            com.Parameters.AddWithValue("@ProductName", p.ProductName);
            com.Parameters.AddWithValue("@CategoryId", p.MyListTable.Key);

           await con.OpenAsync();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index");
            }


  

        }

        public async Task<ActionResult> Edit(int id)//edit product
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            var list = new List<MyListTable>();
            SqlCommand com = new SqlCommand("selectcatogry", con);

            com.CommandType = CommandType.StoredProcedure;
            await con.OpenAsync();
            SqlDataReader rdrd =await com.ExecuteReaderAsync();

            while (rdrd.Read())
            {
                list.Add(new MyListTable
                {
                    Key = rdrd.GetInt32(0),
                    Display = rdrd.GetString(1)
                });
            }
            con.Close();

            ViewBag.dataList = new SelectList(list, "Key", "Display");

            Product_Model p = new Product_Model();

            SqlCommand comm = new SqlCommand("selectProductWhere", con);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@productId", id);
            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable dtuser = new DataTable();
            con.Open();
            da.Fill(dtuser);
            con.Close();

            foreach (DataRow dr in dtuser.Rows)
            {
                p.ProductId = Convert.ToInt32(dr["productId"]);
                p.ProductName = dr["ProductName"].ToString();
                p.CategoryId = Convert.ToInt32(dr["CategoryId"]);
                
            }
           
            return View(p);
           
        }
        [HttpPost]
        public async Task<ActionResult> Edit( Product_Model p, int id)// edit product
        {
            

            SqlCommand com = new SqlCommand("EditProduct", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductId", id);
            com.Parameters.AddWithValue("@ProductName", p.ProductName);
            com.Parameters.AddWithValue("@CategoryId", p.MyListTable.Key);

            con.Open();
            int i =await com.ExecuteNonQueryAsync();
            if (i == 1)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index");
            }


        }


        public ActionResult Create_cat()//cat insert
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Create_cat(Category c)//cat insert
        {
            
            SqlCommand com = new SqlCommand("AddCat", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", c.CategoryId);
            com.Parameters.AddWithValue("@CategoryName", c.CategoryName);


            con.Open();
            int i = await com.ExecuteNonQueryAsync();
            con.Close();
            if (i == 1)
            {
                return RedirectToAction("CategoryIndex");
            }
            else
            {
                return RedirectToAction("CategoryIndex");
            }

      

        }


        public async Task<ActionResult>CatEdit( int id)//edit cat
        {
            Category c = new Category();

            SqlCommand com = new SqlCommand("selectCatWhere", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", id);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dtuser = new DataTable();
           await con.OpenAsync();
            da.Fill(dtuser);
            con.Close();

            foreach (DataRow dr in dtuser.Rows)
            {

                c.CategoryName = dr["CategoryName"].ToString();

            }

            return View(c);
        }
        [HttpPost]
        public async Task<ActionResult> CatEdit( Category c, int id)// edit cat
        {
            SqlCommand com = new SqlCommand("EditCat", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", id);
            com.Parameters.AddWithValue("@CategoryName", c.CategoryName);

           await con.OpenAsync();
            int i = await com.ExecuteNonQueryAsync();
            if (i == 1)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index");
            }

         


        }


        public async Task<ActionResult> Delete(int id)
        {
            //List<Product_Model> getalldatalist1 = new List<Product_Model>();
            Product_Model p = new Product_Model();
            SqlCommand com = new SqlCommand("selectProductWhere", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@productId", id);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dtuser = new DataTable();
            await con.OpenAsync();
            da.Fill(dtuser);
            con.Close();

            foreach (DataRow dr in dtuser.Rows)
            {

                p.ProductId = Convert.ToInt32(dr["productId"]);
                p.ProductName = dr["ProductName"].ToString();
                p.CategoryId = Convert.ToInt32(dr["CategoryId"]);

               

            }


          

            return View(p);

        }//product delete
        [HttpPost]
        public async Task<ActionResult>Delete(int id, Product_Model p)
        {
            SqlCommand com = new SqlCommand("ProductDelete", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@productId", id);

           await con.OpenAsync();
            int i =await com.ExecuteNonQueryAsync();
            if (i == 1)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index");
            }


            


        }//product delete

        public async Task<ActionResult> CatDelete(int id)//cat delete
        {
            Category c = new Category();

            SqlCommand com = new SqlCommand("selectCatWhere", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", id);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dtuser = new DataTable();
           await con.OpenAsync();
            da.Fill(dtuser);
            con.Close();

            foreach (DataRow dr in dtuser.Rows)
            {

                c.CategoryName = dr["CategoryName"].ToString();

             }

            


            return View(c);

        }
        [HttpPost]
        public async Task<ActionResult> CatDelete(int id, Category c)//cat delete
        {
            


            SqlCommand com = new SqlCommand("CatDelete", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@CategoryId", id);

            await con.OpenAsync();
            int i = com.ExecuteNonQuery();
            if (i == 1)
            {
                return RedirectToAction("CategoryIndex");
            }
            else
            {
                return RedirectToAction("CategoryIndex");
            }

            

      

        }


    }
}