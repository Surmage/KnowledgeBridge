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
using System.Text.RegularExpressions;



namespace KnowledgeBridge
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScriptManager cs = Page.ClientScript;
            //cs.RegisterClientScriptBlock(this.GetType(), "AddMarkerKey", "addMarker()", true);
            //System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "AddMarkerKey", "addMarker(64.74434, 20.95660);", true);
            //System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "AddMarkerKey2", "addMarker(64.74537, 20.95861);", true);


            if (Session["user"] != null)
            {
                Response.Write(Session["user"].ToString());
                toSubmission.Visible = true;
            }
            else
            {
                toSubmission.Visible = false;
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("modelview.aspx?Num=" + btn.CommandArgument.ToString());
            //Response.Redirect("modelview.aspx?Num=" + 2);
        }

        protected void btnGoToSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("submission.aspx");
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            string search = searchBox.Text;
            System.Diagnostics.Debug.WriteLine(search);
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnString);
            try
            {
                conn.Open();
                string query = "SELECT * FROM ModelInformation WHERE projectName=@search";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@search", search);
                System.Diagnostics.Debug.WriteLine(query);
                using (cmd)
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int results = 0;
                    List<int> resultIndexes = new List<int>();
                    while (reader.Read())
                    {
                        results++;
                        int index = reader.GetInt32(reader.GetOrdinal("Id"));
                        resultIndexes.Add(index);
                    }

                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Found " + results + " results at " + resultIndexes[1] + "');", true);
                    if (results > 0)
                    {
                        string coords = String.Empty;
                        string message = String.Empty;
                        if(search == "test")
                        {
                            coords = "64.74434, 20.95660";
                            message = "<b>Location A</b><br>Building on campus.";
                        }
                        else if(search == "project")
                        {
                            coords = "64.74537, 20.95861";
                            message = "<b>Location B</b><br>Another building on campus.";
                        }
                        //testSwipe.Visible = false;
                        slider.FindControl("testSwipe2").Visible = false;
                        string ID = slider.FindControl("testSwipe").ID = search;
                        System.Web.UI.HtmlControls.HtmlControl div = (System.Web.UI.HtmlControls.HtmlControl)slider.FindControl(search);
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "AddMarkerKey", "addMarker(" + coords + ", '" + message + "');", true);
                    }

                }
            }
            catch
            {
                if(searchBox.Text != "")
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Searching " + search + " yielded no results');", true);

                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Empty search');", true);

                }

            }
            searchBox.Text = "";
        }
        protected void loadSearchContents()
        {

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
                SqlDataAdapter da = new SqlDataAdapter("Select * From Users WHERE email=@e AND password=@p", conn);
                //Skapar DataTable                      
                da.SelectCommand.Parameters.AddWithValue("@e", txtEmailLogin.Text);
                da.SelectCommand.Parameters.AddWithValue("@p", kpass);
                try
                {
                    DataTable dt = new DataTable();
                    //DataAdapter fyller DataTable med info
                    da.Fill(dt);
                    //Response.Write(dt.Rows[0][2].ToString());
                    //Response.Write("\n" + kpass);                 

                    if (dt.Rows.Count > 0)
                    {
                        Session["user"] = dt.Rows[0][1];
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Logged in!')", true);
                        showSubmissionButton();
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Wrong pass or user");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email or password wrong')", true);
                        if (txtEmailLogin.Text == "")
                        {
                            txtEmailLogin.BackColor = Color.Red;
                        }
                        if (txtPassLogin.Text == "")
                        {
                            txtPassLogin.BackColor = Color.Red;
                        }
                    }
                }
                catch
                {
                    System.Diagnostics.Debug.WriteLine("Error");
                }
            }
        }
        protected void showSubmissionButton()
        {
            toSubmission.Visible = true;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string wrong = "";

            var hasNumber = new Regex(@"[0-9]+");
            var hasUpperChar = new Regex(@"[A-Z]+");
            var hasMinimum8Chars = new Regex(@".{8,}");
            Crypt cr = new Crypt();
            string pass = txtPassRegister.Text;
            bool resultPass = hasNumber.IsMatch(pass) && hasUpperChar.IsMatch(pass) && hasMinimum8Chars.IsMatch(pass);
            wrong += resultPass.ToString();

            string pass2 = txtPassRegister2.Text;
            bool resultPass2 = hasNumber.IsMatch(pass2) && hasUpperChar.IsMatch(pass2) && hasMinimum8Chars.IsMatch(pass2);
            wrong += resultPass2.ToString();

            bool resultMatch = pass == pass2;

            Regex regEmail = new Regex(@"(?:[a-zA-Z0-9-]+(.+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z])?\.)+[a-z](?:[a-z])?)");
            string email = txtEmailRegister.Text;
            bool resultEmail = regEmail.IsMatch(email);
            wrong += resultEmail.ToString();

            if (resultPass && resultPass2 && resultMatch && resultEmail)
            {
                string kpass = cr.Encrypt(txtPassRegister.Text);
                //Set the contenttype based on File Extension

                //Spara filen i databasen
                //string strQuery = "insert into ModelInformation(name, contentType, data) values (@Name, @ContentType, @Data)";
                string strQuery = "insert into Users(email, password) values (@Email, @KPass)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@KPass", kpass);              
                InsertUpdateData(cmd);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + wrong + ")", true);
            }    
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