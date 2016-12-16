
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="locked_Contact" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>Contact</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Contact*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-8 blog-main signin-form">
        <div class="row" style="padding-left:40px">
            <!--DataSource and Grid View Here-->
    <asp:AccessDataSource ID="userAccess" DataFile="~/App_Data/CoffeeShop.accdb" runat="server" SelectCommand="SELECT * FROM user_table ORDER BY username" />
    <p class="blog-header">Contact List</p>
    <asp:GridView ID="gvUsersEmail" runat="server" DataKeyNames="username"  AutoGenerateColumns="false" DataSourceID="userAccess">
        <Columns>
            <asp:BoundField DataField="username" HeaderText="User Name"/>
            <asp:BoundField DataField="email" HeaderText="Email Address" />
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chkEmail" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
        <br /> <br />
        <div class="row">
            <label for="sender" class="col-md-2 control-label">From</label>
            <div class="col-md-9">
                <span>FIT5192_27595765</span>
            </div>
        </div>
        
        <div class="row">
            <label for="subject" class="col-md-2 control-label">Subject</label>
            <div class="col-md-9">
                <asp:TextBox ID="subject" runat="server" CssClass="form-control" />
            </div>
        </div>
        
        <div class="row">
            <label for="fileUpload" class="col-md-2 control-label">Attachment</label>
            <div class="col-md-9">
                <asp:fileUpload ID="fileUpload" runat="server" Width="430" />
             </div>
        </div>
        
        <div class="row">
            <label for="message" class="col-md-2 control-label">Message</label>
            <div class="col-md-9">
                <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Columns="55" Rows="15" CssClass="form-control"/>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-9">
                <asp:Button ID="send" runat="server" Text="Send" CssClass="btn btn-primary" OnClick="sendEmail" />
            </div>
        </div>
        
        <asp:Label ID="lblMail" runat="server" CssClass="col-md-offset-2 alert-info"/>
        </div>
</asp:Content>

<asp:Content ID="calendar" runat="server" ContentPlaceHolderID="CalendarHolder">
    <div class="sidebar-module sidebar-module-inset">
        <asp:AccessDataSource ID="dsEvent" DataFile="~/App_Data/CoffeeShop.accdb" runat="server" />
        <asp:Calendar ID="Calendar1" SkinID="CalendarView" runat="server" OnDayRender="Calendar1_DayRender" SelectionMode="Day" TodayDayStyle-BackColor="#FFA07A" TodayDayStyle-ForeColor="white" 
            OnSelectionChanged="Calendar1_SelectionChanged" OnInit="Calendar1_Init" OnPreRender="Calendar1_PreRender" >
            <SelectedDayStyle BackColor="#00CED1" ForeColor="white"></SelectedDayStyle>
            
         </asp:Calendar>
            <asp:Label id="displayDetails" runat="server" />
    </div>
</asp:Content>

<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    <div id="code" class="sidebar-module napkin">
        <h4>Source Code</h4>
        <ol class="list-unstyled">
            <li><a href="ShowCode.aspx?filename=Contact.aspx&filecode=Contact.aspx.cs">
                <img src="../img/email.jpg" alt=""/></a></li>
        </ol>
    </div>

</asp:Content>
