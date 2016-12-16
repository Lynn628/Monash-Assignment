<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/master/MasterPage.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to our coffee culture</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-carousel">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
            <img class="first-slide" src="./img/banner4.jpg" alt="First slide"/>
        <%--  <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>--%>
        </div>
        <div class="item active">
          <img class="second-slide" src="./img/banner5.jpg" alt="Second slide"/>
          <%--<div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>--%>
        </div>
        <div class="item">
          <img class="third-slide" src="./img/banner6.jpg" alt="Third slide"/>
          <%--<div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>--%>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    </div><!-- /.carousel -->
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row" id="circle_font">
            <div class="col-lg-4">
                <img class="img-circle" src="./img/circle1.jpg" alt="Generic placeholder image" width="170" height="170" />
                <h2>Finest Beans</h2>
                <p>Manually harvested coffee beans,preventing damage to the exquisite fruit that ultimately yields the most supreme coffees.</p>
                <p><a class="btn btn-default btn-primary" href="./locked/ShowCode.aspx?filename=~/Default.aspx" role="button">AdRotator »</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="./img/circle3.jpg" alt="Generic placeholder image" width="170" height="170" />
                <h2>Nice Coffee</h2>
                <p>Made from best coffee bean and advanced coffee maker by skilled coffee barista, providing you with the enjoyment of taste buds. </p>
                <p><a class="btn btn-default btn-primary" href="./locked/ShowCode.aspx?filename=~/master/MasterPage.master&filecode=~/master/SecondMaster.master" role="button">Master Page »</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="./img/circle5.jpg" alt="Generic placeholder image" width="170" height="170" />
                <h2>Great Bread</h2>
                <p>Freshly-baked bread serves as good partner of coffee, every bite of it gives you the taste of purity and freshness.</p>
                <p><a class="btn btn-default btn-primary" href="#" role="button">View details »</a></p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

 <!-- START THE FEATURETTES -->

      <hr class="featurette-divider"/>
    <div id="square_font">
      <div class="row featurette">
        <div class="col-md-6">
          <!--<h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>-->
           <h2 class="featurette-heading">Give you the best.  <span class="text-muted">See it yourself.</span></h2>
            <p class="lead"> Originality and freshness are all we want you have. Hope our coffee and food can highlight your day. </p>
        </div>
        <div class="col-md-6">
            <img class="featurette-image img-responsive center-block" src="./img/square1.jpg" alt="Generic placeholder image"/>
        </div>
      </div>

      <hr class="featurette-divider"/>

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Oh yeah, it's good.  <span class="text-muted">See it with your friends. </span></h2>
          <p class="lead"> An excellent place for you to relax and meet with people you like .Talk to them and enjoy with them our good coffee and service.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="./img/square2.jpg" alt="Generic placeholder image" />
        </div>
      </div>

      <hr class="featurette-divider"/>

      <div class="row featurette">
        <div class="col-md-6">
           <h2 class="featurette-heading">Best service ever. <span class="text-muted">Check it out.</span></h2>
          <p class="lead"> Skilled barista and trained staffs are waiting to serve you and help you have a good time in our shop.</p>
        </div>
        <div class="col-md-6">
          <img class="featurette-image img-responsive center-block" src="./img/square3.jpg" alt="Generic placeholder image"/>
        </div>
      </div>
    </div>

      <!-- /END THE FEATURETTES -->
</asp:Content>
