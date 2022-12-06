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
    public partial class todayDealActions : System.Web.UI.Page
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
            string admin = (String)Session["cname"];
            string amount = TextBox1.Text;
            string expiry = TextBox2.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@deal_amount", amount));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", expiry));
            cmd.Parameters.Add(new SqlParameter("@admin_username", admin));

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
                Response.Write("Success");
            }
        }

        protected void apply(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string id = TextBox3.Text;
            string serial = TextBox4.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("addTodaysDealOnProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@deal_id", id));
            cmd.Parameters.Add(new SqlParameter("@serial_no", serial));

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
                Response.Write("Deal ID or product serial number incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            //convert from sql form
            if (flag == false)
            {
                Response.Write("Success");
            }
        }

        protected void remove(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string id = TextBox5.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@deal_id", id));

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
                Response.Write("Deal id incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            //convert from sql form
            if (flag == false)
            {
                Response.Write("Success");
            }
        }
    }
}