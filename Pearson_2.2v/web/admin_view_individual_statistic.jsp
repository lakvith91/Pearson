<%-- 
    Document   : temp
    Created on : May 24, 2015, 5:34:43 PM
    Author     : Dasun
--%>
<%@page import="com.beans.Employee"%>
<%@page import="com.beans.Notifications"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.dbops.DBcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Person Claim Management System Administrator View</title>
        <!-- For css link -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.css"/>
        <link rel="stylesheet" type="text/css" href="css/admin_view.css"/>
        <link rel="stylesheet" type="text/css" href="css/plugins/morris.css" rel="stylesheet"/><!-- Morris Charts CSS -->        

        <!-- Java Script link -->
        <script type="text/javascript" language="javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.js"></script><!-- jQuery -->
        <!-- Morris Charts JavaScript -->
        <script type="text/javascript" language="javascript" src="js/plugins/morris/raphael.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/plugins/morris/morris.min.js"></script>


        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/browserLogo.png"/> 
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
                
                 $("#search").click(function () {
                        var json=null;
                    var searchid = $("#searchId").val();
                      $("#morris-bar-chart-Individual").empty();
                    $.ajax({
                        type: "POST",
                        url: "IndividualExpense",
                        data: "searchId=" + searchid,
                        success: function (data) {

                             json = JSON.parse(data);
                           // alert(json["foodsum"]);
                           Morris.Donut({
                    element: 'morris-donut-chart-Individual',
                    data: [{
                            label: "Food Expenses",
                            value: json["foodsum"]
                        }, {
                            label: "Internet Expenses",
                            value: json["internetsum"]
                        }, {
                            label: "Other Expenses",
                            value: json["othersum"]
                        }],
                    resize: true
                });

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
            dbcon.getDbCon();
            DBCollection notifycoll = dbcon.getData("notifications");
            DBCollection coll = dbcon.getData("claims");
            DBCollection empColl = dbcon.getData("employee");

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
                        <li><a href="admin_view_edit_password.jsp"><i class="fa fa-wrench"></i>&nbsp; Change User Password</a></li>
                        
                        <li><a href="admin_view_add_projects.jsp"><i class="fa fa-bars"></i> &nbsp;Add Current Projects</a></li>
                        <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bar-chart"></i>&nbsp;Admin Statistics <b class="caret"></b></a>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" > <%= user.getEmail()%> <b class="caret"></b></a>
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
                    <div class="col-md-12">
                        <h2>Individual Statistics</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>                    
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-md-8"></div>
                    <div class="col-md-1">
                        <label class="text-primary text-right" style="margin-top:10px; "> Search :</label>
                    </div>
                    <div class="col-md-3" id="searchByDateDiv" >
                        <div class="input-group custom-search-form">
                            <input id="searchId" name="searchId" type="text" class="form-control" placeholder="Enter Employee's ID">
                            <span class="input-group-btn">
                                <button id="search" class="btn btn-default">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row margin_form">
                    <div class="col-md-12">
                        <div class="col-md-5">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-pie-chart"></i>&nbsp;&nbsp;Amount of Expenses</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-donut-chart-Individual"></div>
                                    <div class="text-center">
                                        <p>Monthly expenses for each claim type </p>
                                    </div>
                                </div>
                            </div>
                        </div><!--
                        <div class="col-md-7">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-bar-chart"></i> &nbsp;&nbsp;Monthly Claim Value</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-bar-chart-Individual"></div>
                                    <div class="text-center">
                                        <p> Total expenses (for month)</p>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>                     
        </div>
    </body>
</html>
