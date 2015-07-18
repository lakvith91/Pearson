<%-- 
    Document   : home_page_edit_profile
    Created on : Jan 13, 2015, 9:09:09 PM
    Author     : Lakshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="">

        <title>Home Page Edit Profile</title>

        <link rel="shortcut icon" href="images/icon/logo.png">


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">

        <!-- Custom CSS -->
        <link href="css/homepage.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">

        <!-- Css file for calender -->

        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">




        <!-- Java script for calender -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>


        <script language="javascript" type="text/javascript">

            function btntest_onclick() 					//new claim button onclick function
            {
                window.location.href = "home_page_claim_add.jsp";
            }


            var xx = 0;

            function show_pic(input) { 					//to add image
                //alert(input.files[0]);
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    //alert(xx);
                    reader.onload = function(e) {
                        xx++;
                        $('#reg_pro_pic' + xx).attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
                // alert(input.files[0]);
            }

            $(function() {							//to reset date to the BIRTH DATE input field

                $("#calendar").click(function() {	//click image then reset date function
                    $('#datepicker').datepicker('setDate', null);
                });
            });

            $(function getdate() {				//to add date to the BIRTH DATE input field

                $("#datepicker").datepicker();//datepicker function
            });

            $(function() {							//to reset date to the Work Since input field

                $("#calendar_1").click(function() {	//click image then reset date function
                    $('#datepicker_1').datepicker('setDate', null);
                });
            });

            $(function getdate() {					//to add date to the Work Since input field

                $("#datepicker_1").datepicker();//datepicker function
            });


        </script>




    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="height:65px;">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                    </button>
                    <img src="images/PEARSON_logo_1.png" alt="Company Logo" >
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1" style="margin-top:8px;">

                    <ul class="nav navbar-nav">
                        <li>
                            <a href="#"> <h3 class="navigation_heading"> <span class="glyphicon glyphicon-user"></span> &nbsp;Emp Name </h3> </a>
                        </li>     

                        <li>
                            <a href="home_page.jsp"> <h3 class="navigation_heading"> <span class="glyphicon glyphicon-home"></span> &nbsp;Home </h3> </a>
                        </li>

                        <li>
                            <a href="index.jsp"> <h3 class="navigation_heading"> Sign Out  </h3> </a>

                        </li>


                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->

        <div class="container" style="margin-top:30px;" >

            <div class="row">

                <div class="col-md-3" > <!--news feed column -->
                    <div class="thumbnail"> <!--for boader -->

                        <p class="lead marginedit">News Feed</p>
                        <div class="dropdown">
                            <button  class="btn btn-primary button marginedit  "  id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                                Notification&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="glyphicon glyphicon-envelope" ></span>   <!-- Noticication message icon -->
                                <span class="badge" style="margin-left:65px;">2+</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li> Notification 1</li>
                                <li> Notification 2</li>
                                <li> Notification 3</li>
                                <li> Notification 4</li>



                            </ul>
                        </div>
                       
                        <div class="list-group marginedit" style="margin-bottom:18px;">
                            <a href="#" class="list-group-item active" style="height:35px;">
                                Edit Profile &nbsp;&nbsp;
                                <span class="glyphicon glyphicon-cog"></span>   <!-- Noticication message icon -->
                            </a>
                        </div>
                    </div><!-- for thumbnail-->

                    <div class="thumbnail" style="margin-top:100px;">
                        <p class="lead marginedit">Event</p>

                        <div class="btn width-btn" style="margin-top:10px;" >
                            <button type="button" class="btn btn-success button width-btn  "  value="Check"  onclick="return btntest_onclick()"><!-- login button of login popup window -->
                                <span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>
                        </div>
                        <div class="btn width-btn" style="margin-bottom:10px;">
                            <button type="button" class="btn btn-danger button width-btn"  ><!-- login button of login popup window -->
                                <span class="glyphicon glyphicon-th"></span>&nbsp;Claim History</button>
                        </div>

                    </div>

                </div><!-- for col md 3-->  

                <div class="col-md-9">  <!-- form field column-->


                    
                    <div class="thumbnail thambaline_inner" > <!--Inside thumbanil-->

                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">	
                                <p class="lead marginedit text-center text-primary" style="font-size:25px;margin-top: 30px;"> Genaral Account Settings</p>
                            </div>

                        </div>




                        <form  class="form-control-static marginedit" name="myClaimForm" method="post" ><!--Start point of form-->


                            <div class="row marginedit mar-top"><!-- row number 1-->
                                <div class="col-md-2"></div>
                                <div class="col-md-2">
                                    <label id="fname" class="label labelstyle">First Name &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input name="fname" id="fname" class="form-control input-lg" type="text" >
                                        <span class="input-group-btn">
                                            <button class="btn btn-group btn-default active input-lg" type="reset">Edit
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 1-->

                            <div class="row marginedit mar-top"><!-- row number 2-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label  class="label labelstyle">Last Name &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input name="lname" id="lname" class="form-control input-lg" type="text" >
                                        <span class="input-group-btn">
                                            <button class="btn btn-group btn-default active input-lg" type="reset">Edit
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 2-->
                            
                            <div class="row marginedit mar-top"><!-- row number 3-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2 ">
                                    <label  class="label labelstyle">Gendar &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group" style="width:50%;">
                                        <select class="dropdown_signup form-control" id="gendar" name="gendar">
                                            <option value="-1">~~Select~~</option>
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                           
                                        </select>

                                    </div>
                                </div>
                            </div>  <!--end of row number 3-->
                            
                            <div class="row marginedit mar-top"><!-- row number 4-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label  class="label labelstyle">Email &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input name="email" id="email" class="form-control input-lg" type="text" >
                                        <span class="input-group-btn">
                                            <button class="btn btn-group btn-default active input-lg" type="button">Edit
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 4-->

                            <div class="row marginedit mar-top"><!-- row number 5-->
                                <div class="col-md-2"></div>
                                <div class="col-md-2">
                                    <label class="label labelstyle">Mobile Number &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input name="mob_no" id="mob_no" class="form-control input-lg" type="text" >
                                        <span class="input-group-btn">
                                            <button class="btn btn-group btn-default active input-lg" type="button">Edit
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 5-->



                            <div class="row marginedit mar-top"><!-- row number 6-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label  class="label labelstyle">Password &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input name="pwd" id="pwd" class="form-control input-lg" type="password" >
                                        <span class="input-group-btn">
                                            <button class="btn btn-group btn-default active input-lg" type="button">Edit
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 6-->

                            <div class="row marginedit mar-top"><!-- row number 7-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label  class="label labelstyle">Birth Date &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input  id="datepicker" class="form-control input-lg" type="text">

                                        <span class="input-group-btn">
                                            <!--<button class="btn btn-group btn-default active input-lg " type="button">
                                            <!-- <span class="glyphicon glyphicon-pencil"></span>-->
                                            <img src="images/icon/calendar (1).png" alt="calendar_icon" style="height:28px;width:auto;cursor:pointer;" id="calendar">
                                            <!--</button>-->
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 7-->

                            <div class="row marginedit mar-top"><!-- row number 8-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label  class="label labelstyle">Work Since &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input  id="datepicker_1" class="form-control input-lg" type="text">

                                        <span class="input-group-btn">
                                            <!--<button class="btn btn-group btn-default active input-lg " type="button">
                                            <!-- <span class="glyphicon glyphicon-pencil"></span>-->
                                            <img src="images/icon/calendar (1).png"alt="calendar_icon" style="height:28px;width:auto;cursor:pointer;" id="calendar_1">
                                            <!--</button>-->
                                        </span>
                                    </div>	
                                </div>
                            </div>  <!--end of row number 8-->

                            <div class="row marginedit mar-top"><!-- row number 9-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2 ">
                                    <label  class="label labelstyle">Reporting AGM &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group" style="width:100%;">
                                        <select name="agm" id="agm" class="dropdown_signup form-control">
                                            <option value="-1">~~Select~~</option>
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
                            </div>  <!--end of row number 9-->
                            
                            <div class="row marginedit mar-top"><!-- row number 10-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2 ">
                                    <label  class="label labelstyle">Reporting PM &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group" style="width:100%;">
                                        <select name="pm" id="pm" class="dropdown_signup form-control" >
                                            <option value="-1">~~Select~~ </option>
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
                            </div>  <!--end of row number 10-->


                            <div class="row marginedit mar-top"><!-- row number 11-->
                                <div class="col-md-2"></div>

                                <div class="col-md-2">
                                    <label id="first_name" class="label labelstyle">Profile Picture &nbsp;:</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group" style="width:100%;">
                                        <input name="img" id="img" type="file" onchange="show_pic(this)">
                                        <img style="width: 150px; height: auto;" id="reg_pro_pic1">
                                    </div>
                                </div>  <!--end of row number 10-->



                                <div class="col-md-6"></div>
                                <div class="col-md-6 mar-top">
                                    <div class="row" ><!-- row number 10 inside row-->
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
                                                <span class="glyphicon glyphicon-ok"></span>&nbsp;Save Changes</button>
                                        </div>
                                        <div class="col-md-6 ">
                                            <button type="reset" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
                                                <span class="glyphicon glyphicon-remove"></span>&nbsp;Clear</button>
                                        </div>



                                    </div> <!--end of row number 10 inside row-->
                                </div>
                            </div> <!--end of row number 10-->

                        </form><!--end point of form-->
                    </div>
                </div><!--end of div form layer-->


            </div><!-- for col md 9-->  


        </div>   <!-- for container-->              
        
        <script src="js/jquery.js" type="text/javascript"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>


    </body>


