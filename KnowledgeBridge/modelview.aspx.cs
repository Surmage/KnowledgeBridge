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
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myFunction", "myFunction();", true);
            if (!IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("loaded");
                i = 0;
            }
           
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            i++;
            System.Diagnostics.Debug.WriteLine(i);
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            i--;
            System.Diagnostics.Debug.WriteLine(i);
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnString);

            conn.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT data FROM ModelInformation where Id=2", conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    byte[] model = reader["data"] as byte[] ?? null;

                    if (model != null)
                    {
                        string base64String = Convert.ToBase64String(model, 0, model.Length);
                        ImageShowcase.InnerHtml = "<model-viewer src='model/gltf-binary;base64," + base64String + "'>"; //change to glb later
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

                    if (model != null)
                    {
                        string base64String = Convert.ToBase64String(model, 0, model.Length);
                        ImageShowcase.InnerHtml = "<img src = 'data:image/jpg;base64," + base64String + "' > ";
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

                //Spara filen i databasen
                //string strQuery = "insert into ModelInformation(name, contentType, data) values (@Name, @ContentType, @Data)";
                string strQuery = "insert into Images(name, contentType, data) values (@Name, @ContentType, @Data)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.AddWithValue("@Name", filename);
                cmd.Parameters.AddWithValue("@ContentType", contenttype);
                cmd.Parameters.AddWithValue("@Data", bytes);
                InsertUpdateData(cmd);
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