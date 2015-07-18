<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
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
                $(window).load(function () {
                    $('#project').DataTable();

                })

            });
            $(document).ready(function () {

                $("a.dellink").click(function () {

                    var proId = $(this).data("proid");
                    var ask = window.confirm("Are you sure you want to Delete?");
                    if (ask == true) {
                        $.ajax({
                            type: "POST",
                            url: "DeleteValues",
                            data: "id=" + proId + "&table=" + "projects&fieldName=" + "projid",
                            success: function () {
                                //alert(data);
                                document.location.href = "admin_view_add_projects.jsp";

                            }
                        });
                    } else {

                    }
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
                        <li class="active"><a href="admin_view_add_projects.jsp"><i class="fa fa-bars"></i> &nbsp;Add Current Projects</a></li>
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
                        <h2>Current Projects</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2"> </div>
                    <div class="col-lg-8">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bars"></i>&nbsp;Current Projects  </h3>
                            </div>
                            <div class="panel-body">
                                <div class="row margin_form">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10" >
                                        <div class="table-responsive " align="center">
                                            <table id="project" class="table table-bordered tableStyle" >
                                                <thead align="center" class="text-primary"  >
                                                    <tr>
                                                        <td>&nbsp;Project ID </td>
                                                        <td>&nbsp;Project Name </td>
                                                        <td>&nbsp;Option</td>
                                                    </tr>
                                                </thead>
                                                <tbody id="list tbody" name="list tbody" align="center">

                                                    <%
                                                        DBCollection coll = dbcon.getData("projects");

                                                        DBCursor cursor = coll.find();
                                                        // DBCursor cursor = coll.find();
                                                        String tableInner = "";

                                                        while (cursor.hasNext()) {
                                                            DBObject dbo = cursor.next();
                                                            Projects c = Projects.fromDBObject(dbo);

                                                            tableInner += "<tr>";

                                                            tableInner += "<td>" + c.getProjectID() + "</td>";
                                                            tableInner += "<td>" + c.getProjectName() + "</td>";
                                                            tableInner += "<td>" + "<a name=\"delete\" class='dellink' data-proid='" + c.getProjectID() + "'  >Delete</a>" + "</td>";

                                                            tableInner += "</tr>";
                                                        }


                                                    %>

                                                    <%=tableInner%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <form  action="AddProjects" class="form-control-static marginedit" name="addProject" method="post" >
                                        <div class="form-group row margin_form">
                                            <label class="col-lg-4 control-label" style="text-align:right">Project ID &nbsp;:</label>
                                            <div class="col-lg-6">
                                                <input class="form-control" type="text" value="" name="projid">
                                            </div>
                                        </div>
                                        <div class="form-group row  ">
                                            <label class="col-lg-4 control-label " style="text-align:right">Project Name &nbsp;:</label>
                                            <div class="col-lg-6">
                                                <input class="form-control" type="text" value="" name="projname">
                                            </div>
                                        </div>
                                        <div class="form-group row margin_form">
                                            <label class="col-md-8 control-label"></label>
                                            <div class="col-md-3">
                                                <button type="submit" class="btn btn-primary active button  " ><!--Add button -->
                                                    <span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;Add
                                                </button>         	
                                            </div>
                                        </div>
                                    </form>
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
