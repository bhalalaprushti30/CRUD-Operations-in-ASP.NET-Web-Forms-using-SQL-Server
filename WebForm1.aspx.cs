using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EX9
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LENOVOGAMING3\\SQLEXPRESS; Database=Tables; Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("SELECT * FROM crudtbl1", con);
            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string id = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
                string name = DataBinder.Eval(e.Row.DataItem, "Name").ToString();
                string address = DataBinder.Eval(e.Row.DataItem, "Address").ToString();
                string age = DataBinder.Eval(e.Row.DataItem, "Age").ToString();
                string contact = DataBinder.Eval(e.Row.DataItem, "Contact").ToString();

                e.Row.Attributes["onmouseover"] = $"populateFields('{id}', '{name}', '{address}', '{age}', '{contact}')";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("INSERT INTO crudtbl1 VALUES (@ID, @Name, @Address, @Age, @Contact)", con);
            comm.Parameters.AddWithValue("@ID", TextBox1.Text);
            comm.Parameters.AddWithValue("@Name", TextBox2.Text);
            comm.Parameters.AddWithValue("@Address", TextBox3.Text);
            comm.Parameters.AddWithValue("@Age", TextBox4.Text);
            comm.Parameters.AddWithValue("@Contact", TextBox5.Text);
            comm.ExecuteNonQuery();
            con.Close();
            LoadRecord();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("UPDATE crudtbl1 SET Name=@Name, Address=@Address, Age=@Age, Contact=@Contact WHERE ID=@ID", con);
            comm.Parameters.AddWithValue("@ID", TextBox1.Text);
            comm.Parameters.AddWithValue("@Name", TextBox2.Text);
            comm.Parameters.AddWithValue("@Address", TextBox3.Text);
            comm.Parameters.AddWithValue("@Age", TextBox4.Text);
            comm.Parameters.AddWithValue("@Contact", TextBox5.Text);
            comm.ExecuteNonQuery();
            con.Close();
            LoadRecord();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("DELETE FROM crudtbl1 WHERE ID=@ID", con);
            comm.Parameters.AddWithValue("@ID", TextBox1.Text);
            comm.ExecuteNonQuery();
            con.Close();
            LoadRecord();
        }
    }
}
