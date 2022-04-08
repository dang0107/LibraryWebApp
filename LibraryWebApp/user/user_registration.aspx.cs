using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibraryWebApp.user
{
    public partial class user_registration : System.Web.UI.Page
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
        }

        protected void b1_Click(object sender, EventArgs e)
        {

            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into users values ('" + email.Text + "', '"+ password.Text +"')";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.
            Response.Redirect("user_login.aspx");
        }
    }
}