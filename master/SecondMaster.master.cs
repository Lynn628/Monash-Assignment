using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_PreRender(object sender, EventArgs e)
    {
        //提供有关特定区域性的信息
        System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-GB", false);
        System.Threading.Thread.CurrentThread.CurrentCulture = culture;
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Default.aspx");
    }

    protected void Set_Theme(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        if (btn.Text == "Original")
        {

            Session["theme"] = "Original";

        }
        else
        {
            Session["theme"] = "Yellow";
        }
        Response.Redirect(Request.Path);
    }
}
