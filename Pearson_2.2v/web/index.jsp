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
        <link rel="shortcut icon" href="images/browserLogo.png">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <!-- Custom CSS -->
        <link href="css/Pearson.css" rel="stylesheet">

        <!-- Font CSS -->

        <link href="fonts/css.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            $(document).ready(function () {
                $("#load").hide();
                $("a.forget").click(function () {
                        
                    var username = $("#username").val();
                    if (username == "")
                        alert("Enter Valid Username");
                    else{
                         $("#load").show();
                    $.ajax({
                        type: "POST",
                        url: "ForgetPassword",
                        data: "username=" + username,
                        success: function (data) {
                             $("#load").hide();
                            $("#msg").append(data);
                            $("#msg").css("color", "#228B22");
                            // alert(data);


                        }
                    });
                }

                });

            });


        </script>
    </head>

    <body>

        <!-- Modal of login pop up window -->
        <div  class="modal fade in " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog " style="margin-top:120px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <div class="row">
                            <div class="col-md-1">

                            </div>
                            <div class="col-md-8"> <h3 class="modal-title" id="myModalLabel"> Account Login</h3></div>
                        </div>
                    </div>
                    <div class="modal-body"> <!-- Modal body And login form -->
                        <div class="row">

                            <form  method="POST" action="Login" class="col-md-12 has-success"  name="myForm"  id="Loginform"> 
                                <div class="row"><!-- First row start -->
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3">
                                        <div class="label label_2  " >User Name&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input required type="text" class="form-control input-lg" id="username" name="username">
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
                                            <input required type="password" class="form-control input-lg"  id="password" name="password">
                                        </div>
                                    </div>
                                </div><!--second row End-->
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4"> 
                                        <a class="forget" href="#">Forgot Password</a>                                 
                                    </div>      
                                    <div class="col-md-2"> <div id="load" align="left" ><img src="images/loading(small).gif" /></div></div>

                                    <div class="col-md-4 ">
                                        <button id="LoginUser11"  class="btn button btn-primary pull-right login" value="submit"  ><!-- login button of login popup window -->
                                            <span class="glyphicon glyphicon-info-sign"></span>&nbsp;Login</button><!-- login icon of login popup window -->
                                    </div>
                                </div>
                                <div class="row">


                                </div>
                            </form> 
                            <!-- Simple Login - END -->
                        </div><!-- for row in body-->
                    </div>
                    <div class="modal-footer">


                        <div id="msg"></div>

                    </div>
                </div>
            </div>
        </div>
        <!--End Modal of login pop up window -->

        <!-- Navigation BAR-->
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
                    <a class="navbar-brand" href="#"><img src="images/PEARSON_logo.png" alt="Company_logo" class="img-responsive"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav " >
                        <li>
                            <a href="#" class="nav_style_1" data-toggle="modal" data-target="#myModal" >Login</a>
                        </li>
                        <li>
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
                    <div class="fill" style="background-image:url('images/carusol_1.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:50px;">
                        <h1 class="font_type_1 ">Get Online Claims For Your Expenses</h1>
                        <h2 class="font_type_2"> We Pay Your Claims In Online.Nothing To Do.Follow Us.</h2>
                        <a href="#content" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <!-- second background image  -->
                    <div class="fill" style="background-image:url('images/carusol_2.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:30px;">
                        <h1 class="font_type_1">Get Online Claims For Your Expenses</h1>
                        <h2 class="font_type_2"> We Pay Your Claims In Online.Nothing To Do.Follow Us.</h2>
                        <a href="#content" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <!--third background image  -->
                    <div class="fill" style="background-image:url('images/carusol_3.jpg');"></div>
                    <div class="carousel-caption" style="margin-bottom:20px;">
                        <h1 class="font_type_1">Get Online Claims For Your Expenses</h1>
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
                    <h2 class=" text-primary">Easy Claims for Your Food and Internet Expenses</h2>
                    <p>In this system,</p>
                    <p class="text-justify" >	You can quickly send your claim requests in an easy way using our system. Also can get your claim history, check the current state of your request, quickly know the acception or rejection of your request.</p><br>
                    <p> 1.	Access to your account<br>
                        2.	Add your claim request<br>
                        3.	Send for manager review</p>
                    <p> Then you can check for updates at anywhere, any time</p>
                </div>
            </div>
            <hr>
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-md-7">
                        <h2 class="text-primary" >Internet Expenses</h2>
                        <h3 class="text-justify" >Claim your monthly Internet expenses using our system in an easy way. You can easily attach your online bill as attachments as well.</h3>
                        <h4 class="text-justify text-danger">
                            * You can claim only your individual bills for months.<br></h4>
                    </div>
                    <div class="col-md-5 " id="imageContainer">
                        <img src="images/internet.png" alt="image_1" class="img-responsive" >  	   				
                    </div>
                </div>
                <div  class="row" >
                    <div class="col-md-5" >
                        <img src="images/food.png" alt="image_1" class="img-responsive" >
                    </div>
                    <div class="col-md-7" >
                        <h2 class="text-primary">Food Expenses</h2>
                        <h3 class="text-justify"> Claim your food expenses for Breakfast, Lunch and Dinner.</h3>
                        <h4 class="text-justify text-danger">
                            * You can claim individual bills and group bills also.<br>
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
                interval: 3500 //changes the speed
            })


            // jQuery for page scrolling feature - requires jQuery Easing plugin
            $(function () {
                $('a.page-scroll').bind('click', function (event) {
                    var $anchor = $(this);
                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top
                    }, 2000, 'easeInOutExpo');//change the speed of scroll
                    event.preventDefault();
                });
            });

            $('a[href=#top]').click(function () {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });

        </script>
    </body>
</html>

