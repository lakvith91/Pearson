<%-- 
    Document   : index
    Created on : Jan 13, 2015, 8:07:52 PM
    Author     : Lakshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">

        <title>&nbsp;Pearson Claim Management</title>

        <!--<link rel="shortcut icon" href="../../../Boostrap/Magister/assets/images/gt_favicon.png">-->
        <link rel="shortcut icon" href="images/icon/logo.png">

        <!-- Bootstrap itself -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- Custom styles -->
        <!--  <link href="css/magister.css" rel="stylesheet" type="text/css">-->
        <link href="css/index.css" rel="stylesheet" type="text/css">


        <!-- Fonts -->
        <link href="fonts/css.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    </head>

    <!-- use "theme-invert" class on bright backgrounds, also try "text-shadows" class -->
    <body class="theme-invert"  id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">



        <!-- Modal of login pop up window -->
        <div class="modal fade in " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:120px;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Login</h4>
                    </div>
                    <div class="modal-body"> <!-- Modal body And login form -->
                        <div class="row">
                            
                            
                            <!-- Simple Login - START -->
                            <form action="Login" class="col-md-12 has-success"  name="myForm" method="post" id="form_1">

                                <div class="row"><!-- First row start -->
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3 margin_sign_up">
                                        <div class="label" style="color:black;">Username&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" id="username" name="username" >
                                        </div>
                                    </div>
                                </div><!-- First row End-->

                                <div class="row"><!-- Second row start -->
                                    <div class="col-md-1"></div>

                                    <div class="col-md-3 margin_sign_up">
                                        <div class="label" style="color:black;">Password&nbsp;&nbsp;&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input type="password" class="form-control input-lg"  id="password" name="password" >
                                        </div>
                                    </div>
                                </div><!--second row End-->

                                <div class="form-group " style="margin-top:10px;">
                                    <button type="submit" class="btn button pull-right login" value="submit" id="submit"  ><!-- login button of login popup window -->
                                        <span class="glyphicon glyphicon-info-sign"></span>&nbsp;Login</button><!-- login icon of login popup window -->
                                    <span><a href="#">Forgot Password</a></span>

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

        <!--    <div class="container-fluid logodiv" >
               <div class="row">
                       <div class="col-md-3"><img src="images/pearson-logo-white-2x.png" alt="logo"></div>
                       <div class="col-md-6"></div>
                       <div class="col-md-3"><h1 style="font-size:13px;color:#FFFFFF;">ALWAYS LERANING</h1></div>
       
       
               </div>
            </div>   
          
            <div class="container-fluid buttondiv" >
               <div class="row">
                       <div class="col-md-5"></div>
                       <div class="col-md-3"></div>
                       <div class="col-md-4">
        <!-- Indicates a successful or login action --><!--<div class="row">

            <button type="button" class="btn btn-success button marginmain login" data-toggle="modal" data-target="#myModal" >
                <span class="glyphicon glyphicon-info-sign"></span> <!-- icon 1--> 
        <!--                      Login
        <!--                    </button>
    
        <!--                   <!-- Contextual button for informational SignUp -->
        <!--                <button type="button" class="btn button marginmain signup" onClick="document.getElementById('middle').scrollIntoView();" >
                            <span class=" glyphicon glyphicon-exclamation-sign"></span> <!-- icon 2--> 
        <!--                      Sign Up
                          </button>
  
        <!-- Indicates caution should be taken with this action -->
        <!--                 <button type="button" class="btn  button marginmain  about" >
                             <span class="glyphicon glyphicon-question-sign"></span> <!-- icon 3--> 
        <!--                     About
                         </button>
 
        <!--              </div>
                  </div> <!-- for row-->

        <!--		</div>
   
   
        <!--	</div>
        <!--   </div>  
        <!-- Navigation -->
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation"  >
            <div class="container"  >
                <div class="navbar-header">
                    <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                       <i class="fa fa-bars"></i>
                   </button>-->
                    <a class="navbar-brand page-scroll" href="https://www.pearson.com/">
                        <!--   <i class="fa fa-play-circle"></i>  <span class="light">Start</span> Bootstrap-->
                        <img src="images/PEARSON_logo_2.png"  class="img-responsive" alt="company logo" >

                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <!--  <a class="page-scroll" href="#myModal">About</a> -->
                            <button type="button" class="btn btn-success button marginmain login" data-toggle="modal" data-target="#myModal" >
                                <span class="glyphicon glyphicon-info-sign"></span> <!-- icon 1--> 
                                Login
                            </button>

                        </li>
                        <li>
                            <!--  <a class="page-scroll" href="#download">Download</a> -->
                            <button type="button" class="btn button marginmain signup " onClick="document.getElementById('middle').scrollIntoView();"  >
                                <span class=" glyphicon glyphicon-exclamation-sign"></span> <!-- icon 2--> 
                                Sign Up
                            </button>


                        </li>
                        <li>
                            <!--   <a class="page-scroll" href="#contact">Contact</a> -->
                            <button type="button" class="btn  button marginmain  about"   onclick="swap('about', 'description','feature','middle')"  >
                                <span class="glyphicon glyphicon-question-sign"></span> <!-- icon 3--> 
                                About
                            </button>

                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>


        <div class="container "   id="about_div">

        </div>

        <div class="container featurediv" style="margin-top:200px;display:none;margin-bottom:40px;"  id="about">
            <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 " >
                <h2 class="text-center">Welcome to eXpenser Claim Management System..!</h2>
                <p>We are a group of second year undergraduates of Faculty of Information Technology, University of Moratuwa and we have developed this Web based Employee Expenses Claim Management System as our second year group project.<br></p>
                <p class="text-primary">This system is specially developed for Pearson. </p>
                <p>In this system,</p>
                <p>	Each employee has their own accounts. They can request their food and internet claims through those accounts and they can attach scanned copies of their bills with that claim request. They can select their project manager and then, that request goes to their project manager (PM). After the acceptation of PM the accepted claim request goes to the AGM. Finally, the AGM accepted request goes to the finance division, the admin of this system. Final decision is taken by finance division. At each step, the current process will notify to the employee and to the relevant manager. Not only that, a commenting process and a resubmitting process for the rejected requests also there.
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




        <div class="container" id="description">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center" style="margin-top:370px;">

                    <h1 class="fonttype1 text-shadows">Get Online Claims For Your Expences</h1>
                    <h3 class="fonttype2 text-shadows">We Pay Your Claims In Online.Nothing To Do.Follow Us.</h3>
                    <!--	<img src="images/icon/images.png" alt="button"   onClick="document.getElementById('feature').scrollIntoView();" style="cursor:pointer;">-->
                    <a href="#feature" class="btn btn-circle page-scroll">
                        <i class="fa fa-angle-double-down animated"></i>
                    </a>

                </div> 
            </div>	 <!-- for row-->
        </div> <!-- for container-->




        <!-- Layer of features window--> 
        <div class="container-fluid featurediv "  id="feature" >
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-4"><h1 class="h1 fonttype2" style="font-size:35px;color:#000000;" >Features</h1></div>

            </div>
            <div class="row" style="margin-top:20px;" >
                <div class="col-md-6">
                    <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center layerfeature" >

                        <h2 class="fonttype3" > Food Claims</h2>

                        <img class="img-responsive center-block" src="images/icon/food_logo_7.png" alt="food logo" >

                        <h2 class="fonttype4"> Get Back Your Food Expenses<br>Daily your food chargers can collect via system.Upload your food bills and collect your chargers on Accounting Division.<br>&nbsp;&nbsp;&nbsp;</h2>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center layerfeature " >
                        <h2 class="fonttype3" > Internet Bills</h2>
                        <img class="img-responsive center-block" src="images/icon/mobile_logo_4.png" alt="Internet Claims" >
                        <h2 class="fonttype4" > Get back your Internet claims.<br>Monthly your Internet chargers can collect via system.Upload your Internet bills and collect your chargers on Accounting Division.</h2>


                    </div>

                </div>


            </div><!-- for row-->
        </div><!-- for Container fluid-->


        <div class="container-fluid signupdiv" id="middle"  ><!-- Layer of sign up window--> 

            <!--      <div class="page-header">
                    <div class="row ">
                        <div class="col-md-3" style="left: -2px; top: 4px">
                        
                            <div class="row">
                                    <div class="col-md-2">
                                             <img src="images/icon/icon-newspaper .png" alt="signup_image" ><!-- Signup image in sign up window--> 
            <!--              		</div>
                                 <div class="col-md-8">
                                                                 <div class="label" style="font-size:25px;">Sign Up</div>
                                                                                         
                                 </div>
                         </div>
                     </div>
                 </div><!-- for row-->

            <!--        </div> <!-- for container-->

            <div class="row">
                <div class="col-md-8">
                    <!-- Simple Login - START -->

                    <div class="page-header">
                        <div class="row ">
                            <div class="col-md-3" style="left: -2px; top: 4px">

                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="images/icon/icon-newspaper .png" alt="signup_image" ><!-- Signup image in sign up window--> 
                                    </div>
                                    <div class="col-md-8">
                                        <div class="label" style="font-size:20px;">&nbsp;&nbsp;&nbsp;Sign-up </div>

                                    </div>
                                </div>
                            </div>
                        </div><!-- for row-->

                    </div> <!-- for container-->




                    <!-- Sign Up form using div tags START-->

                    <div class="row">
                        <form action="AddEmployee" method="post" >   <!-- Start Form-->

                            <div class="col-md-6"> <!-- Start of main two coloumn left-->

                                <div class="row"><!-- first row on left -->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">First Name &nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input name="fname" type="text" class="form-control input-lg" placeholder="First Name*">
                                        </div>
                                    </div>
                                </div><!-- first row end -->

                                <div class="row" style="margin-top:20px;"><!-- Second row on left -->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Password &nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input name="password" type ="password" class="form-control input-lg" placeholder="Password*"  id="pass1">
                                        </div>
                                    </div>
                                </div><!-- Second row end -->

                                <div class="row" style="margin-top:20px;"><!-- Third row on left-->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Confirm Password &nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input name="password2" type="password" class="form-control input-lg" placeholder="Confirm Password*"  id="pass2" onkeyup="checkPass();">
                                        </div>
                                    </div>
                                </div><!-- Third row end -->

                                <div class="row"  style="margin-top:20px;"><!-- Forth row start on left-->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Employee ID&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input name="empid" type="text" class="form-control input-lg" placeholder="Employee ID*">
                                        </div>
                                    </div>
                                </div><!-- Forth row end -->



                            </div><!-- end of main two coloumn left-->

                            <div class="col-md-6"><!-- Start of main two coloumn Right-->

                                <div class="row"><!-- First row Start on right -->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Last Name&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <input name="lname" type="text" class="form-control input-lg" placeholder="Last Name*">
                                        </div>
                                    </div>
                                </div><!-- First row end -->


                                <div class="row" style="margin-top:20px;"><!-- Secend row Start on right -->
                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Designation&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <select class="dropdown_signup" name="designation" id="designation"> 
                                                <option value="-1">Designation*</option>
                                                <option value="1">Project Manager</option>
                                                <option value="2">Business Architecture</option>
                                                <option value="3">Software Engineer</option>
                                                <option value="4">System Developer</option>
                                                <option value="5">UI Designer</option>
                                                <option value="6">UI Engineer</option>
                                                <option value="7">Quality Assurancer </option>
                                            </select>

                                        </div>
                                    </div>
                                </div><!-- Seceond row end -->

                                <div class="row"  style="margin-top:20px;"><!-- Third row start on Right-->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Reporting AGM&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <select class="dropdown_signup" name="agm" id="agm">
                                                <option value="-1">Reporting AGM*</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                                <option value="4">Option 4</option>
                                                <option value="5">Option 5</option>
                                                <option value="6">Option 6</option>
                                                <option value="7">Option 7 </option>
                                            </select>

                                        </div>
                                    </div>
                                </div><!-- third row end -->

                                <div class="row"  style="margin-top:20px;"><!-- forth row start on Right-->

                                    <div class="col-md-4 margin_sign_up">
                                        <div class="label">Reporting PM&nbsp;:</div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <select class="dropdown_signup" name="proman" id="pm">
                                                <option value="-1">Reporting Project Manager*</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                                <option value="4">Option 4</option>
                                                <option value="5">Option 5</option>
                                                <option value="6">Option 6</option>
                                                <option value="7">Option 7 </option>
                                            </select>

                                        </div>
                                    </div>
                                </div><!-- forth row end -->

                                <div class="row" style="margin-top:20px;margin-bottom:10px;"><!-- Fifth row start on Right-->

                                    <div class="col-md-7"></div>
                                    <div class="col-md-4">
                                        <div class="form-group  "><!-- Sign up button-->

                                            <button type="submit" class="btn  button  signup">
                                                <span class=" glyphicon glyphicon-upload"></span> 
                                                Sign Up</button>

                                        </div>



                                    </div>



                                </div><!-- Fifth row end -->


                            </div><!-- end of main two coloumn right-->

                        </form> <!-- End Form-->
                    </div><!-- End row-->

                    
                </div><!-- for left corner col md 4-->


                <div class="col-md-4  descriptiondiv">
                    <p></p>
                    <p style="color:#FFFFFF;margin-top:inherit;margin-top:30px;text-align:center;"><!--Description in here--> 
                        &nbsp;&nbsp;Welcome to Pearson Claim Management System.<br></p>

                    

                    <p style="color:#FFFFFF;margin-top:inherit;margin-left:40px;margin-bottom:44px;">Each employee has their own accounts. They can request their food and internet claims through those accounts and they can attach scanned copies of their bills with that claim request. They can select their project manager and then, that request goes to their project manager (PM). After the acceptation of PM the accepted claim request goes to the AGM. Finally, the AGM accepted request goes to the finance division, the admin of this system. Final decision is taken by finance division. At each step, the current process will notify to the employee and to the relevant manager. Not only that, a commenting process and a resubmitting process for the rejected requests also there.</p>
                </div>

            </div><!-- for row-->


        </div><!--Authorizing layer-->

        <div class="container-fluid authorizeddiv" >
            <div><h3 class="fonttype2" style="font-size:14px;text-align:right;"> Copy Right 2014 Pearson PLC</h3></div><!--Authorizing--> 
        </div>


        <!-- Load js libs only when the page is loaded. -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--  <script src="js/modernizr.custom.72241.js" type="text/javascript"></script>-->
        <script src="js/index.js" type="text/javascript"></script>
        <script src="js/jquery.easing.min.js" type="text/javascript"></script>





        <!-- Custom template scripts -->
        <!--   <script src="js/magister.js" type="text/javascript"></script>-->

    </body>
</html>

