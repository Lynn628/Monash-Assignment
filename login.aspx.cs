using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Web.Security;


public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        GetEventDates();

    }

    protected void Calendar1_PreRender(object sender, EventArgs e)
    {
        //提供有关特定区域性的信息
        System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-GB", false);
        System.Threading.Thread.CurrentThread.CurrentCulture = culture;
    }

    protected void loginValidation(Object sender, EventArgs e)
    {
        if (!(Page.IsValid))
        {
            return;
        }
        String username = name.Text;
        string strConnection = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + Server.MapPath("App_Data/CoffeeShop.accdb") + ";";

        string strSQL = "SELECT * FROM user_table WHERE username='" + name.Text.Trim(' ') + "'" + " AND password='" + password.Text.Trim(' ') + "'";

        //string strResultsHolder = "";

        OleDbConnection objConnection = new OleDbConnection(strConnection);
        OleDbCommand objCommand = new OleDbCommand(strSQL, objConnection);

        OleDbDataReader objDataReader = null;

        objConnection.Open();
        objDataReader = objCommand.ExecuteReader();

        if (objDataReader.Read())
        {
            //Response.Redirect("Default.aspx");
            FormsAuthentication.RedirectFromLoginPage(username, false);

        }
        else
        {
            //myreader中没有数据，表示给出的用户名和密码至少有一个是错的
            alterMessage.Text = "Wrong username or password!";
        }
        objDataReader.Close();
        objConnection.Close();


    }

    protected void GetEventDates()
    {
        string strConnection = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + Server.MapPath("App_Data/CoffeeShop.accdb") + ";";

        using (OleDbConnection objConnection = new OleDbConnection(strConnection))
        {
            objConnection.Open();
            OleDbCommand sqlcmd = new OleDbCommand(@"SELECT eventdate from events", objConnection);
            OleDbDataReader reader = sqlcmd.ExecuteReader();
            LinkedList<DateTime> selday = new LinkedList<DateTime>();
            while (reader.Read())
            {
                string time = reader["eventdate"].ToString();
                DateTime current = Convert.ToDateTime(time);
                selday.AddFirst(current);
                //这里用的是selectdates，带s的,表示选中的天数集合
                Calendar1.SelectedDates.Add(current);
            }
            Session.Add("eventdate", selday);
            reader.Close();
        }
    }

    protected string GetEventDetails(EventArgs e)
    {
        string eventDetails = "";
        string nextDay = Calendar1.SelectedDate.AddDays(1).ToShortDateString();
        string selectedDay = Calendar1.SelectedDate.ToShortDateString();
        dsEvent.SelectCommand = "SELECT [eventdate],[event],[eventTime] FROM [events] WHERE ([eventdate]<#" +
            nextDay + "# and [eventdate]>= #" + selectedDay + "#)";
        //在数据源中的所有数据都查找出来,参数为空就代表不过滤
        DataView dv = (DataView)dsEvent.Select(DataSourceSelectArguments.Empty);
        Console.WriteLine("*****************before");
        if (dsEvent.Select(DataSourceSelectArguments.Empty).GetEnumerator().MoveNext())
        {
            //string eventDaystr = dv.Table.Rows[0]["eventdate"].ToString();
            //DateTime eventDay = Convert.ToDateTime(eventDaystr);
            //eventDaystr = eventDay.ToString("t");
            string eventTimestr = dv.Table.Rows[0]["eventTime"].ToString();
            DateTime eventTime = Convert.ToDateTime(eventTimestr);
            eventTimestr = eventTime.ToString("t");
            eventDetails = "At" + eventTimestr + "," + dv.Table.Rows[0]["event"].ToString();
        }
        else
            eventDetails = "No event for today!";
        return eventDetails;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        displayDetails.Text = GetEventDetails(e);
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        LinkedList<DateTime> displaydate = (LinkedList<DateTime>)Session["eventdate"];
        try
        {
            foreach (DateTime date in displaydate)
            {
                if (date == e.Day.Date)
                {
                    e.Cell.BackColor = System.Drawing.Color.Gold;
                }
            }
        }
        catch (System.NullReferenceException ex)
        {
            displayDetails.Text = ex.Message;
        }
    }
    protected void Calendar1_Init(object sender, EventArgs e)
    {
        displayDetails.Text = GetEventDetails(e);
    }

    protected void Page_preInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = (String)Session["theme"];
        }

    }


}

