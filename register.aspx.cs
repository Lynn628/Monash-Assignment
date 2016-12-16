using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.OleDb;
using System.Globalization;


public partial class register : System.Web.UI.Page
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

    protected void BtnRegister_Click(Object sender, EventArgs e)
    {
       // Page.Validate();
        if (!(Page.IsValid))
        {
            return;
        }
        
            String name_input = username.Text.Trim(' ').ToString();
            String password_input = password.Text.Trim(' ').ToString();
            String homepage_input = homepage.Text.Trim(' ').ToString();
            String phone_input = phone.Text.Trim(' ').ToString();
            String email_input = email.Text.Trim(' ').ToString();
            Debug.WriteLine(name_input);
            String gender_chosen = gender.SelectedItem.Text.ToString();
            Debug.WriteLine(gender_chosen);
            String flavor_chosen = "";
          
            String date = birthday.Text.ToString();
          //  String date = birthday.SelectedItem.Text.ToString();
         //  Debug.WriteLine(date);

            foreach (ListItem item in flavor.Items)
            {
                if (item.Selected)
                    flavor_chosen += item.Value + ";";
            }
      
            int addresult = this.addUser(name_input, gender_chosen, password_input, phone_input, email_input, date, flavor_chosen, homepage_input);
            
            if (addresult > 0)
            {
                //alterLabel.Text = addresult.ToString();
                 //插入数据成功则依据email读取用户信息
                userAccess.SelectCommand = "SELECT * FROM user_table WHERE username='" + username.Text.Trim(' ') + "'";
                lvUser.DataSource = userAccess;
                lvUser.DataBind(); 
      
            }
            else
            {
                //Response.Redirect(Request.Path);
            }
           
    }

    protected void ValidateEmailExistence(object source, ServerValidateEventArgs args)
    {   args.IsValid = false;
        string strConnection = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + Server.MapPath("App_Data/CoffeeShop.accdb") + ";";

        string strSQL = "SELECT * FROM user_table WHERE username='" + username.Text.Trim(' ') + "'";
       // string strSQL = "SELECT * FROM user_table WHERE username='" + args.Value.Trim(' ') + "'";
        OleDbConnection objConnection = new OleDbConnection(strConnection); 
        objConnection.Open();
        OleDbCommand objCommand = new OleDbCommand(strSQL, objConnection);
        OleDbDataReader objDataReader = null;

        objDataReader = objCommand.ExecuteReader();
      
        if (objDataReader.Read())
        {  //Session("useremail") = email.Text;
            alterLabel.Text = "Username has been existed";
        }
        else
        {
            args.IsValid = true;
            alterLabel.Text = "";
        }
        
        objConnection.Close();

    }

    protected int addUser(String username, String gender, String password, String phone, String email, String birthday, String flavor, String homepage)
    {
        //DateTime userBirthday = DateTime.Parse(birthday);
        
        string strConnection = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + Server.MapPath("App_Data/CoffeeShop.accdb") + ";";
        OleDbConnection con = new OleDbConnection(strConnection);
        con.Open();
        string strSQL = "INSERT INTO [user_table]"
                       + "(username, gender, [password], phone, email, birthday, flavor, homepage)"
                       + " VALUES (@username, @gender, @password, @phone, @email, @birthday, @flavor, @homepage)";
        OleDbCommand cmd = new OleDbCommand(strSQL, con);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@gender", gender);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@phone", phone);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@birthday", birthday);
        cmd.Parameters.AddWithValue("@flavor", flavor);
        cmd.Parameters.AddWithValue("@homepage", homepage);
        Debug.WriteLine(cmd.CommandText);
        //OleDbDataReader objDataReader = null;
       
        //cmd.ExecuteNonQuery();

        int result = cmd.ExecuteNonQuery();
        con.Close();
        return result;
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


