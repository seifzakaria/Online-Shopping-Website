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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void registerC(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string name = TextBox3.Text;
            string email = TextBox4.Text;
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("customerRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@first_name", name));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@last_name", ""));

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
                Response.Write("Username already taken!");
                Response.Write("<br>");
                flag = true;
            }

            //convert from sql form
            if (flag == false)
            {
                if (password == "" || name == "" || email == "" || username == "")
                {
                    Response.Write("Fail!");
                    Response.Write("<br>");
                    Response.Write("All fields must not be empty");
                    Response.Write("<br>");
                }
                else
                {
                    Response.Write("Success");
                    Response.Write("<br>");
                    Response.Redirect("Login.aspx", true);
                }
            }
        }

        protected void registerV(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string name = TextBox3.Text;
            string email = TextBox4.Text;
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("vendorRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@first_name", name));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@last_name", ""));
            cmd.Parameters.Add(new SqlParameter("@company_name", ""));
            cmd.Parameters.Add(new SqlParameter("@banc_acc_no", ""));

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
                Response.Write("Username already taken!");
                Response.Write("<br>");
                flag = true;
            }

            //convert from sql form
            if (flag == false)
            {
                if (password == "" || name == "" || email == "" || username == "")
                {
                    Response.Write("Fail!");
                    Response.Write("<br>");
                    Response.Write("All fields must not be empty");
                    Response.Write("<br>");
                }
                else
                {
                    Response.Write("Success");
                    Response.Write("<br>");
                    Response.Redirect("Login.aspx", true);
                }
            }
        }
    }
}