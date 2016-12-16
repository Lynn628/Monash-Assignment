
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayRecords.aspx.cs" Inherits="locked_DisplayRecords" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>DisplayRecords</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*All Users*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-10 blog-main signin-form"> 
        <asp:Panel ScrollBars="Horizontal" runat="server">
        <asp:AccessDataSource runat="server" DataFile="~/App_Data/CoffeeShop.accdb" ID="userAccess" />
      
         <asp:GridView ID="gvUsers" runat="server"  AutoGenerateColumns="false" CssClass="table-striped"
             OnRowCommand="displayUserDetails">
         
             <Columns>
                 <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                 <asp:BoundField DataField="gender" HeaderText="Gender" ReadOnly="true" />
                 <asp:BoundField DataField="password" HeaderText="Password" ReadOnly="true" />
                 <asp:BoundField DataField="phone" HeaderText="Phone"  ReadOnly="true" />
                 <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="true" />
                 <asp:BoundField DataField="birthday" HeaderText="Birthday" ReadOnly="true" />
                 <asp:BoundField DataField="flavor" HeaderText="Flavor Preference" ReadOnly="true" />
                 <asp:HyperLinkField DataTextField="homepage" DataNavigateUrlFields="homepage" HeaderText="Homepage" />
                 <asp:ButtonField  ButtonType="button" Text="Details" ControlStyle-CssClass="btn btn-primary btn-sm"/>
             </Columns>
         </asp:GridView>
        </asp:Panel>
        <br />
        <asp:Panel ID="showSelectedUser" runat="server">
            <asp:Label ID="info" runat="server" CssClass="alert-success" />
            <br />
            <asp:Label ID="lbUserDetails" runat="server" />
        </asp:Panel>
        </div>
</asp:Content>


