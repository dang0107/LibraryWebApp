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
    public partial class add_books : System.Web.UI.Page
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
            // Bind when the page first loads
            if (ddl.SelectedIndex<0)
            {
                var authorName = new List<String>(); // create a list for author name for data bind
                authorName.Add("Add new author..."); // create the first option
                var listAuthor = get_Author();
                foreach (KeyValuePair<int, string> entry in listAuthor) // 
                {
                    authorName.Add(entry.Value);
                }

                ddl.DataSource = authorName;
                ddl.DataBind();
            }
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into books output INSERTED.ID values('" + bookstitle.Text +"','"+ isbn.Text +"','"+ qty.Text + "')";
            int newBookId = (int) cmd.ExecuteScalar();
            if (ddl.SelectedIndex==0) // admin creates a new author
            {
                SqlCommand cmd2 = con.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText += "insert into authors output INSERTED.ID values('" + authorname.Text + "')";
                int newAuthorId = (int) cmd2.ExecuteScalar();
                SqlCommand cmd3 = con.CreateCommand();
                cmd3.CommandType = CommandType.Text;
                cmd3.CommandText += "insert into book_author values('" + newBookId + "','" + newAuthorId + "')";
                cmd3.ExecuteNonQuery();
            }
            else // admin chooses from drop down list
            {
                var authorId = new List<int>();
                var listAuthor = get_Author();
                foreach (KeyValuePair<int, string> entry in listAuthor)
                {
                    authorId.Add(entry.Key);
                }
                SqlCommand cmd3 = con.CreateCommand();
                cmd3.CommandType = CommandType.Text;
                cmd3.CommandText += "insert into book_author values('" + newBookId + "','" + authorId[ddl.SelectedIndex - 1] + "')";
                cmd3.ExecuteNonQuery();
            }

            msg.Style.Add("display", "block"); // display successful messages

            Response.Redirect("library.aspx"); // redirect to main page
        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(ddl.SelectedIndex);
            if (ddl.SelectedIndex > 0)
            {
                authorname.Style.Add("display", "none");
            } else
            {
                authorname.Style.Remove("display");
            }
        }

        protected Dictionary<int, string> get_Author()
        {
            // To store author data i.e id and name
            var listAuthor = new Dictionary<int, string>();
            // Use Sqlcommand to query and send commands to a database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from authors";
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                listAuthor.Add((int) reader[0], String.Format("{0}", reader[1]));
            }
            return listAuthor;
        }
    }
}