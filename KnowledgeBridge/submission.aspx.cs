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
    public partial class submission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            protected void btnUpload_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(fileUpload.PostedFile.FileName);
            string logoFilePath = logo.PostedFile.FileName;
            string filename = Path.GetFileName(logoFilePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;
            string companyName = company.Value;
            string projectName = project.Value;
            string projDesc = desc.Value;

            //Set the contenttype based on File Extension

            //Logo
            switch (ext)
            {              
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
            }
            if (contenttype != String.Empty)
            {
                Stream fs = logo.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                string strQuery = "insert into Images(name, contentType, data, companyName, projectName, description) values (@Name, @ContentType, @Data, @Company, @Project, @Desc)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.AddWithValue("@Name", filename);
                cmd.Parameters.AddWithValue("@ContentType", contenttype);
                cmd.Parameters.AddWithValue("@Data", bytes);
                cmd.Parameters.AddWithValue("@Company", companyName);
                cmd.Parameters.AddWithValue("@Project", projectName);
                cmd.Parameters.AddWithValue("@Desc", desc);
                InsertUpdateData(cmd);
            }
            //Model
            foreach (HttpPostedFile mesh in meshes.PostedFiles)
            {
                string meshFilename = Path.GetFileName(mesh.FileName);
                string ext2 = Path.GetExtension(meshFilename);
                string contenttypeGLB = String.Empty;
                switch (ext2)
                {
                    case ".glb":
                        contenttype = "model/gltf-binary";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    Stream fs = mesh.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    string strQuery = "insert into ModelInformation(name, contentType, data, projectName) values (@Name, @ContentType, @Data, @Project)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.AddWithValue("@Name", meshFilename);
                    cmd.Parameters.AddWithValue("@ContentType", contenttypeGLB);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    cmd.Parameters.AddWithValue("@Project", projectName);
                    InsertUpdateData(cmd);
                }
            }

            //Images
            foreach (HttpPostedFile picture in pictures.PostedFiles)
            {               
                string pictureFilename = Path.GetFileName(picture.FileName);
                string ext3 = Path.GetExtension(pictureFilename);
                string contenttypeIMG = String.Empty;
                switch (ext3)
                {
                    case ".jpg":
                        contenttypeIMG = "image/jpg";
                        break;
                    case ".png":
                        contenttypeIMG = "image/png";
                        break;
                    case ".gif":
                        contenttype = "image/gif";
                        break;
                    case ".pdf":
                        contenttype = "application/pdf";
                        break;
                }
                if(contenttype != String.Empty)
                {
                    Stream fs = picture.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    string strQuery = "insert into ModelInformation(name, contentType, data, projectName) values (@Name, @ContentType, @Data, @Project)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.AddWithValue("@Name", pictureFilename);
                    cmd.Parameters.AddWithValue("@ContentType", contenttypeIMG);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    cmd.Parameters.AddWithValue("@Project", projectName);
                    InsertUpdateData(cmd);
                }
            }

            // Coordinater
                


                //Spara filen i databasen
                //string strQuery = "insert into ModelInformation(name, contentType, data) values (@Name, @ContentType, @Data)";

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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Index.aspx", true);
        }
    }
}