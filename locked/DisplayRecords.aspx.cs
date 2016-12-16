
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class locked_DisplayRecords : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userAccess.SelectCommand = "SELECT * FROM user_table";
        gvUsers.DataSource = userAccess;
        gvUsers.DataBind();
    }

    protected void displayUserDetails(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            info.Text = "Detailed Information: ";
            lbUserDetails.Text = "<table><tr><td><b>User Name:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text +
               "</td></tr><tr><td><b>Gender:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text +
               "</td></tr><tr><td><b>Password:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text +
               "</td></tr><tr><td><b>Phone:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text +
               "</td></tr><tr><td><b>Email:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text +
               "</td></tr><tr><td><b>Birthday:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].Text +
               "</td></tr><tr><td><b>Flavor:</b></td><td>" + gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].Text +
               "</td></tr><tr><td><b>Homepage:</b></td><td>" + (this.gvUsers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[7].Controls[0] as HyperLink).Text +
               "</td></tr></table>";
        }
        catch
        {
            lbUserDetails.Text = "";
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