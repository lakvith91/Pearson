<%-- 
    Document   : home_page
    Created on : Jan 13, 2015, 8:38:31 PM
    Author     : Lakshan
--%>

<%@page import="com.beans.Employee"%>
<%@page import="com.beans.Notifications"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.beans.Claims"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.dbops.DBcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Person Claim Management System Administrator View</title>

        <!-- CSS files link -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/date_picker.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >

        <!-- Java Script link -->
        <script type="text/javascript" language="javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script><!--load data table jquary-->
        <script type="text/javascript" language="javascript" src="js/dataTables.bootstrap.js"></script>
        <script type="text/javascript" language="javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/boostrap_datepicker.js"></script> <!--load calendar jquary-->

        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/browserLogo.png">
        <script type="text/javascript">

            $(document).ready(function () {
                //notifications read
                $("a.notifylink").click(function () {
                    var empId = $(this).data("empid");

                    $.ajax({
                        type: "POST",
                        url: "SetRead",
                        data: "id=" + empId,
                        success: function (data) {
                            $("#noOfNotify").empty();
                            $("#noOfNotify").append("0");
                        }
                    });

                });


                $("#email").blur(function () {
                    var email = $("#email").val();
                    $("#emailvalid").empty();
                    $.ajax({
                        type: "POST",
                        url: "UserDublicate",
                        data: "searchId=" + email,
                        success: function (data) {

                            if (data == "Username is valid") {
                                $("#emailvalid").append(data);
                                $("#emailvalid").css("color", "#228B22");
                                $( "#submitbut" ).prop( "disabled", false );
                            } else {

                                $("#emailvalid").append(data);
                                $("#emailvalid").css("color", "red");
                                
                                 $( "#submitbut" ).prop( "disabled", true );
                            }

                        }
                    });
                });
            });




        </script>
        <script type="text/javascript">
            function randomPass() {

                var text = "";
                var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

                for (var i = 0; i < 8; i++)
                    text += possible.charAt(Math.floor(Math.random() * possible.length));
                   document.getElementById('pass1').value = text;
         
            }


        </script>
    </head>
    <body>
        <%
           Employee user = (Employee) request.getSession().getAttribute("user");
            if (user.equals(null)) {
                response.sendRedirect("index.jsp");
            }
            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database

            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", "Admin");
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);
        %>

        <div id="wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" >            
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><b>Admin DashBoard</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li><a href="admin_view_home.jsp"><i class="fa fa-file-text"></i> &nbsp;New Claim Requests</a></li>
                        <li><a href="admin_view_claim_history.jsp"><i class="fa fa-history"></i>&nbsp; Claim Request History</a></li>
                        <li class="active" ><a href="admin_view_add_users.jsp"><i class="fa fa-table"></i>&nbsp; Add User Accounts</a></li>
                        <li><a href="admin_view_edit_users.jsp"><i class="fa fa-times"></i>&nbsp; Edit/Remove User Account</a></li>
                        <li><a href="admin_view_edit_password.jsp"><i class="fa fa-wrench"></i>&nbsp; Change User Password</a></li>
                        
                        <li><a href="admin_view_add_projects.jsp"><i class="fa fa-bars"></i> &nbsp;Add Current Projects</a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bar-chart"></i>&nbsp;Admin Statistics <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="admin_view_dashboard.jsp"><i class="fa fa-users"></i> &nbsp;General Statistics</a></li>
                                <li><a href="admin_view_individual_statistic.jsp"><i class="fa fa-user"></i> &nbsp;Individual Statistics </a></li>
                            </ul>                      
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown messages-dropdown">
                            <a href="#" class="notifylink" data-empid="Admin"  class="dropdown-toggle" data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
                                <span id="noOfNotify" class="label label-warning"> <%=notifycoll.count(notifyFill)%></span> <b class="caret"></b></a>  <ul class="dropdown-menu">
                                <li class="message-preview">
                                    <%      while (notifycursor.hasNext()) {// start of while loop 
                                            DBObject dBObject4 = notifycursor.next();
                                            Notifications noti = Notifications.fromDBObject(dBObject4);
                                            String list = noti.getMessage();

                                    %>
                                    <a href=<%= noti.getUrl()%>>
                                        <span class="avatar"><i class="fa fa-bell"></i></span>
                                        <span class="message"><%= list%></span>
                                    </a>
                                    <% }%>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" >&nbsp;<%= user.getEmail()%> <b class="caret"> </b></a>
                            <ul class="dropdown-menu">                                
                                <form action="Logout" method="post" >
                                    <li style="margin-left:5px;"><p></p></li>
                                    <li style="margin-left:45px;">                                       
                                        <button type="submit" class="btn btn-danger">
                                            <i class="fa fa-power-off"></i> 
                                            &nbsp;Logout
                                        </button> 
                                    </li>   
                                </form>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>New User Account</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>

                </div>


                <div class="row" style="margin-top:35px;">
                    <!-- Sign Up form -->
                    <form action="AddEmployee" method="post" >   <!-- Start Form-->
                        <div class="col-md-6"> <!-- Start of main two coloumn left-->
                            <div class="row"><!-- first row on left -->
                                <div class="col-md-3">
                                    <div class="label label_1">First Name &nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <input required  name="fname" type="text" class="form-control " placeholder="First Name*">
                                    </div>
                                </div>
                            </div><!-- first row end -->
                            <div class="row" style="margin-top:20px;"><!-- Second row on left -->
                                <div class="col-md-3 ">
                                    <div class="label label_1">Password &nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="input-group">
                                        <input  required  name="password" type ="password" class="form-control" placeholder="Password*"  id="pass1">
                                        <span class="input-group-btn">
                                            <button class="btn btn-info" type="button" onclick="return  randomPass()" ><i class="fa fa-lock">&nbsp;</i>Go</button>
                                        </span>
                                    </div>

                                </div>
                            </div><!-- Second row end -->

                            <div class="row" style="margin-top:25px;"><!-- Third row on left-->
                                <div class="col-md-3 ">
                                    <div class="label label_1">Project &nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <select  id="project" name="project" class="dropdown_signup form-control" placeholder="Claim Type" style="height:37px;">
                                            <option value=""></option>
                                            <%
                                                DBCollection coll = dbcon.getData("projects");
                                                DBCursor cursor = coll.find();

                                                while (cursor.hasNext()) {// start of while loop 
                                                    String list = cursor.next().get("projname").toString();
                                            %>

                                            <option  value="<%= list%>"><%= list%>
                                            </option>

                                            <% }%> // end of while loop
                                        </select>
                                    </div>
                                </div>
                            </div><!-- Third row end -->
                            <div class="row"  style="margin-top:20px;"><!-- Forth row start on left-->
                                <div class="col-md-3 ">
                                    <div class="label label_1">Employee ID&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <input required id="empid" name="empid" type="text" class="form-control input-lg" placeholder="Employee ID*">
                                    </div>
                                </div>
                            </div><!-- Forth row end -->
                            <div class="row"  style="margin-top:10px;"><!-- Forth row start on left-->
                                <div class="col-md-3 ">
                                    <div class="label label_1">E-Mail&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <input required name="email" id="email" type="email" class="form-control input-lg" placeholder="E-Mail*"><strong><span id="emailvalid" style="font-size: 17px;"></span></strong>
                                    </div>

                                </div>
                            </div><!-- Forth row end -->
                        </div><!-- end of main two coloumn left-->
                        <div class="col-md-6"><!-- Start of main two coloumn Right-->
                            <div class="row"><!-- First row Start on right -->
                                <div class="col-md-4">
                                    <div class="label label_1">Last Name&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <input required name="lname" type="text" class="form-control input-lg" placeholder="Last Name*">
                                    </div>
                                </div>
                            </div><!-- First row end -->
                            <div class="row" style="margin-top:20px;"><!-- Secend row Start on right -->
                                <div class="col-md-4 ">
                                    <div class="label label_1">Designation&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <select required class="dropdown_signup" name="designation" id="designation"> 
                                            <option value="">Designation*</option>
                                            <option value="4">Employee</option>
                                            <option value="3">Project Manager</option>
                                            <option value="2">Assistant  General Manager</option>
                                        </select>
                                    </div>
                                </div>
                            </div><!-- Seceond row end -->
                            <div class="row"  style="margin-top:20px;"><!-- Third row start on Right-->
                                <div class="col-md-4 ">
                                    <div class="label label_1">Reporting AGM&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <select  class="dropdown_signup" name="agm" id="agm">
                                            <option value=""></option>
                                            <%
                                                DBCollection coll2 = dbcon.getData("employee");
                                                DBCursor cursor2 = coll2.find(new BasicDBObject("designation", "2"), new BasicDBObject("email", 1));

                                                while (cursor2.hasNext()) {// start of while loop 
                                                    String list2 = cursor2.next().get("email").toString();
                                            %>
                                            <option value="<%= list2%>"><%= list2%>
                                            </option>

                                            <% }%> // end of while loop
                                        </select>
                                    </div>
                                </div>
                            </div><!-- third row end -->
                            <div class="row"  style="margin-top:20px;"><!-- forth row start on Right-->
                                <div class="col-md-4 ">
                                    <div class="label label_1">Reporting PM&nbsp;:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <select  class="dropdown_signup" name="proman" id="pm">
                                            <option value=""></option>
                                            <%

                                                DBCursor cursor4 = coll2.find(new BasicDBObject("designation", "3"), new BasicDBObject("email", 1));

                                                while (cursor4.hasNext()) {// start of while loop 
                                                    String list4 = cursor4.next().get("email").toString();
                                            %>

                                            <option value="<%= list4%>"><%= list4%>
                                            </option>

                                            <% }%> // end of while loop
                                        </select>
                                    </div>
                                </div>
                            </div><!-- forth row end -->
                            <div class="row" style="margin-top:40px;margin-bottom:10px;"><!-- Fifth row start on Right-->
                                <div class="col-md-7"></div>
                                <div class="col-md-4">
                                    <div class="form-group  "><!-- Sign up button-->
                                        <button id="submitbut" type="submit" class="btn  button btn-primary  ">
                                            <span class=" glyphicon glyphicon-upload"></span>&nbsp; 
                                            Create Account</button>
                                    </div>
                                </div>
                            </div><!-- Fifth row end -->
                        </div><!-- end of main two coloumn right-->
                    </form> <!-- End Form-->
                </div><!-- End row--> 
            </div>
    </body>
</html>
