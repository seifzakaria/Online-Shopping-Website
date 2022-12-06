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
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("reviewOrders", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            //read records one at a time
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int number = rdr.GetInt32(rdr.GetOrdinal("order_no"));
                DateTime date = rdr.GetDateTime(rdr.GetOrdinal("order_date"));
                //decimal cash = rdr.GetDecimal(rdr.GetOrdinal("cash_amount"));
                //decimal credit = rdr.GetDecimal(rdr.GetOrdinal("credit_amount"));
                decimal total = rdr.GetDecimal(rdr.GetOrdinal("total_amount"));
                string status = rdr.GetString(rdr.GetOrdinal("order_status"));
                //string payment = rdr.GetString(rdr.GetOrdinal("payment_type"));
                //int days = rdr.GetInt32(rdr.GetOrdinal("remaining_days"));
                //string time_limit = rdr.GetString(rdr.GetOrdinal("time_limit"));
                //string gift_card = rdr.GetString(rdr.GetOrdinal("gift_card_code_used"));
                string customer_name = rdr.GetString(rdr.GetOrdinal("customer_name"));
                //int delivery_id = rdr.GetInt32(rdr.GetOrdinal("delivery_id"));
                //string creditCard_number = rdr.GetString(rdr.GetOrdinal("creditCard_number"));

                Label lbl_number = new Label();
                lbl_number.Text = "no: " + number + ", ";
                form1.Controls.Add(lbl_number);

                Label lbl_date = new Label();
                lbl_date.Text = "date: " + date + ", ";
                form1.Controls.Add(lbl_date);

                /*Label lbl_cash = new Label();
                lbl_cash.Text = "cash_amount: " + cash + ", ";
                form1.Controls.Add(lbl_cash);

                Label lbl_credit = new Label();
                lbl_credit.Text = "credit_amount: " + credit + ", ";
                form1.Controls.Add(lbl_credit);*/

                Label lbl_total = new Label();
                lbl_total.Text = "total_amount: " + total + ", ";
                form1.Controls.Add(lbl_total);

                Label lbl_status = new Label();
                lbl_status.Text = "status: " + status + ", ";
                form1.Controls.Add(lbl_status);

                /*Label lbl_payment = new Label();
                lbl_payment.Text = "payment_method" + payment + ", ";
                form1.Controls.Add(lbl_payment);

                Label lbl_days = new Label();
                lbl_days.Text = "remaining_days: " + days + ", ";
                form1.Controls.Add(lbl_days);

                Label lbl_limit = new Label();
                lbl_limit.Text = "time_limit: " + time_limit + ", ";
                form1.Controls.Add(lbl_limit);

                /*Label lbl_gcard = new Label();
                lbl_gcard.Text = "gift_card_code_used: " + gift_card + ", ";
                form1.Controls.Add(lbl_gcard);*/

                Label lbl_cust = new Label();
                lbl_cust.Text = "customer_name: " + customer_name + " <br> <br> ";
                form1.Controls.Add(lbl_cust);

                /*Label lbl_delivery = new Label();
                lbl_delivery.Text = "delivery_id: " + delivery_id + ", ";
                form1.Controls.Add(lbl_delivery);

                Label lbl_ccard = new Label();
                lbl_ccard.Text = "creditCard_number: " + creditCard_number + " <br> <br> ";
                form1.Controls.Add(lbl_ccard);*/
            }
        }
    }
}