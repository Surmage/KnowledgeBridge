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
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("modelview.aspx" + "55");
        }

        protected void btnGoToSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("submission.aspx");
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            string search = searchBox.Value;
            System.Diagnostics.Debug.WriteLine(search);
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConnString);

            conn.Open();
            string query = "SELECT * FROM ModelInformation WHERE projectName=@search";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@search", search);
            System.Diagnostics.Debug.WriteLine(query);
            using (cmd)               
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                int results = 0;
                while (reader.Read())
                {
                    results++;
                }
                
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Found " + results + " results')", true);
            }
        }
    }
}