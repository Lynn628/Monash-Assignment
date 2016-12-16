<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.4/themes/flick/jquery-ui.css" />
   
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <title>Register</title>
</asp:Content>


<asp:Content ID="title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Register*</h2>
      </div>
</asp:Content>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
        <div class="col-md-8 blog-main signin-form">
            <div class="row">
                <div class="col-md-10">
                    <label for="username" class="control-label">Username:</label>
                    <asp:TextBox ID="username" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="vldName" runat="server"
                        ControlToValidate="username" ErrorMessage="Please input your username" Display="Dynamic" CssClass="alert-danger" />
                    <asp:RegularExpressionValidator ID="vldUserNameFormat" runat="server" controlTovalidate="username"
                        ValidationExpression="^[A-Za-z]+$" ErrorMessage="Username must be all letter "  Display="Dynamic" CssClass="alert-danger"/>
                    <asp:CustomValidator ID="vldEmailExistence" runat="server" ControlToValidate="username"  OnServerValidate="ValidateEmailExistence"
                       Display="Dynamic" CssClass="alert-danger"/>
                    <asp:Label ID="alterLabel"  runat="server" CssClass="alert-danger" />

                    <br />

                    <label for="password" class="control-label">Password:</label>
                    <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"/>
                    <asp:RequiredFieldValidator ID="vldPassword" runat="server"
                        ControlToValidate="password" ErrorMessage="Please input your password" Display="Dynamic" CssClass="alert-danger" />
                    <br />

                    <label for="repassword" class="control-label">Confirm your password:</label>
                    <asp:TextBox ID="repassword" runat="server" CssClass="form-control" TextMode="Password"/>
                    <asp:CompareValidator ID="passwordCompare" runat="server" ControlToValidate="password"
                        ControlToCompare="repassword" ErrorMessage="Please enter the same password" CssClass="alert-danger" />
                     <br />

                    <label for="email" class="control-label">Email:</label>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="vldEmail" runat="server"
                        ControlToValidate="email" ErrorMessage="Please input your email." Display="Dynamic" CssClass="alert-danger" />
                    <asp:RegularExpressionValidator ID="vldEmailFormat" runat="server"
                        ControlToValidate="email" ValidationExpression="[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]"
                        ErrorMessage="Invalid email" Display="Dynamic" CssClass="alert-danger" />
                     
                    <br />

                    <label for="gender" class="control-label">Gender:</label>
                    <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" Width="200px">
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="vldGender" runat="server"
                        ControlToValidate="gender" ErrorMessage="Please input your gender" Display="Dynamic" CssClass="alert-danger" />
                    <br />

                   
                    <label for="birthday" class="control-label">Birthday:</label>
                   <%-- <asp:TextBox ID="birthday" runat="server" CssClass="form-control" />--%>
                    <div class="input-group">
                        <asp:TextBox ID="birthday" runat="server" CssClass="form-control" />
                       
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                        </span>
                    </div>
                      
                     <script>
                         $(function () {
                             $("#<%= birthday.ClientID%>").datepicker({
                                 format: 'yyyy/MM/dd',
                                 changeMonth: true,
                                 changeYear: true
                                 });
                             });
                        </script>
                    <br />

                    <label for="flavor" class="control-label">Flavor:</label>
                    <asp:CheckBoxList ID="flavor" runat="server" RepeatDirection="Horizontal" Width="550px">
                        <asp:ListItem>Esspresso</asp:ListItem>
                        <asp:ListItem>Latte</asp:ListItem>
                        <asp:ListItem>Mocha</asp:ListItem>
                        <asp:ListItem>Macchiato</asp:ListItem>
                        <asp:ListItem>Cappuccino</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />

                    <label for="phone" class="control-label">Phone number:</label>
                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="vldPhone" runat="server"
                        ControlToValidate="phone" ErrorMessage="Please input your phone number" Display="Dynamic" CssClass="alert-danger" />
                     <asp:RegularExpressionValidator ID="vldPhoneFormat" runat="server" controlTovalidate="phone"
                      validationExpression="(^1(\d){10}$)"  ErrorMessage="Wrong phone number format"  Display="Dynamic" CssClass="alert-danger"/>
                    <br />

                    <label for="homepage" class="control-label">Home page:</label>
                    <asp:TextBox ID="homepage" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="vldHomepage" runat="server"
                        ControlToValidate="homepage" ErrorMessage="Please input your homepage" Display="Dynamic" CssClass="alert-danger" />
                    <asp:RegularExpressionValidator ID="vldHomePageFormat" runat="server" controlTovalidate="homepage"
                      validationExpression="[a-zA-z]+://[^\s]*"  ErrorMessage="Wrong website format"  Display="Dynamic" CssClass="alert-danger"/>
                    
                    <br />   
                </div> 
            </div>
            <div class="row">
                <div class="col-md-10">
                    <asp:Button ID="BtnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block" OnClick="BtnRegister_Click" />
                </div>
            </div>
            <br />
   <%-- Lynn code--%>


            <asp:AccessDataSource runat="server" DataFile="~/App_Data/CoffeeShop.accdb"
                ID="userAccess" />

            <asp:ListView ID="lvUser" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td></td>
                            <td>
                                <b>User Name: <%#Eval("username")%></b><br />Gender:<%#Eval("gender")%><br />Password:   <%#Eval("password")%><br />Phone Number:<%#Eval("phone")%><br />Email:<%#Eval("email")%><br />Birthday: <%#Eval("birthday")%><br />
                                Flavor: <%#Eval("flavor")%><br />
                                Home Page： <%#Eval("homepage")%><br />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>


        </div>

