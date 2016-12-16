using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class locked_Contact : System.Web.UI.Page
{
    string strPath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        GetEventDates();
    }

    public void sendEmail(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();
        foreach (GridViewRow gvRow in gvUsersEmail.Rows)
        {
            int x = gvRow.RowIndex;
            string s = gvRow.ToString();

            CheckBox cb = (CheckBox)gvRow.FindControl("chkEmail");

            if (cb != null && cb.Checked)
            {
                newMsg.To.Add(new MailAddress(gvRow.Cells[1].Text, gvRow.Cells[0].Text));
            }
        }
        newMsg.From = new MailAddress("hhua123@monash.student.edu", "Lynn");
        newMsg.Subject = subject.Text;
        newMsg.Body = message.Text;


        bool sendEmail = true;
        if (fileUpload.HasFile)
        {
            if (UpLoadFile(fileUpload.FileName))
            {
                Attachment newAttach = new Attachment(strPath);
                newMsg.Attachments.Add(newAttach);
            }
            else
            {
                sendEmail = false;
            }

        }
        if (sendEmail)
        {
            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.monash.edu.au";
                smtp.Send(newMsg);
                lblMail.Text = "Mail successfully sent";
            }
            catch (Exception exception)
            {
                lblMail.Text = exception.Message;
            }

        }
    }

    public bool UpLoadFile(string strFileName)
    {
        bool blnFileOk = false;
        string strExt = System.IO.Path.GetExtension(fileUpload.PostedFile.FileName);
        if ((strExt != ".gif") && (strExt != ".jpg"))
        {
            lblMail.Text = "Invalid file type";
        }
        else
        {
            blnFileOk = true;
            strPath = Server.MapPath(".") + "/UploadFiles/" + strFileName;
            fileUpload.PostedFile.SaveAs(strPath);
        }
        return blnFileOk;
    }


    protected void Calendar1_PreRender(object sender, EventArgs e)
    {
        //提供有关特定区域性的信息
        System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-GB", false);
        System.Threading.Thread.CurrentThread.CurrentCulture = culture;
    }
    protected void GetEventDates()
    {
        string strConnection = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + Server.MapPath("../App_Data/CoffeeShop.accdb") + ";";

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