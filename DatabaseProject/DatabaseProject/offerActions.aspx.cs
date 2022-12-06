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
    public partial class offerActions : System.Web.UI.Page
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
            string amount = TextBox1.Text;
            DateTime expiry = Convert.ToDateTime(TextBox2.Text);

            //proc_name
            SqlCommand cmd = new SqlCommand("addOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@offeramount", amount));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", expiry));

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
                flag = true;
                Response.Write("Please write the date correctly");
            }
            if (flag == false)
                Response.Write("Success");
        }

        protected void apply(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string vendor = (String) Session["cname"];
            string id = TextBox3.Text;
            string serial = TextBox4.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("applyOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@offerid", id));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));
            cmd.Parameters.Add(new SqlParameter("@vendorname", vendor));

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
                Response.Write("Offer ID or product serial number incorrect!");
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
            SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@offerid", id));

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
                Response.Write("Offer id incorrect!");
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