﻿using System;
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
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Project"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ShowProductsbyPrice", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            //read records one at a time
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int serial = rdr.GetInt32(rdr.GetOrdinal("serial_no"));
                string name = rdr.GetString(rdr.GetOrdinal("product_name"));
                string category = rdr.GetString(rdr.GetOrdinal("category"));
                string description = rdr.GetString(rdr.GetOrdinal("product_description"));
                decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                decimal final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));
                string color = rdr.GetString(rdr.GetOrdinal("color"));
                bool available = rdr.GetBoolean(rdr.GetOrdinal("available"));
                int rate = rdr.GetInt32(rdr.GetOrdinal("rate"));
                string vendor = rdr.GetString(rdr.GetOrdinal("vendor_username"));
                //string customer = rdr.GetString(rdr.GetOrdinal("customer_username"));
                //int order = rdr.GetInt32(rdr.GetOrdinal("customer_order_id"));

                Label lbl_serial = new Label();
                lbl_serial.Text = "serial: " + serial + ", ";
                form1.Controls.Add(lbl_serial);

                Label lbl_name = new Label();
                lbl_name.Text = "product_name: " + name + ", ";
                form1.Controls.Add(lbl_name);

                Label lbl_color = new Label();
                lbl_color.Text = "color: " + color + ", ";
                form1.Controls.Add(lbl_color);

                Label lbl_price = new Label();
                lbl_price.Text = "price: " + price + ", ";
                form1.Controls.Add(lbl_price);

                Label lbl_final_price = new Label();
                lbl_final_price.Text = "final price: " + final_price + ", ";
                form1.Controls.Add(lbl_final_price);

                Label lbl_category = new Label();
                lbl_category.Text = "category: " + category + ", ";
                form1.Controls.Add(lbl_category);

                Label lbl_rate = new Label();
                lbl_rate.Text = "rate" + rate + ", ";
                form1.Controls.Add(lbl_rate);

                Label lbl_available = new Label();
                lbl_available.Text = "available: " + available + ", ";
                form1.Controls.Add(lbl_available);

                Label lbl_description = new Label();
                lbl_description.Text = "description: " + description + ", ";
                form1.Controls.Add(lbl_description);

                Label lbl_vendor = new Label();
                lbl_vendor.Text = "vendor_username: " + vendor + " <br> <br> ";
                form1.Controls.Add(lbl_vendor);

                /*Label lbl_customer = new Label();
                lbl_customer.Text = customer + ", ";
                form1.Controls.Add(lbl_customer);

                Label lbl_order = new Label();
                lbl_order.Text = order + ", ";
                form1.Controls.Add(lbl_order);*/
            }
        }
    }
}