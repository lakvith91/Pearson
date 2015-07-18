<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>

<%@page import="com.beans.Notifications"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.beans.Employee"%>
<%@page import="com.dbops.DBcon"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Person Claim Management System Administrator View</title>
        <!--CSS file link-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >
        <!--JS file link-->
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/jQuery v1.9.1.js"></script>
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

            });
            $(document).ready(function () {

                $("#deleteUser").click(function () {
                    var empid = $("#empid").val();

                    var ask = window.confirm("Are you sure want to Delete User?");
                    if (ask == true) {
                        $.ajax({
                            type: "POST",
                            url: "DeleteUsers",
                            data: "empid=" + empid,
                            success: function () {
                                alert(data);
                                document.location.href = "admin_view_edit_users.jsp";

                            }
                        });
                    }

                });

            });


            $(document).ready(function () {

                $("#search").click(function () {

                    var email = $("#searchId").val();

                    $.ajax({
                        type: "POST",
                        url: "SearchEmp",
                        data: "email=" + email,
                        success: function (data) {

                            var json = JSON.parse(data);

                            $("#fname").val(json["fname"]);
                            $("#lname").val(json["lname"]);
                            $("#empid").val(json["empid"]);
                            $("#email").val(json["email"]);
                           
                            $("#agm").val(json["agm"]);
                            $("#pm").val(json["proman"]);
                            $("#designation").val(json["designation"]);
                            $("#project").val(json["project"]);

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

            //Employee emp = (Employee) request.getSession().getAttribute("semp");
            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database
            DBCollection notifycoll = dbcon.getData("notifications");
            DBCollection coll3 = dbcon.getData("employee");

            BasicDBObject notifyFill = new BasicDBObject("receiver", "Admin");
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            String list3 = null;


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
                        <li class="active"><a href="admin_view_edit_users.jsp"><i class="fa fa-times"></i>&nbsp; Edit/Remove User Account</a></li>
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
                                <span id="noOfNotify" class="label label-warning"> <%=notifycoll.count(notifyFill)%></span> <b class="caret"></b></a> <ul class="dropdown-menu">
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" > <%= user.getEmail()%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
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
                        <h2>Edit/Remove User Account</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-8"></div>
                    <div class="col-md-4">

                        <div class="input-group custom-search-form">
                            <input id="searchId" name="searchId" type="text" class="form-control" placeholder="Enter Employee's Email">
                            <span class="input-group-btn">
                                <button id="search" class="btn btn-default">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>

                    </div>
                </div>
                <div class="row" style="margin-top:10px;">
                    <div class="col-lg-12">
                        <div class="panel panel-success">
                            <div class="panel-heading ">
                                <h2 class="panel-title">
                                    <i class="fa fa-table"></i>&nbsp; Employee Details  
                                </h2> 
                            </div>
                            <div class="panel-body">
                                <div id="setHere">
                                    <form action="EditEmployeeAdmin" method="post" >    
                                        <div class="col-md-6"> <!-- Start of main two coloumn left-->
                                            <div class="row"><!-- first row on left -->
                                                <div class="col-md-4">
                                                    <div class="label label_1">First Name &nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <input id="fname" name="fname" placeholder="First Name" value="" type="text" class="form-control input-lg"  >
                                                    </div>
                                                </div>
                                            </div><!-- first row end -->
                                           
                                            <div class="row" style="margin-top:25px;"><!-- Third row on left-->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">Project&nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <select class="dropdown_signup form-control" placeholder="Project" name="project" id="project" style="height:30px;"> 
                                                            <option value=""></option>
                                                            <%

                                                                DBCollection coll2 = dbcon.getData("projects");
                                                                DBCursor cursor2 = coll2.find();

                                                                while (cursor2.hasNext()) {// start of while loop 
                                                                    String list = cursor2.next().get("projname").toString();
                                                            %>

                                                            <option value="<%= list%>"><%= list%>
                                                            </option>

                                                            <% }%> // end of while loop
                                                        </select>
                                                    </div>
                                                </div>
                                            </div><!-- Third row end -->
                                            <div class="row"  style="margin-top:15px;"><!-- Forth row start on left-->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">Employee ID&nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <input readonly id="empid" name="empid" value="" type="text" class="form-control input-lg" placeholder="Employee ID*">
                                                    </div>
                                                </div>
                                            </div><!-- Forth row end -->
                                            <div class="row"  style="margin-top:15px;"><!-- Forth row start on left-->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">E-Mail&nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <input name="email" id="email" value="" type="email" class="form-control input-lg" placeholder="E-Mail*">
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
                                                        <input name="lname" id="lname" value="" type="text" class="form-control input-lg" placeholder="Last Name*" >
                                                    </div>
                                                </div>
                                            </div><!-- First row end -->
                                            <div class="row" style="margin-top:15px;"><!-- Secend row Start on right -->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">Designation&nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <select class="dropdown_signup"  placeholder="Designation" name="designation" id="designation" required> 

                                                            <option value=""></option>
                                                            <option value="4">Employee</option>
                                                            <option value="3">Project Manager</option>
                                                            <option value="2">Assistant  General Manager</option>
                                                            <option value="1">Admin</option>  
                                                        </select>

                                                    </div>
                                                </div>
                                            </div><!-- Second row end -->
                                            <div class="row"  style="margin-top:15px;"><!-- Third row start on Right-->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">Reporting AGM &nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <select class="dropdown_signup" placeholder="Assistant General Manager" name="agm" id="agm">

                                                            <option value=""></option>
                                                            <%

                                                                DBCursor cursor3 = coll3.find(new BasicDBObject("designation", "2"), new BasicDBObject("email", 1));

                                                                while (cursor3.hasNext()) {// start of while loop 
                                                                    list3 = cursor3.next().get("email").toString();
                                                            %>


                                                            <option value="<%= list3%>"><%= list3%>
                                                            </option>

                                                            <% }%> // end of while loop
                                                        </select>
                                                    </div>
                                                </div>
                                            </div><!-- third row end -->
                                            <div class="row"  style="margin-top:15px;"><!-- forth row start on Right-->
                                                <div class="col-md-4 ">
                                                    <div class="label label_1">Reporting PM&nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <select class="dropdown_signup"  placeholder="Project Manager" name="proman" id="pm">
                                                            <option value=""></option>
                                                            <%

                                                                DBCursor cursor4 = coll3.find(new BasicDBObject("designation", "3"), new BasicDBObject("email", 1));

                                                                while (cursor4.hasNext()) {// start of while loop 
                                                                    String list4 = cursor4.next().get("email").toString();
                                                            %>


                                                            <option value="<%= list4%>"><%= list4%>
                                                            </option>

                                                            <% }%> // end of while loop
                                                        </select>                                                      
                                                    </div>
                                                </div>
                                                <div class="col-md-3" ></div>
                                                <div class="col-md-8">
                                                    <div class="row" style="margin-top:15px;"><!-- row number 10 inside row-->
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
                                                                <span class="glyphicon glyphicon-ok"></span>&nbsp;Save Changes</button>
                                                        </div>
                                                        <div class="col-md-6 ">
                                                            <button id="deleteUser" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
                                                                <span class="glyphicon glyphicon-remove"></span>&nbsp;Delete</button>
                                                        </div>
                                                    </div> <!--end of row number 10 inside row-->
                                                </div>
                                            </div><!-- forth row end -->
                                        </div><!-- end of main two column right-->
                                    </form> <!-- End Form-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container" id="claimDetails">
                </div>   
            </div>
        </div>
        <!-- /#wrapper -->
    </body>
</html>
