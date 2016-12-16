<%@ Page Language="C#" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="locked_History" MasterPageFile="~/master/SecondMaster.master" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>History</title>
</asp:Content>

<asp:Content ID="Title" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="big-title" class="blog-header">
        <h2 class="blog-title">*History*</h2>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="container-site" class="col-md-10 blog-main signin-form">
        <div id="page-home">
            <div id="l-panel">
                <div id="home-flash">
                    <object width="320" height="240">
                        <param name="movie" value="filmeffect_main.swf"/>
                        <param name="wmode" value="transparent"/>
                        <param name="attr" value="value"/>
                        <param name="quality" value="best"/>
                        <param name="play" value="true"/>
                        <embed type="application/x-shockwave-flash" height="250" width="320"/>
                    </object>
            </div>
            </div>
            <div id="c-panel">
                <div id="home-content">
                    <div id="home-title"></div>
                    <div style="float: left; width: 32px; height: 37px;">
                        <img src="../img/letter_b.png" />
                    </div>
                    <span id="introduction">een awake coffee shop has won the prize of “Best coffee of the year” 3 times in a row. 
                        Our major business is selling coffee. Every season there will be new coffee drinks invented by our experts on sale and make it possible for customer to explore the possibility of coffee.
                        To help customer DIY their coffee at home, we also provide coffee beans which are used to in our store brew the coffee. 
                    </span>
                </div>
                <br />
            </div>

        </div>
    </div>
</asp:Content>



