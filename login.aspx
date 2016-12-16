
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <title>Login</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Please sign in* </h2>
      </div>
</asp:Content>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
        <div class="col-md-8 blog-main signin-form">
            <div class="row">
                <label for="name" class="col-md-2 control-label">Username</label>
                <div class="col-md-9">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </span>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" />
                    </div> 
                    <asp:RequiredFieldValidator ID="vldEmail" runat="server"
                        ControlToValidate="name" ErrorMessage="Please input your username" Display="Dynamic" CssClass="alert-danger" />
                </div>
            </div>
            <br />
            <div class="row">
                <label for="password" class="col-md-2 control-label">Password</label>
                <div class="col-md-9">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                        </span>
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"/>
                    </div>
                    <asp:RequiredFieldValidator ID="vldPassword" runat="server"
                        ControlToValidate="password" ErrorMessage="Please input a password" Display="Dynamic" CssClass="alert-danger" />
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9">
                    <asp:Button ID="BtnSignin" runat="server" Text="Sign in" CssClass="btn btn-primary" OnClick="loginValidation"/>
                    <asp:Label ID="alterMessage" runat="server" CssClass="alert-danger"></asp:Label>
                </div>
            </div>
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
            <li><a href="./locked/ShowCode.aspx?filename=~/login.aspx&filecode=~/Web.config">
                <img src="img/login.jpg" alt=""/></a></li>
        </ol>
    </div>
</asp:Content>