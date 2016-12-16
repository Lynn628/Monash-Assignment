using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class locked_History : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void Calendar1_PreRender(object sender, EventArgs e)
    //{
    //    //提供有关特定区域性的信息
    //    System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-GB", false);
    //    System.Threading.Thread.CurrentThread.CurrentCulture = culture;
    //}

    protected void Page_preInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = (String)Session["theme"];
        }

    }
}