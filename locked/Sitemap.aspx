
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="locked_Sitemap" MasterPageFile="~/master/SecondMaster.master" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>SiteMap</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*SiteMap*</h2>
    </div>
</asp:Content>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-8 blog-main signin-form">
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        <asp:TreeView ID="TreeView" runat="server"
            DataSourceID="SiteMapDataSource1" ShowLines="True" />
        <br />
    </div>
</asp:Content>

<asp:Content ID="calendar" runat="server" ContentPlaceHolderID="CalendarHolder">
    <div class="sidebar-module sidebar-module-inset">
        <asp:AccessDataSource ID="dsEvent" DataFile="~/App_Data/CoffeeShop.accdb" runat="server" />
        <asp:Calendar ID="Calendar1" SkinID="CalendarView" runat="server" OnDayRender="Calendar1_DayRender" SelectionMode="Day" TodayDayStyle-BackColor="#FFA07A" TodayDayStyle-ForeColor="white"
            OnSelectionChanged="Calendar1_SelectionChanged" OnInit="Calendar1_Init"
            OnPreRender="Calendar1_PreRender">
            <SelectedDayStyle BackColor="#00CED1" ForeColor="white"></SelectedDayStyle>
        </asp:Calendar>
        <asp:Label ID="displayDetails" runat="server" />
    </div>
</asp:Content>

<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    <div id="code" class="sidebar-module napkin">
        <h4>Source Code</h4>
        <ol class="list-unstyled">
            <li><a href="ShowCode.aspx?filename=Sitemap.aspx&filecode=~/Web.sitemap">
                <img src="../img/sitemap.jpg" alt="" />
            </a></li>
        </ol>
    </div>
</asp:Content>
