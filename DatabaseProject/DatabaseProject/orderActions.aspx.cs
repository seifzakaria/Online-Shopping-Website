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
    public partial class orderActions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void specifyAmount(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = (String)Session["cname"];
            string id = TextBox1.Text;
            string cash = TextBox2.Text;
            string credit = TextBox3.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("SpecifyAmount", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@orderID", id));
            if (cash == "")
                cmd.Parameters.Add(new SqlParameter("@cash", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@cash", cash));
            if (credit == "")
                cmd.Parameters.Add(new SqlParameter("@credit", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@credit", credit));


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
                Response.Write("Order ID does not exist!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void creditcard(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string id = TextBox6.Text;
            string credit = TextBox4.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("ChooseCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@creditcard", credit));
            cmd.Parameters.Add(new SqlParameter("@orderID", id));

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
                Response.Write("Credit card or order ID number incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                Response.Write("Success");
                Response.Write("<br>");
            }
        }

        protected void cancel(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string id = TextBox5.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("cancelOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@orderid", id));

            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;

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
                Response.Write("Order ID number incorrect!");
                Response.Write("<br>");
                flag = true;
            }

            if (flag == false)
            {
                if (success.Value is true)
                {
                    Response.Write("Success");
                    Response.Write("<br>");
                }
                else
                {
                    Response.Write("Fail.");
                    Response.Write("<br>");
                    Response.Write("Order is already processed!");
                    Response.Write("<br>");
                }
            }

        }
    }
}