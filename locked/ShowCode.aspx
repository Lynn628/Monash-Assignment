<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowCode.aspx.cs" Inherits="locked_ShowCode" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>ShowCode</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Source Code*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-12 blog-main signin-form">
        <asp:Label ID="Filename" runat="server" CssClass="alert-success"></asp:Label>
        <asp:Panel ID="PanelFile" runat="server">
            <pre>
                <asp:Label ID="FileCode" runat="server"></asp:Label>
            </pre>
        </asp:Panel>
        <br />
        <asp:Label ID="Codename" runat="server" CssClass="alert-success"></asp:Label>
        <asp:Panel ID="PanelCode" runat="server">
            <pre>
                <asp:Label ID="CsCode" runat="server"></asp:Label>
            </pre>
        </asp:Panel>
        </div>
</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">

</asp:Content>

<asp:Content ID="SourceCode" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">

</asp:Content>