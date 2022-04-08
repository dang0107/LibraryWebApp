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
    public partial class Library : System.Web.UI.Page
    {
        // Use SqlConnection to get the string to open a SQL server database
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
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
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "select ( substring((select (', '+rtrim(authors.name)) from authors join book_author on authors.id = author_id where book_id = 5 for XML Path('')),2,1000) ) as 'book_author'";
            cmd.CommandText = "select id, books_title, books_isbn, available_qty, (select ( substring((select (', '+rtrim(authors.name)) from authors join book_author on authors.id = author_id where book_id = books.id for XML Path('')),2,1000) ) ) as 'book_author' from books";
            cmd.ExecuteNonQuery(); // Executes a transact-SQL statement against the connection and returns the number of rows affected.
            dt = new DataTable(); // Represents one table of in-memeory data
            da = new SqlDataAdapter(cmd); // Works as a bridge between DataSet and a data source (SQL Server DB) to retrieve data.
            da.Fill(dt); // SqlDataAdapter uses to fill the DataSet and update the data source.
            r1.DataSource = dt;
            r1.DataBind();
        }

        protected void filterBtn_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            if(radioBtn1.Checked == true) // Filter by Show all books
            {
                cmd.CommandText = "select id, books_title, books_isbn, available_qty, (select ( substring((select (', '+rtrim(authors.name)) from authors join book_author on authors.id = author_id where book_id = books.id for XML Path('')),2,1000) ) ) as 'book_author' from books";

                da = new SqlDataAdapter(cmd);
                ds = new DataSet();

                da.Fill(ds);
                r1.DataSource = dt;
                r1.DataBind();
            } else if(radioBtn2.Checked == true) // Filter by Available books
            {
                //Unfinished
                //cmd.CommandText = "select id, books_title, books_isbn, available_qty, (select ( substring((select (', '+rtrim(authors.name)) from authors join book_author on authors.id = author_id where book_id = books.id for XML Path('')),2,1000) ) ) as 'book_author' from books ";

                da = new SqlDataAdapter();
                ds = new DataSet();

                da.Fill(ds);
                r1.DataSource = dt;
                r1.DataBind();
            } else // Filter by books taken by user
            {
                //Unfinished
                //cmd.CommandText = "select id, books_title, books_isbn, available_qty, (select ( substring((select (', '+rtrim(authors.name)) from authors join book_author on authors.id = author_id where book_id = books.id for XML Path('')),2,1000) ) ) as 'book_author' from books ";

                da = new SqlDataAdapter();
                ds = new DataSet();

                da.Fill(ds);
                r1.DataSource = dt;
                r1.DataBind();
            }
        }
    }
  
}