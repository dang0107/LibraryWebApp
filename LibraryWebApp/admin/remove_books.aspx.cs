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

    public partial class remove_books : System.Web.UI.Page
    {
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

            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            var bookId = Request.QueryString["id"].ToString();
            cmd.CommandText = "delete book_author where book_id ='" + bookId + "'";
            cmd.CommandText += "\ndelete book_user where book_id ='" + bookId + "'";
            cmd.CommandText += "\ndelete books where id ='" + bookId + "'";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.

            Response.Redirect("library.aspx");
        }
    }
}