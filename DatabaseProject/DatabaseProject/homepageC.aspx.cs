using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace DatabaseProject
{
    public partial class homepageC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addNumber(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("addPhoneNumbers.aspx", true);
        }

        protected void viewProducts(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("products.aspx", true);
        }

        protected void createWishlist(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("createWishlist.aspx", true);
        }

        protected void addCreditCard(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("addCard.aspx", true);
        }

        protected void addWishlist(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string serial = TextBox1.Text;
            string name = TextBox2.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@wishistname", name));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));

            //exec_proc
            bool flag = false;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception)
            {
                Response.Write("Wishlist name or product serial number incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void removeWishlist(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string serial = TextBox3.Text;
            string name = TextBox4.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("removefromWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@wishistname", name));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));

            //exec_proc
            bool flag = false;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception)
            {
                Response.Write("Wishlist name or product serial number incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void addCart(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string serial = TextBox5.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("addToCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));

            //exec_proc
            bool flag = false;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception)
            {
                Response.Write("Product already in cart or serial number is incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void removeCart(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string serial = TextBox7.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("removefromCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));

            //exec_proc
            bool flag = false;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception)
            {
                Response.Write("Product already in cart or serial number is incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void viewCart(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("cart.aspx", true);
        }

        protected void orderActions(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("orderActions.aspx", true);
        }
    }
}