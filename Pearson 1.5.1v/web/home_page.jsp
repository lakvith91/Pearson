<%-- 
    Document   : home_page
    Created on : Jan 13, 2015, 8:38:31 PM
    Author     : Lakshan
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.beans.Claims"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.dbops.DBcon"%>
<%@page import="com.beans.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Person Claim Management System Employee View</title>

        <!-- css files link -->
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
        <link rel="shortcut icon" href="images/logo.png">        

        <script type="text/javascript" language="javascript">
            //Data Table javascript 
            $(document).ready(function() {
                var table = $('#example').DataTable();                          //load datatable
                // #searchByDate is a <input type="text"> element
                $('#searchByDate').on('change', function() {                    //change the search input to custom 
                    table.search(this.value).draw();
                });
            });
            //Data picker javascript
            $(document).ready(function() {
                $('#searchByDate').datepicker({//load calendar to search input
                    format: "dd/mm/yyyy"
                });
            });
            //Window confirmation when new cliam click event
            function newclaim() {
                var ask = window.confirm("Are you sure you want to create new claim?");
                if (ask) {
                    var xmlhttp;
                    if (window.XMLHttpRequest)
                    {
                        xmlhttp = new XMLHttpRequest();
                    }
                    else
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function() {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            // document.getElementById("content").innerHTML=xmlhttp.responseText;
                        }
                    }
                    xmlhttp.open("POST", "AddNewClaim", true);
                    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xmlhttp.send().value;

                    document.location.href = "home_page_claim_add.jsp";         //redirect to new claim add page


                } else {
                    window.alert("New Claim Created !");
                    document.location.href = "home_page.jsp";                   //redirect to current page
                }
            }
        </script>
        <!-- Internal style sheet provide hide the default search input in data table -->
        <style type="text/css">
            .dataTables_filter {
                display: none; 
            }
        </style>
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
            }
            Employee e = (Employee) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();                                                   // setup the database connection
            DBCollection coll = dbcon.getData("claims");

            BasicDBObject basic = new BasicDBObject();
            basic.put("empid", e.getEmpId());                                   //database search quary by session id

            DBCursor cursor = coll.find(basic);
            Claims n;
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
                    <a class="navbar-brand" href="https://www.pearson.com/">PEARSON</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">

                        <li class="active"><a href="home_page.jsp" ><i class="fa fa-tasks"></i> Claim History</a></li> 
                        <li><a href="home_page_claim_add.jsp" onclick="newclaim()"><i class="fa fa-bullseye"></i> New Claim </a></li>                                

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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> &nbsp; <%= e.getfName()%> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="edit_profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>

                                <li class="divider"></li>
                                <form action="Logout" method="post" >
                                    <li> 
                                        <button type="submit" class="btn  button "><i class="fa fa-power-off"></i> Logout</button>


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
                        <h1>Claim History<small></small></h1>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                            For the purpose of data visualization, additional widgets are used, so make sure you review all provided information.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8"><h4 class="text-danger"> Search your claim and see the status</h4></div>
                    <div class="col-md-1">
                        <label class="text-primary text-right" style="margin-top:10px; "> Search :</label>
                    </div>
                    <div class="col-md-3" id="searchByDateDiv" >
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder=" By Cliam Date" id="searchByDate">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row margin_form" >
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead  class="text-primary" >
                                <tr >
                                    <th >Claim Id</th>
                                    <th>Date</th>
                                    <th>Status</th>

                                    <th></th>
                                </tr>
                            </thead>

                            <tfoot class="text-primary">

                            </tfoot>

                            <tbody align="center">
                                <%String tableInner = "";
 
                                    while (cursor.hasNext()) {
                                        DBObject dBObject = cursor.next();
                                        n = Claims.fromDBObject2(dBObject);

                                        tableInner += "<tr>";
                                        tableInner += "<td>" + n.getClaimId() + "</td>";

                                        tableInner += "<td>" + n.getDate() + "</td>";
                                        tableInner += "<td>" + n.getStatus() + "</td>";
                                        tableInner += "<td>" + "<a class=\"text-primary\" href=\"#\"  data-toggle=\"modal\" data-target=\"#OtherClaimDetails\">Show Details</a>" + "</td>";
                                        tableInner += "</tr>";

                                    }

                                %>


                                <%=tableInner%>    




                            </tbody>
                        </table>                
                    </div>
                </div>
            </div>

            <!-- Modal of login pop up window -->
            <div class="modal fade bs-example-modal-lg  " id="OtherClaimDetails" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:120px;width:1000px;">
                    <div class="modal-content">
                        <div class="modal-body"> <!-- Modal body And login form -->
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <div class="row">
                                <div class="col-md-8">
                                    <h4 class="text-primary" id="myModalLabel">   Details about the claims</h4>
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                            <div class="row margin_form">
                                <div class="col-md-4">
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label  label_1  ">Claim ID &nbsp;:</label>
                                    </div>
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label label_1"><%= e.getfName()%></label>
                                    </div>
                                </div>
                                <div class="col-md-4"></div>        
                                <div class="col-md-4">
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label  label_1  ">Claim Date&nbsp;:</label>
                                    </div>
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label label_1"><%= e.getfName()%></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive margin_form ">
                                        <table class="table table-striped table-bordered" >
                                            <thead align="center" class="text-primary" >
                                                <tr>
                                                    <td>&nbsp;Claim Type</td>
                                                    <td>&nbsp;Amount</td>
                                                    <td>&nbsp;Project</td>
                                                    <td>&nbsp;Description</td>
                                                    <td>&nbsp;Approved date</td>
                                                    <td>&nbsp;Status</td>
                                                </tr>
                                            </thead>
                                            <tbody  id="list tbody" name="list tbody">
                                                <tr>                                            
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Simple Login - END -->
    </body>
</html>
