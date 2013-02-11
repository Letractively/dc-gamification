using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GamificationPortal.Controls
{
    public partial class DynamicImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Request.QueryString[0];

            if (path != null)
            {

                System.Drawing.Bitmap img = new System.Drawing.Bitmap(path);

                img.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);

          }
        }
    }
}