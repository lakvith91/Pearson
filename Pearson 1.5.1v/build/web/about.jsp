<%-- 
    Document   : about
    Created on : Jan 16, 2015, 1:31:17 PM
    Author     : Dasun
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

        <title>Pearson Claim Management System-About Us</title>

        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/logo.png">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">


        <!-- Custom CSS -->
        <link href="css/round-about.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/Pearson.css" rel="stylesheet">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="html5shiv.js"></script>
            <script src="respond.min.js"></script>
        <![endif]-->

    </head>

    <body class="about_body">

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
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>


                    </button>
                    <a class="navbar-brand" href="#"><img src="images/PEARSON_logo_3.png" alt="Company_logo" class="img-responsive"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav " >
 
                        <li >
                            <a href="#" class="nav_style_1" data-toggle="modal" data-target="#myModal" >Login</a>
                        </li>
                       <li >
                            <a href="index.jsp"  class="nav_style_1" >Home</a>
                        </li>   
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <!-- Page Content -->
        <div class="container" >

            <!-- Introduction Row -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">About Us
                        <small>It's Nice to Meet You!</small>
                    </h1>
                    <h2 class="text-center">Welcome to Pearson Claim Management System..!</h2>
                    <p class="text-justify">We are a group of second year undergraduates of Faculty of Information Technology, University of Moratuwa and we have developed this Web based Employee Expenses Claim Management System as our second year group project.<br></p>
                    <p class="text-primary">This system is specially developed for Pearson. </p>
                    <p>In this system,</p>
                    <p class="text-justify">Each employee has their own accounts. They can request their food and internet claims through those accounts and they can attach scanned copies of their bills with that claim request. They can select their project manager and then, that request goes to their project manager (PM). After the acceptation of PM the accepted claim request goes to the AGM. Finally, the AGM accepted request goes to the finance division, the admin of this system. Final decision is taken by finance division. At each step, the current process will notify to the employee and to the relevant manager. Not only that, a commenting process and a resubmitting process for the rejected requests also there.
                        We can further improve this system as a mobile app for a more flexible experience and future we can add more claiming features rather than food and internet claims.</p>
                    <p class="text-right">Thank you. <br>
                        L.D.Vithana <br>
                        W.K.D.Dilraj <br>
                        A.B.M.Asir <br>
                        T.D.M.P.Samaranayake <br>
                        H.M.Nimesha
                    </p>
                </div>
            </div>

            <!-- Team Members Row -->
            <!--   <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Our Team</h2>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
                </div>
                <div class="col-lg-4 col-sm-6 text-center">
                    <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3>John Smith
                        <small>Job Title</small>
                    </h3>
                    <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
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
                        <a  href="#top"  onclick="scrollTo('content')">Back To Top</a>
                    </div>
                </div>
                <!-- /.row -->
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>