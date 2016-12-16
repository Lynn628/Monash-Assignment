
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class locked_SearchRecords : System.Web.UI.Page
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
    protected void searchRecords(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        switch (btn.CommandName)
        {
            case "username" :
                userAccess.SelectCommand = "SELECT * FROM user_table WHERE username LIKE '%" 
                    + username.Text.Trim(' ') + "%'";
                break;
            case "email" :
                userAccess.SelectCommand = "SELECT * FROM user_table WHERE email LIKE '%" 
                    + email.Text.Trim(' ') + "%'";
                break;
            case "phone" :
                userAccess.SelectCommand = "SELECT * FROM user_table WHERE phone='" 
                    + phone.Text.Trim(' ') + "'";
                break;
        }
      
            
            lvUser.DataSource = userAccess;
            lvUser.DataBind();
             if (lvUser.Items.Count == 0)
            {
                result.Text = "There are no results using the search condition!";
            }
            else
            {
                result.Text = "Show the results: ";
            }    

        }

    protected void Page_preInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = (String)Session["theme"];
        }

    }
    
}