using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace KnowledgeBridge
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                login.Visible = false;
                register.Visible = false;
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("modelview.aspx");
        }

        protected void btnGoToSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("submission.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Crypt cr = new Crypt();
            string kpass = cr.Encrypt(txtPassLogin.Text);


            string conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\modelsdb.mdf;Integrated Security=True";
            //Skapar ny sqlconnection
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                //Skapar DataAdapter
                SqlDataAdapter da = new SqlDataAdapter("Select * From Users WHERE username=@u AND password=@p", conn);
                //Skapar DataTable                      
                da.SelectCommand.Parameters.AddWithValue("@u", txtUserLogin.Text);
                da.SelectCommand.Parameters.AddWithValue("@p", kpass);
                DataTable dt = new DataTable();
                //DataAdapter fyller DataTable med info
                da.Fill(dt);
                Response.Write(dt.Rows[0][2].ToString());
                Response.Write("\n" + kpass);

                if (dt.Rows.Count > 0)
                {
                    Session["user"] = dt.Rows[0][1];
                    Response.Redirect("submission.aspx");
                }
                else
                {
                    lblFel.Text = "Lösenord eller användarnamn är fel.";
                    lblFel.ForeColor = System.Drawing.Color.Red;
                    if (txtUserLogin.Text == "")
                    {
                        txtUserLogin.BackColor = Color.Red;
                    }
                    if (txtPassLogin.Text == "")
                    {
                        txtPassLogin.BackColor = Color.Red;
                    }
                }
            }
        }

        protected void btnOpenLogin_Click(object sender, EventArgs e)
        {
            login.Visible = true;
            forgots.Visible = false;
            register.Visible = false;
           
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            forgots.Visible = true;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(fileUpload.PostedFile.FileName);
            string user = txtUserRegister.Text;
            Crypt cr = new Crypt();
            string kpass = cr.Encrypt(txtPassRegister.Text);
            string email = txtEmailRegister.Text;

            //Set the contenttype based on File Extension

            //Spara filen i databasen
            //string strQuery = "insert into ModelInformation(name, contentType, data) values (@Name, @ContentType, @Data)";
            string strQuery = "insert into Users(username, password, email) values (@User, @KPass, @Email)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@User", user);
            cmd.Parameters.AddWithValue("@KPass", kpass);
            cmd.Parameters.AddWithValue("@Email", email);
            InsertUpdateData(cmd);           
        }

        protected void btnOpenRegister_Click(object sender, EventArgs e)
        {
            login.Visible = false;
            register.Visible = true;
        }
        private Boolean InsertUpdateData(SqlCommand cmd)
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return false;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
}