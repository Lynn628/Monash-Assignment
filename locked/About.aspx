
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="locked_About" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>About</title>
</asp:Content>


<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*About Us*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-12 blog-main">
        <img src="../img/menu_cafe.png" alt=""/>
        <div class="row">
            <div class="col-md-offset-10">
                <a href="ShowCode.aspx?filename=About.aspx&filecode=History.aspx">
                <img src="../img/about.jpg" alt=""/></a>
            </div>
        </div>
        </div>
</asp:Content>



<%--<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    <div id="code" class="sidebar-module napkin">
        <h4>Source Code</h4>
        <ol class="list-unstyled">
            <li><a href="ShowCode.aspx?filename=About.aspx&filecode=History.aspx">
                <img src="../img/about.jpg" alt=""/></a></li>
        </ol>
    </div>
</asp:Content>--%>

