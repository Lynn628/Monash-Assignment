
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchRecords.aspx.cs" Inherits="locked_SearchRecords" MasterPageFile="~/master/SecondMaster.master"%>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>SearchRecords</title>
</asp:Content>


<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*Search Users*</h2>
      </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-md-10 blog-main signin-form">
        <div class="row">
            <div class="col-md-7">
                <asp:TextBox ID="username" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="searchByUsername" runat="server" Text="Search By Username" CssClass="btn btn-success"
                    OnClick="searchRecords" CommandName="username"/>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-7">
                <asp:TextBox ID="email" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="searchByEmail" runat="server" Text="Search By Email" CssClass="btn btn-success" 
                    OnClick="searchRecords" CommandName="email"/>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-7">
                <asp:TextBox ID="phone" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="searchByPhone" runat="server" Text="Search By Phone" CssClass="btn btn-success" 
                    OnClick="searchRecords" CommandName="phone"/>
            </div>
        </div>
        <br />

        <asp:Label ID="result" runat="server" CssClass="alert-success" />
        <br />
        <asp:AccessDataSource runat="server" DataFile="~/App_Data/CoffeeShop.accdb"
                ID="userAccess" />

        <asp:ListView ID="lvUser" runat="server">
            <ItemTemplate>
            <div class="result-bg">
                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>User Name:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("username")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Gender:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("gender")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Password:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("password")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Phone:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("phone")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Email:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("email")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Birthday:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("birthday")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Flavor:</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("flavor")%></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-md-3">
                        <span>Home Page：</span>
                    </div>
                    <div class="col-md-6">
                        <span><%#Eval("homepage")%></span>
                    </div>
                </div>
                
                </div>
                <br />
            </ItemTemplate>
        </asp:ListView>
        </div>
</asp:Content>


