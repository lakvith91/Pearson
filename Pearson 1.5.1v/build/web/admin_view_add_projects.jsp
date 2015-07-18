<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>



<%@page import="com.beans.Projects"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.beans.Employee"%>


<%@page import="com.beans.Claims"%>										
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.dbops.DBcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> -->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Person Claim Management System Employee View</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >


        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>



        <!-- you need to include the shieldui css and js assets in order for the charts to work -->
        <!--  <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/shieldui-all.min.css" />
         <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
         <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
         <script type="text/javascript" src="http://prepbootstrap.com/Content/js/gridData.js"></script>-->
    </head>
    <body>
        <%


            String s = (String) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database



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
                    <a class="navbar-brand" href="#">Admin Panel</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                         <li><a href="admin_view_home.jsp"><i class="fa fa-bullseye"></i> Claim Requests</a></li>
                        <li ><a href="admin_view_add_users.jsp"><i class="fa fa-bullseye"></i> Add User Accounts</a></li>
                        <li ><a href="admin_view_edit_users.jsp"><i class="fa fa-bullseye"></i> Edit/Remove User Account</a></li>
                        <li class="active"><a href="admin_view_add_projects.jsp"><i class="fa fa-tasks"></i> Add Current Projects</a></li>

                        <li ><a href="admin_view_edi_tresholdvalues.jsp"><i class="fa fa-bullseye"></i> Edit Treshold Value</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown messages-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Notification <span class="badge">2</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">2 Notification</li>
                                <li class="message-preview">
                                    <a href="#">
                                        <span class="avatar"><i class="fa fa-bell"></i></span>
                                        <span class="message">Notification 01</span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li class="message-preview">
                                    <a href="#">
                                        <span class="avatar"><i class="fa fa-bell"></i></span>
                                        <span class="message">Notification 02</span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="#">Go to View Notification <span class="badge">2</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> PEARSON <b class="caret"></b></a>
                            <ul class="dropdown-menu">

                                <li  <form action="Logout" method="post" >
                                        <li> <button type="submit" class="btn  button ">
                                                <i class="fa fa-power-off"></i> 
                                                Logout</button> </li>   

                                    </form>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Current Projects<small>&nbsp;&nbsp;</small></h1>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! 
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-lg-2"> </div>
                    <div class="col-lg-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>&nbsp;Current Projects  </h3>
                            </div>
                            <div class="panel-body">
                                <div class="row margin_form">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10" >
                                        <div class="table-responsive " align="center">
                                            <table class="table table-bordered tableStyle" >
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
                                                             tableInner += "<td>" + "<a href=\"#\">Delete</a>" + "</td>";

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
                                                <button type="submit" class="btn btn-default active button  " ><!--Add button -->
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

        <!-- /#wrapper -->

        <!--
            This section initializes the chart widgets and a grid component, 
            which visualize records and allow sorting and paging. 
            For more information visit: 
            http://www.shieldui.com/documentation/javascript.chart/getting.started
            http://www.shieldui.com/documentation/grid/javascript/getting.started
            http://www.shieldui.com/documentation/datasource/javascript/getting.started
        -->
        <script type="text/javascript">
            
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
    </body>
</html>
