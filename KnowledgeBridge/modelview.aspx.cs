using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace KnowledgeBridge
{
    public partial class modelview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //slider.Visible = false;
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "cloneStuff", "cloneStuff('assets/Allosaurus.glb')", true);
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "cloneStuff", "cloneStuff('assets/Dinosaur.glb')", true);
            //string i = Request.QueryString["Num"];
            //if (Session["user"] != null)
            //{
            //    Response.Write(Session["user"].ToString());
            //    toSubmission.Visible = true;
            //}
            //else
            //{
            //    toSubmission.Visible = false;
            //}
            //if (!IsPostBack)
            //{
            //    if(i == null)
            //    {
            //        i = "2";
            //    }
            //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "cloneStuff", "cloneStuff()", true);
            //    btnLoad_Click(i);
            //    System.Diagnostics.Debug.WriteLine("loaded");

            //}          
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx?Int=" + 55);
        }

        protected void btnLoad_Click(string i)
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnString);

            conn.Open();
            string query = "SELECT * FROM ModelInformation where Id=" + i;
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    byte[] model = reader["data"] as byte[] ?? null;
                    string type = reader.GetString(reader.GetOrdinal("contentType"));

                    if (model != null)
                    {
                        string base64data = Convert.ToBase64String(model, 0, model.Length);
                        string jsFunc = "loadData('" + type + "', '" + base64data + "')";
                        ScriptManager.RegisterStartupScript(this, GetType(), "loadData", jsFunc, true);
                    }
                }
            }
        }
        protected void btnLoadImg_Click(object sender, EventArgs e)
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnString);

            conn.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT data FROM Images where Id=2", conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    byte[] model = reader["data"] as byte[] ?? null;
                    string type = reader.GetString(reader.GetOrdinal("contentType"));

                    if (model != null)
                    {
                        string base64String = Convert.ToBase64String(model, 0, model.Length);
                        ImageShowcase.InnerHtml = "<img src = 'data:" + type + ";base64," + base64String + "'> ";
                    }
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(fileUpload.PostedFile.FileName);
            string filePath = fileUpload.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            //Set the contenttype based on File Extension
            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-vord";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".xls":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
                case ".glb":
                    contenttype = "model/gltf-binary";
                    break;
            }
            if (contenttype != String.Empty)
            {
                Stream fs = fileUpload.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                if(contenttype == "model/gltf-binary")
                {
                    string strQuery = "insert into ModelInformation(name, contentType, data, projectName) values (@Name, @ContentType, @Data, @Project)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.AddWithValue("@Name", filename);
                    cmd.Parameters.AddWithValue("@ContentType", contenttype);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    cmd.Parameters.AddWithValue("@Project", "test");
                    InsertUpdateData(cmd);
                }
                else
                {
                    string strQuery = "insert into Images(name, contentType, data) values (@Name, @ContentType, @Data)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.AddWithValue("@Name", filename);
                    cmd.Parameters.AddWithValue("@ContentType", contenttype);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    InsertUpdateData(cmd);
                }
                //Spara filen i databasen
                //string strQuery = "insert into ModelInformation(name, contentType, data) values (@Name, @ContentType, @Data)";
               
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