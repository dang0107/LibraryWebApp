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
    public partial class login : System.Web.UI.Page
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
            int i = 0;
            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from admin where email='"+ email.Text +"' and password='"+ password.Text +"'";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.
            DataTable dt = new DataTable(); // Represents one table of in-memeory data
            SqlDataAdapter da = new SqlDataAdapter(cmd); // Works as a bridge between DataSet and a data source (SQL Server DB) to retrieve data.
            da.Fill(dt); // SqlDataAdapter uses to fill the DataSet and update the data source.
            i = Convert.ToInt32(dt.Rows.Count.ToString()); // find how many rows and convert it into an interger

            if(i > 0)
            {
                Response.Redirect("library.aspx"); // found one then redirect to demo page
            } else
            {
                error.Style.Add("display","block"); // display error messages
            }
        }
    }
}