</asp:Content>

<asp:Content ID="calendar" runat="server" ContentPlaceHolderID="CalendarHolder">
    <div class="sidebar-module sidebar-module-inset">
        <asp:AccessDataSource ID="dsEvent" DataFile="~/App_Data/CoffeeShop.accdb" runat="server" />
        <asp:Calendar ID="Calendar1" SkinID="CalendarView" runat="server" OnDayRender="Calendar1_DayRender" SelectionMode="Day" TodayDayStyle-BackColor="#FFA07A" TodayDayStyle-ForeColor="white"
            OnSelectionChanged="Calendar1_SelectionChanged" OnInit="Calendar1_Init"
            OnPreRender="Calendar1_PreRender" >
            <SelectedDayStyle BackColor="#00CED1" ForeColor="white"></SelectedDayStyle>
        </asp:Calendar>
        <asp:Label ID="displayDetails" runat="server" />
    </div>

</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <div id="main" class="sidebar-module sidebar-module-inset">
        <h4>More</h4>
        <ol class="list-unstyled">
            <li>
                <h2><a href="./locked/DisplayRecords.aspx">Click here to see all the customers</a></h2>
            </li>

            <li>
                <h2><a href="./locked/SearchRecords.aspx">Click here to search customers</a></h2>
            </li>
        </ol>
    </div>

</asp:Content>

<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    <div id="code" class="sidebar-module napkin">
        <h4>Source Code</h4>
        <ol class="list-unstyled">
            <li><a href="./locked/ShowCode.aspx?filename=~/register.aspx&filecode=~/register.aspx.cs">
                <img src="./img/addRecords.jpg" alt="" /></a></li>
            <li></li>
            <li><a href="./locked/ShowCode.aspx?filename=~/locked/DisplayRecords.aspx&filecode=~/locked/DisplayRecords.aspx.cs">
                <img src="./img/DisplayRecords.jpg" alt="" /></a></li>
            <li><a href="./locked/ShowCode.aspx?filename=~/locked/SearchRecords.aspx&filecode=~/locked/SearchRecords.aspx.cs">
                <img src="./img/searchRecords.jpg" alt="" /></a></li>
        </ol>
    </div>

</asp:Content>
