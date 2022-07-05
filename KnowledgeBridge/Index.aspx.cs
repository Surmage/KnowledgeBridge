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
            Response.Redirect("modelview.aspx");
        }

        protected void btnGoToSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("submission.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }
    }
}