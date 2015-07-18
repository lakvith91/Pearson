<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pearson Claim Management System</title>

        <!-- For shortcut icon -->
       <link rel="shortcut icon" href="images/logo.png">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- Custom CSS -->
        <link href="css/Pearson.css" rel="stylesheet">

        <!-- Font CSS -->

        <link href="fonts/css.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="html5shiv.js"></script>
            <script src="respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Modal of login pop up window -->
        <div class="modal fade in " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog " style="margin-top:120px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-8"> <h3 class="modal-title" id="myModalLabel"> Account Login</h3></div>
                        </div>


                    </div>
                    <div class="modal-body"> <!-- Modal body And login form -->
                        <div class="row">
                            <!-- Simple Login - START -->
                            <form action="Login" class="col-md-12 has-success"  name="myForm" method="post" id="form_1">

                                <div class="row"><!-- First row start -->
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3">
                                        <div class="label label_2  " >User Name&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" id="username" name="username">
                                        </div>
                                    </div>
                               	</div><!-- First row End-->

                               	<div class="row"><!-- Second row start -->
                                    <div class="col-md-1"></div>

                                    <div class="col-md-3">
                                        <div class="label label_2" >Password&nbsp;&nbsp;&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input type="password" class="form-control input-lg"  id="password" name="password">
                                        </div>
                                    </div>
                                </div><!--second row End-->

                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4"> 
                                        <a href="#">Forgot Password</a>
                                  
                                    </div>
                                    
                                    <div class="col-md-6 ">
                                    <button type="submit" class="btn button btn-primary pull-right login" value="submit" id="submit" ><!-- login button of login popup window -->
                                        <span class="glyphicon glyphicon-info-sign"></span>&nbsp;Login</button><!-- login icon of login popup window -->
                                    

                                </div>
                            </div>
                            </form>
                            <!-- Simple Login - END -->

                        </div><!-- for row in body-->

                   </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal of login pop up window -->


        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="height:60px;">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>


                    </button>
                    <a class="navbar-brand" href="#"><img src="images/PEARSON_logo_3.png" alt="Company_logo" class="img-responsive"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav " >
                        <li >

                            <a href="#" class="nav_style_1" data-toggle="modal" data-target="#myModal" >Login</a>
                        </li>
                        <li >
                            <a href="about.jsp"  class="nav_style_1" >About</a>
                        </li>
                      
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Full Page Image Background Carousel Header -->
        <header id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for Slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <!--  first background image  -->
                    <div class="fill" style="background-image:url('images/001.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:50px;">
                        <h1 class="font_type_1 ">Get Online Claims For Your Expences</h1>
                        <h2 class="font_type_2"> We Pay Your Claims In Online.Nothing To Do.Follow Us.</h2>

                        <a href="#content" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>

                    </div>
                </div>
                <div class="item">
                    <!-- second background image  -->
                    <div class="fill" style="background-image:url('images/005.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:30px;">
                        <h1 class="font_type_1">Get Online Claims For Your Expences</h1>
                        <h2 class="font_type_2"> We Pay Your Claims In Online.Nothing To Do.Follow Us.</h2>

                        <a href="#content" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>

                    </div>
                </div>
                <div class="item">
                    <!--third background image  -->
                    <div class="fill" style="background-image:url('images/003.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:20px;">
                        <h1 class="font_type_1">Get Online Claims For Your Expences</h1>
                        <h2 class="font_type_2"> We Pay Your Claims In Online.Nothing To Do.Follow Us.</h2>
                        <a href="#content" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>

                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="icon-next"></span>
            </a>

        </header>

        <!-- Page Content -->
        <div class="container" id="content" >
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class=" text-primary">Claim your Internet and Food Expenses...</h1>
                    <h4 class="text-danger">This system is specially developed for Pearson. </h4>
                    <p>In this system,</p>
                    <p class="text-justify" >	Each employee has their own accounts. They can request their food and internet claims through those accounts and they can attach scanned copies of their bills with that claim request. They can select their project manager and then, that request goes to their project manager (PM). After the acceptation of PM the accepted claim request goes to the AGM. Finally, the AGM accepted request goes to the finance division, the admin of this system. Final decision is taken by finance division. At each step, the current process will notify to the employee and to the relevant manager. Not only that, a commenting process and a resubmitting process for the rejected requests also there.
                        We can further improve this system as a mobile app for a more flexible experience and future we can add more claiming features rather than food and internet claims.</p>
                </div>
            </div>

            <hr>

            <div class="container-fluid">

                <div class="row " >
                    <div class="col-md-7" >
                        <h1 class="text-primary" >Internet Expences</h1>
                        <h3 class="text-justify" >You have facilitated to claim your <font class="text-danger">Monthly Internet</font> expenses by using our system in an easy and user friendly way. <small style="font-size:20px;">You can easily attach your online bill as attachments as well.</small></h3>
                        <h4 class="text-justify text-danger">
                            * You can claim only your individual bills for months.<br></h4>

                    </div>
                    <div class="col-md-5 " id="imageContainer">
                        <img src="images/Internet_image.jpg" alt="image_1" class="img-responsive" >  	   				
                    </div>

                </div>

                <div  class="row" >


                    <div class="col-md-5" >
                        <img src="images/Food_image.jpg" alt="image_1" class="img-responsive" >
                    </div>
                    <div class="col-md-7" >
                        <h1  class="text-primary">Food Expences</h1>
                        <h3 class="text-justify"> You can claim your food expenses for Breakfast, Lunch and Dinner.</h3>
                        <h4 class="text-justify text-danger">
                            * You can claim individual bills and group bills also.<br>
                            * Claims should follow following threshold values.<br> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code>Breakfast Rs.120/= only<br></code>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code>Lunch Rs.400/= only<br></code>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code>Dinner Rs.400/= only</code>
                        </h4>

                    </div>
                </div>

            </div>


            <hr>
            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-10">
                        <p>Copyright &copy; <code>PEARSON PLC</code> 2015</p>
                    </div>
                    <div class="col-lg-2 ">
                        <a  href="#top"  >Back To Top</a>
                    </div>
                </div>
                <!-- /.row -->
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"  type="text/javascript"></script>
        <script src="js/jquery.easing.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"  type="text/javascript"></script>
        <script src="js/JSFX_ImageZoom.js"  type="text/javascript"></script>





        <!-- Script of the this -->
        <script  type="text/javascript">
            // Java Script for control the carousel speed

            $('.carousel').carousel({
                interval: 5000 //changes the speed
            })


            // jQuery for page scrolling feature - requires jQuery Easing plugin
            $(function() {
                $('a.page-scroll').bind('click', function(event) {
                    var $anchor = $(this);
                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top
                    }, 2000, 'easeInOutExpo');//change the speed of scroll
                    event.preventDefault();
                });
            });

            $('a[href=#top]').click(function() {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });

            /*$("div.image").each(function(i, obj){
         
             var clone;
             var position;
             clone = $(obj).clone();
             $(clone).addClass("clonedItem");
             position = $(obj).position();
         
             $(obj).bind("mouseover", function(e){
         
             $(".clonedItem").animate({
             height: "400px",
             width: "400px"
             }, 250, function(){$(this).remove();});
         
             $("div.image").css("z-index", 1);
             $(clone).css("top", position.top).css("left", position.left).css("z-index", 1000);
         
             $(clone).appendTo("#imageContainer").css("position", "absolute").animate({
             height: "450px",
             width: "450px"
             }, 250, function(){
         
             $(clone).bind("mouseout", function(e){
             $(clone).animate({
             height: "400px",
             width: "400px"
             }, 250, function(){$(clone).remove();});
         
             }); // end mouseout
         
             }); // end animate callback
         
             }); // end mouseover
         
             }); // end each*/


        </script>

    </body>

</html>

