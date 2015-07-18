<%-- 
    Document   : admin_view_dashboard
    Created on : Mar 21, 2015, 10:59:14 AM
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
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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

        </script>
        <script type="text/javascript">
            $(document).ready(function () {


                var empId = $(this).data("empid");
               
                var json;
                $.ajax({
                    type: "POST",
                    url: "YearExpense",
                    data: "id=" + empId,
                    success: function (data) {
                        json = JSON.parse(data);
                        
                        Morris.Donut({
                            element: 'morris-donut-chart-general',
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





                ////////// Donut Chart for general////////////////////////////////////



                ///////// Bar Chart for general///////////
                var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "Octomber", "November", "December"];

                ///////// Bar Chart for Individual///////////
                var claimValueGenaral = [];//array for genaral

                for (var i = 0; i < 12; i++) {
                    claimValueGenaral[i] = i * 100 + 1000;
                }
                Morris.Bar({
                    element: 'morris-bar-chart-general',
                    data: [
                        {
                            Month: month[0],
                            geekbench: claimValueGenaral[0]
                        }, {
                            Month: month[1],
                            geekbench: claimValueGenaral[1]
                        }, {
                            Month: month[2],
                            geekbench: claimValueGenaral[2]
                        }, {
                            Month: month[3],
                            geekbench: claimValueGenaral[3]
                        }, {
                            Month: month[4],
                            geekbench: claimValueGenaral[4]
                        }, {
                            Month: month[5],
                            geekbench: claimValueGenaral[5]
                        }, {
                            Month: month[6],
                            geekbench: claimValueGenaral[6]
                        }, {
                            Month: month[7],
                            geekbench: claimValueGenaral[7]

                        }, {
                            Month: month[8],
                            geekbench: claimValueGenaral[8]
                        }, {
                            Month: month[9],
                            geekbench: claimValueGenaral[9]
                        }, {
                            Month: month[10],
                            geekbench: claimValueGenaral[10]

                        }, {
                            Month: month[11],
                            geekbench: claimValueGenaral[11]
                        }],
                    xkey: 'Month',
                    ykeys: ['geekbench'],
                    labels: ['Claim Value'],
                    barRatio: 0.4,
                    xLabelAngle: 35,
                    hideHover: 'auto',
                    resize: true
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
                        <h2 id="asd">General Statistics</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>                    
                </div>
                <!-- row -->

                <div class="row margin_form">
                    <div class="col-md-11">
                        <div id="General">  
                            <div class="col-md-1"></div>
                            <div class="col-md-4">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-pie-chart"></i>&nbsp;&nbsp;Amount of Expenses</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div id="morris-donut-chart-general"></div>
                                        <div class="text-center">
                                            <p>Expenses for each claim type </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> &nbsp;&nbsp;Monthly Claim Value</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div id="morris-bar-chart-general"></div>
                                        <div class="text-center">
                                            <p> Total expenses (for month)</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>                     
            </div>
    </body>
</html>
