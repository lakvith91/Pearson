<%-- 
    Document   : admin_view_edit_password
    Created on : Jul 17, 2015, 9:16:20 PM
    Author     : Lakshan
--%>

<%@page import="com.beans.Notifications"%>
<%@page import="com.beans.Projects"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.beans.Employee"%>
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">

        <!-- Java Script link -->
        <script type="text/javascript" language="javascript" src="js/dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/browserLogo.png">  
        <script type="text/javascript" >
            $(document).ready(function () {
                $("#adminSection").show();
                $("#employeeSection").hide();


                $("input[name$='user_role']").click(function () {
                    var test = $(this).val();
                    if (test == "Employee") {
                        $("#adminSection").hide();
                        $("#employeeSection").show();
                    } else {
                        $("#adminSection").show();
                        $("#employeeSection").hide();

                    }
                });


            });
            $(document).ready(function () {

                $("#newPass2").keyup(function () {
                    $("#confirmMessage").empty();
                    $("#newPass").empty();

                    var newPass = $("#newPass").val();
                    var newPass2 = $("#newPass2").val();

                    var goodColor = "#66cc66";
                    var badColor = "#ff6666";
                    if (newPass == newPass2) {
                        $("#changePass").prop("disabled", false);
                        $("#newPass2").css("background-color", goodColor);


                    } else {
                        $("#newPass2").css("background-color", badColor);
                        $("#confirmMessage").css("color", badColor);
                        $("#confirmMessage").append("Passwords Do Not Match");
                        $("#changePass").prop("disabled", true);
                    }
                });


                $("#changePass").click(function () {
                    var oldPass = $("#currentPass").val();
                    var newPass = $("#newPass").val();
                    var userEmail = $("#adminEmail").val();
                    $.ajax({
                        type: "POST",
                        url: "ChangePassword",
                        data: "oldPass=" + oldPass + "&newPass=" + newPass + "&userEmail=" + userEmail,
                        success: function (data) {
                            if (data != "done") {
                                $("#msg").append("Old Password is Incorrect");
                            } else {
                                $("#msg").append("Password Sucessfully Changed");

                            }

                        }
                    });

                });



                $("#resetPass").click(function () {
                    $("#doneMsg").append("please wait...!");
                    var userEmail = $("#userEmail").val();
                    $.ajax({
                        type: "POST",
                        url: "ForgetPassword",
                        data: "username=" + userEmail,
                        success: function (data) {
                            $("#doneMsg").empty();
                            $("#doneMsg").append("User Password Sucesfully Reset");
                            $("#doneMsg").css("color", "#66cc66");

                        }
                    });

                });

            });


            $(document).ready(function () {

                $("a.dellink").click(function () {



                    $.ajax({
                        type: "POST",
                        url: "DeleteValues",
                        data: "id=" + proId + "&table=" + "projects&fieldName=" + "projid",
                        success: function () {
                            //alert(data);
                            document.location.href = "admin_view_add_projects.jsp";
                        }
                    });
                });
            });
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
            });



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
                        <li><a href="admin_view_add_users.jsp"><i class="fa fa-table"></i>&nbsp; Add User Accounts</a></li>
                        <li><a href="admin_view_edit_users.jsp"><i class="fa fa-times"></i>&nbsp; Edit/Remove User Account</a></li>
                        <li class="active"><a href="admin_view_edit_password.jsp"><i class="fa fa-wrench"></i>&nbsp; Change User Password</a></li>
                        <li ><a href="admin_view_add_projects.jsp"><i class="fa fa-bars"></i> &nbsp;Add Current Projects</a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bar-chart"></i>&nbsp;Admin Statistics <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="admin_view_dashboard.jsp"><i class="fa fa-users"></i> &nbsp;General Statistics</a></li>
                                <li><a href="admin_view_individual_statistic.jsp"><i class="fa fa-user"></i> &nbsp;Individual Statistics </a></li>
                            </ul>            
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown messages-dropdown">
                            <a href="#" class="notifylink" data-empid="Admin"  class="dropdown-toggle" data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
                                <span id="noOfNotify" class="label label-warning"> <%=notifycoll.count(notifyFill)%></span> <b class="caret"></b></a> <ul class="dropdown-menu">
                                <li class="message-preview">

                                    <%      while (notifycursor.hasNext()) {// start of while loop 
                                            DBObject dBObject4 = notifycursor.next();
                                            Notifications noti = Notifications.fromDBObject(dBObject4);
                                            String list = noti.getMessage();

                                    %>
                                    <a href="<%= noti.getUrl()%>">
                                        <span class="avatar"><i class="fa fa-bell"></i></span>
                                        <span class="message"><%= list%></span>
                                    </a>
                                    <% }%>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" >&nbsp; <%= user.getEmail()%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li style="margin-left:5px;"><p></p></li>
                                <form action="Logout" method="post" >
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
                        <h2>Change User Passwords</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can reset user passwords as employees' request  
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2"> </div>
                    <div class="col-lg-8">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-wrench"></i>&nbsp;Reset User Passwords  </h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-lg-2"></div>

                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="user_role" id="user_role"  value="Admin" checked="checked"  >&nbsp;&nbsp;Admin</label>
                                </div>
                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="user_role" id="user_role"  value="Employee">&nbsp;&nbsp;Employee</label>

                                </div>

                                <div class="col-lg-12" id="adminSection">
                                    <form   class="form-control-static marginedit"  method="post" >
                                        <div class="form-group row margin_form">
                                            <label class="col-lg-4 control-label" style="text-align:right">Current Password &nbsp;:</label>
                                            <div class="col-lg-6">
                                                <input class="form-control" type="password" value="" name="currentPass" id="currentPass">
                                                <input class="form-control" type="hidden" value="<%= user.getEmail()%>" name="adminEmail" id="adminEmail">
                                            </div>
                                        </div>
                                        <div class="form-group row  ">
                                            <label class="col-lg-4 control-label " style="text-align:right">New Password &nbsp;:</label>
                                            <div class="col-lg-6">
                                                <input class="form-control" type="password" value="" name="newPass" id="newPass">
                                            </div>
                                        </div>
                                        <div class="form-group row  ">
                                            <label class="col-lg-4 control-label " style="text-align:right">Retype New Password &nbsp;:</label>
                                            <div class="col-lg-6">
                                                <input class="form-control" type="password" value="" name="newPass2" id="newPass2">
                                                <span id="confirmMessage" class="confirmMessage"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row  ">
                                            <div class="col-lg-2"></div>

                                            <div class="col-lg-6"><h4><span id="msg" class="label label-danger"></span></h4></div>
                                        </div>
                                        <div class="form-group row margin_form">
                                            <label class="col-md-8 control-label"></label>
                                            <div class="col-md-3">
                                                <button class="btn btn-primary active button" id="changePass"><!--Add button -->
                                                    <span class="fa fa-repeat"></span>&nbsp;&nbsp;&nbsp;Reset
                                                </button>         	
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-12" id="employeeSection">
                                    <div class="row">
                                        <div class="form-group row margin_form">
                                            <label class="col-lg-4 control-label" style="text-align:right">Employee Email &nbsp;:</label>
                                            <div class="col-lg-6">

                                                <select class="dropdown_signup form-control" placeholder="" name="userEmail" id="userEmail" style="height:30px;"> 
                                                    <option value=""></option>
                                                    <%

                                                        DBCollection coll2 = dbcon.getData("employee");
                                                        BasicDBObject search = new BasicDBObject("designation", new BasicDBObject("$ne", "1"));
                                                        DBCursor cursor2 = coll2.find(search);

                                                        while (cursor2.hasNext()) {// start of while loop 
                                                            String list = cursor2.next().get("email").toString();
                                                    %>

                                                    <option value="<%= list%>"><%= list%>
                                                    </option>

                                                    <% }%> // end of while loop
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-8">
                                            <span id="doneMsg" class=""></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-5" style="margin-top: 30px;">
                                            <button id="resetPass" title="Password Reset"  class="btn btn-success button pull-right " style="margin-top:10px;width:70%;"  ><!--Add button -->
                                                <span class="fa fa-repeat"></span>&nbsp;Reset Password
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>     
                </div ><!-- End row-->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </body>
</html>
