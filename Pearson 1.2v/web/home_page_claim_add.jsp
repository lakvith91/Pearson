<%-- 
    Document   : home_page_claim_add
    Created on : Jan 13, 2015, 8:43:36 PM
    Author     : Lakshan
--%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.beans.Claims"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.dbops.DBcon"%>
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


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="js/html5shiv.js"></script>
            <script src="js/respond.min.js"></script>
        <![endif]-->

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

                    <div class="thumbnail " >
                        <!--    <div class="thumbnail marginedit thambaline_inner" style="background-image:url('images/background.png');background-repeat:no-repeat;"> <!--Inside thumbanil-->

                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">	
                                <p class="lead marginedit text-center text-primary" style="font-size:25px;margin-top: 30px"> New Claim Request</p>
                            </div>

                        </div>

                        <div ><!--Start div point of form-->

                            <form  action="AddClaim" class="form-control-static marginedit" name="myClaimForm" method="post" ><!--Start point of form-->

                                <div class="row marginedit mar-top_1"><!-- row number 1 -->

                                    <div class="col-md-6">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-4">
                                            <label id="bulk_id" class="label  labelstyle_1">Bulk ID &nbsp;:</label>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <label id="bulk_id" class="label labelstyle_1 label-default ">001</label>

                                            </div>	
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <label id="claim_id" class="label labelstyle_1">Claim ID &nbsp;:</label>
                                        </div>
                                        <div class="col-md-4">

                                            <label id="claim_id " class="label labelstyle_1  label-default">001</label>


                                        </div>
                                    </div>

                                </div>  <!--end of row number 1-->

                                <div class="row marginedit mar-top_1"><!-- row number 2 -->

                                    <div class="col-md-6">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-4">
                                            <label id="type_of_claim" class="label labelstyle_1">Claim Type &nbsp;:</label>
                                        </div>
                                        <div class="col-md-6 " >

                                            <select id="type_of_claim" name="type_of_claim" class="dropdown_signup form-control" placeholder="Claim Type" style="height:37px;">
                                                <option value="Null">~~Select~~</option>
                                                <option value="Food Bills"> Food Bills</option>
                                                <option value="Internet Bills"> Internet Bills</option>

                                            </select>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <label id="project" class="label labelstyle_1">Project &nbsp;&nbsp;&nbsp;&nbsp;:</label>
                                        </div>
                                        <div class="col-md-7">
                                            <select id="project" name="project" class="dropdown_signup form-control" placeholder="Claim Type" style="height:37px;">
                                                <option value="0">~~Select~~</option>
                                                <option value="Project 1"> Project 1</option>
                                                <option value="Project 2">Project 2</option>
                                                <option value="Project 3">Project 3</option>
                                                <option value="Project 4">Project 4</option>



                                            </select>

                                        </div>
                                    </div>

                                </div>  <!--end of row number 2-->

                                <div class="row marginedit mar-top_1"><!-- row number 3 -->

                                    <div class="col-md-6">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-4">
                                            <label id="billdate" class="label labelstyle_1">Bill Date &nbsp;:</label>
                                        </div>
                                        <div class="col-md-5">
                                            <input  id="datepicker" name="bill_date" class="form-control input-lg" type="text" placeholder="MM/DD/YY" >
                                        </div>
                                        <div class="col-md-1">
                                            <img src="images/icon/calendar (1).png"alt="aaaa" style="height:20px;width:auto;cursor:pointer;" id="calendar">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <label id="event_date" class="label labelstyle_1">Event Date &nbsp;:</label>
                                        </div>
                                        <div class="col-md-6">
                                            <input  id="datepicker_1" name="event_date" class="form-control input-lg" type="text" placeholder="MM/DD/YY" >
                                        </div>
                                        <div class="col-md-1">
                                            <img src="images/icon/calendar (1).png"alt="aaaa" style="height:20px;width:auto;cursor:pointer;" id="calendar_1">
                                        </div>

                                    </div>

                                </div>  <!--end of row number 3-->

                                <div class="row marginedit mar-top_1"><!-- row number 4 -->

                                    <div class="col-md-6">
                                        <div class="col-md-2"></div>

                                        <div class="col-md-4">
                                            <label id="project" class="label labelstyle_1">Amount &nbsp;:</label>
                                        </div>
                                        <div class="col-md-6">
                                            <input name="amount" class="form-control input-lg" type="text" placeholder="Amount" >


                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <label id="attachment" class="label labelstyle_1">Attachment &nbsp;:</label>
                                        </div>
                                        <div class="col-md-7">
                                            <input id="attachment" name="attachment"  type="file"  onchange="show_pic(this)" placeholder="Attachment" >
                                            <img style="width: 150px; height: auto;margin-left:20px" id="reg_pro_pic1">


                                        </div>
                                    </div>

                                </div>  <!--end of row number 4-->

                                <div class="row marginedit mar-top_1"><!-- row number 5 -->
                                    <button type="submit" class="btn btn-danger active button pull-right " style="width:20%;margin-top:10px;" onclick = "AddData()" ><!--Add button -->
                                        <span class="glyphicon glyphicon-th"></span>&nbsp;Add
                                    </button>


                                </div>

                          </form>
                        </div><!--End div point of form-->
                    </div><!--Inside thumbanil-->
                    <div class="thumbnail">
                    <div class="table-responsive marginedit">



                        <table class="table table-bordered tableStyle" >
                            <thead align="center" >
                                <tr>
                                    <td>&nbsp;Claim ID</td>
                                    <td>&nbsp;Claim Type</td>
                                    <td>&nbsp;Bill Date</td>
                                    <td>&nbsp;Event Date</td>
                                    <td>&nbsp;Project</td>
                                    <td>&nbsp;Amount</td>
                                    <td>&nbsp;Attachment</td>
                                    <td>&nbsp;Status</td>

                                </tr>
                            </thead>
                            <tbody id="list tbody" name="list tbody">
                                <%
                                    DBcon dbcon = new DBcon();
                                    dbcon.getDbCon();// setup the database connection
                                    DBCollection coll = dbcon.getData("claimss");

                                    DBCursor cursor = coll.find();
                                    String tableInner = "";

                                    while (cursor.hasNext()) {
                                        DBObject dbo = cursor.next();
                                        Claims c = Claims.fromDBObject(dbo);

                                        tableInner += "<tr>";
                                        tableInner += "<td>" + c.getClaimId() + "</td>";
                                        tableInner += "<td>" + c.getBillType() + "</td>";
                                        tableInner += "<td>" + c.getBillDate() + "</td>";
                                        tableInner += "<td>" + c.getEventDate() + "</td>";
                                        tableInner += "<td>" + c.getProject() + "</td>";
                                        tableInner += "<td>" + c.getAmount() + "</td>";
                                        tableInner += "<td>" + c.getAttachment() + "</td>";
                                        tableInner += "<td>" + c.getStatus() + "</td>";
                                        tableInner += "</tr>";
                                    }


                                %>

                                <%=tableInner%>


                            </tbody>
                        </table>
			</div>	
				             <div class="row marginedit mar-top_1"><!-- row number 5 -->
							<button type="submit" class="btn btn-primary button pull-right " style="width:20%;margin-top:10px;"  ><!--Add button -->
									<span class="glyphicon glyphicon-th"></span>&nbsp;Submit
							</button>
							
              		
              		</div>


                    </div>	
                                
                  <!--  <div class="container-fluid"><!-- for Submit button--> 
                    <!--    <div class="row">
                            <div class="col-md-8"></div>
                            <div class="col-md-4" >
                                <button type="submit" class="btn  btn-primary active button marginedit" style="width:37%;margin-left:45px;"  ><!--Add button -->
                      <!--              <span class="glyphicon glyphicon-th"></span>&nbsp;Submit
                                </button>
                            </div>
                            </div>
                      <!--  </div><!-- for row--> 
                    </div><!-- for end of Submit button--> 
                </div><!-- end of out side thumbnail-->
            </div><!-- for col md 9-->  


        </div>   <!-- for container-->                  









        <script src="js/jquery.js" type="text/javascript"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>


    </body>


