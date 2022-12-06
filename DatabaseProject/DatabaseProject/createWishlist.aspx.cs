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
    public partial class createWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string wishlist_name = TextBox1.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("createWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@name", wishlist_name));

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
                Response.Write("Wishlist already exists!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }
    }
}