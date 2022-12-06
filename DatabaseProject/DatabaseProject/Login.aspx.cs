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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            //config and sql_connect
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            //proc_name
            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //input_names
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            //outputs
            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = ParameterDirection.Output;

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

            //convert from sql form
            if (flag == false)
            {
                if (success.Value is true)
                {
                    //print
                    Response.Write("Success");

                    //store session values
                    Session["cname"] = username;

                    if (type.Value.ToString().Equals("0"))
                        Response.Redirect("homepageC.aspx", true);
                    else if (type.Value.ToString().Equals("1"))
                        Response.Redirect("homepageV.aspx", true);
                    else if (type.Value.ToString().Equals("2"))
                        Response.Redirect("homepageA.aspx", true);
                }
                else
                {
                    Response.Write("Username or password is incorrect");
                }
            }
        }
    }
}