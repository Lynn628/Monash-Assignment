<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Document.aspx.cs" Inherits="locked_Document" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <title>Document</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Documentation*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="LinkWrapper" class="col-md-11 blog-main signin-form">
        <h4><b>1.Assignment Information</b></h4>
        <table class="doc">
            <tbody>
                <tr>
                    <td>
                        <b>Author:</b>
                    </td>
                    <td>
                        <span>Yang Yan</span>
                        ID:27595765, E-Mail:<a href="mailto:yyan542@student.monash.edu">yyan542@student.monash.edu</a>
                        <br />
                        <span>Hanlin Huang</span>
                        ID:27315924, E-Mail:<a href="mailto:hhua123@student.monash.edu">hhua123@student.monash.edu</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Unit Name: </b>
                    </td>
                    <td>
                        FIT5192 Enterprise and internet applications development
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Unit provide:</b>
                    </td>
                    <td>
                        Monash University, The Caulfield School of Information Technology
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Assignment Number: </b>
                    </td>
                    <td>
                        Assignment 2 Task 1 - ASP.NET Web Form Website(
                        <a href="http://moodle.vle.monash.edu/pluginfile.php/4112729/mod_resource/content/9/Assignments/FIT5192-A2-2016_Specification.pdf">Assignment Specification</a>)
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Date of submission:</b>
                    </td>
                    <td>
                        26 Aug 2016
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Lecturer:</b>
                    </td>
                    <td>
                        Jue (Grace) Xie
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <h4><b>2. Web Site Design</b></h4>
        <h4>2.1 Home Page</h4>
        <p>
            <img class="doc" src="../img/homePage.jpg" />
        </p>
        <br />
        <h4>2.2 Login</h4>
        <p>
            <img class="doc" src="../img/loginjpg.jpg" />
        </p>
        <br />
        <h4>2.3 Register</h4>
        <p>
            <img class="doc" src="../img/registerFail.jpg" />
        </p>
        <p>
            <img class="doc" src="../img/registerSuccess.jpg" />
        </p>
        
        <h4>click to search users.</h4>
        <p>
            <img class="doc" src="../img/searchUser.jpg" />
        </p>
        <h4>click to see all the customers and the detail. </h4>
        <p>
            <img class="doc" src="../img/viewAllUser.jpg" />
        </p>
        <br />
        <h4>2.4 SiteMap</h4>
        <p>
            <img class="doc" src="../img/sitemap2.jpg" />
        </p>
        <br />
        <h4>2.5 Email</h4>
        <p>
            <img class="doc" src="../img/contact.jpg" />
        </p>

        <div class="row">
            <div class="col-md-offset-9">
                <a href="ShowCode.aspx?filename=~/css/my_style.css">
                <img src="../img/css.jpg" alt=""/></a>
                <a href="ShowCode.aspx?filename=~/App_Themes/Yellow/Yellow.skin">
                <img src="../img/skin.jpg" alt=""/></a>
            </div>
        </div>
        </div>
</asp:Content>


<%--<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    <div id="code" class="sidebar-module napkin">
        <h4>Source Code</h4>
        <ol class="list-unstyled">
            <li><a href="ShowCode.aspx?filename=~/css/my_style.css">
                <img src="../img/css.jpg" alt=""/></a></li>
            <li></li>
            <li><a href="ShowCode.aspx?filename=~/App_Themes/Yellow/Yellow.skin">
                <img src="../img/skin.jpg" alt=""/></a></li>
        </ol>
    </div>

</asp:Content>--%>

