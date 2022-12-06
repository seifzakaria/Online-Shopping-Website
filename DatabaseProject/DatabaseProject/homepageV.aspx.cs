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
    public partial class homepageV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void post(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string name = TextBox1.Text;
            string category = TextBox2.Text;
            string description = TextBox3.Text;
            string price = TextBox4.Text;
            string color = TextBox5.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("postProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@vendorUsername", username));
            cmd.Parameters.Add(new SqlParameter("@product_name", name));
            cmd.Parameters.Add(new SqlParameter("@category", category));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));
            cmd.Parameters.Add(new SqlParameter("@product_description", description));

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
                Response.Write("Error");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success!");
            }
        }

        protected void view(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("vendorProducts.aspx", true);
        }

        protected void edit(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string name = TextBox6.Text;
            string category = TextBox7.Text;
            string description = TextBox8.Text;
            string price = TextBox9.Text;
            string color = TextBox10.Text;
            int serial = Convert.ToInt32(TextBox11.Text);

            //proc_name
            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@vendorname", username));

            if (name == "")
                cmd.Parameters.Add(new SqlParameter("@product_name", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@product_name", name));

            if (category == "")
                cmd.Parameters.Add(new SqlParameter("@category", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@category", category));

            if (price == "")
                cmd.Parameters.Add(new SqlParameter("@price", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@price", price));

            if (color == "")
                cmd.Parameters.Add(new SqlParameter("@color", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@color", color));

            if (description == "")
                cmd.Parameters.Add(new SqlParameter("@product_description", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@product_description", description));

            cmd.Parameters.Add(new SqlParameter("@serialnumber", serial));

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
                Response.Write("Product serial number is incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void offers(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("offerActions.aspx", true);
        }
    }
}