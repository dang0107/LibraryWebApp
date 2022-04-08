using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibraryWebApp.admin
{
    public partial class change_quantity : System.Web.UI.Page
    {
        int id;
        // Use SqlConnection to get the string to open a SQL server database
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            // Error Handling for the connection: use ConnectionState
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            id = Convert.ToInt32(Request.QueryString["id"].ToString());

            if(IsPostBack)
            {
                return;
            }
            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select id, books_title, available_qty from books where id=" + id + "";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.
            DataTable dt = new DataTable(); // Represents one table of in-memeory data
            SqlDataAdapter da = new SqlDataAdapter(cmd); // Works as a bridge between DataSet and a data source (SQL Server DB) to retrieve data.
            da.Fill(dt); // SqlDataAdapter uses to fill the DataSet and update the data source.
            foreach (DataRow dr in dt.Rows)
            {
                bookstitle.Text = dr["books_title"].ToString();
                qty.Text = dr["available_qty"].ToString();
            }
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update books set books_title='"+ bookstitle.Text +"', available_qty='"+ qty.Text +"' where id =" + id + "";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.

            Response.Redirect("library.aspx");
        }
    }
}