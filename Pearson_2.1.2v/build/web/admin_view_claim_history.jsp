<%-- 
    Document   : admin_view_claim_history
    Created on : Mar 22, 2015, 9:25:28 PM
    Author     : Lakshan
--%>

<%@page import="com.beans.Notifications"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="shortcut icon" href="images/browserLogo.png">         

        <script type="text/javascript" language="javascript">
            //Print document javascript 
            function popupPrint() {
                var pclaimId = document.getElementById("printClaimID");         //assign each value to varibles
                var pclaimdate = document.getElementById("printClaimDate");
                var pclaimdata = document.getElementById("printClaimData");
                var pclaimtotal = document.getElementById("printClaimTotal");
                var ptitle = document.getElementById("printTitle");
                var pproject = document.getElementById("printProject");
                var pmname = document.getElementById("printPM");
                var agmname = document.getElementById("printAGM");
                var empid = document.getElementById("printEmpId");

                my_window = window.open("", "mywindow", "status=1,width=1050,height=750");//new browser window
                my_window.document.write('<html><head><title>Print Me</title></head>');
                my_window.document.write('<body onafterprint="self.close()"><div style=\"margin-left:20px;\" >');
                my_window.document.write('<h3 style=\"color:red;text-align:center;\">PEARSON LANKA (PVT) LTD</h3>');
                my_window.document.write('<h3 style=\"color:red;text-align:center;\">PETTY CASH VOUCHER</h3>');
                my_window.document.write(empid.innerHTML);
                my_window.document.write('<p style=\"margin-top:10px;\"></p>');
                my_window.document.write(pclaimId.innerHTML);
                my_window.document.write('<p style=\"margin-top:10px;\"></p>');
                my_window.document.write(ptitle.innerHTML);
                my_window.document.write('<p style=\"margin-top:10px;\"></p>');
                my_window.document.write(pproject.innerHTML);
                my_window.document.write('<p style=\"margin-top:10px;\"></p>');
                my_window.document.write(pclaimdate.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:20px;\">Details of the cliam:</h4>');
                my_window.document.write(pclaimdata.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:40px;\"></h4>');
                my_window.document.write(pclaimtotal.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:20px;\">Cheked By Manager:</h4>');
                my_window.document.write(pmname.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:20px;\">Approved By:</h4>');
                my_window.document.write(agmname.innerHTML);
                my_window.print();//print document in another browser window
                my_window.document.write('</div></body></html>');
            }
            //Data Table javascript 
            $(document).ready(function () {
                var table1;
                var table2;
                var table3;
                $(window).load(function () {
                    table1 = $('#example1').DataTable();                          //load datatable
                    table2 = $('#example2').DataTable();
                    table3 = $('#example3').DataTable();

                });
                $('#searchByDate').on('change', function () {                    //change the search input to custom 
                    table1.search(this.value).draw();
                    table2.search(this.value).draw();
                    table3.search(this.value).draw();

                });

                $('#searchByDate').datepicker({//load calendar to search input
                    format: "dd/mm/yyyy"
                });
            });



            //delete pending claims
            $(document).ready(function () {

                $("a.dellink").click(function () {

                    var claimId = $(this).data("claimid");
                    var ask = window.confirm("Are you sure you want to Delete?");
                    if (ask) {

                        $.ajax({
                            type: "POST",
                            url: "DeleteValues",
                            data: "id=" + claimId + "&table=" + "claims&fieldName=" + "claimid",
                            success: function (data) {
                                //alert(data);
                                document.location.href = "admin_view_claim_history.jsp";

                            }
                        });
                    } else {

                    }
                });
            });


            $(document).ready(function () {
                $("#load").hide();
                $("a.plink").click(function () {
                    $("#load").show();
                    $("#employeeProfile tbody").empty();
                    var json;

                    var email = $(this).data("email");

                    $.ajax({
                        type: "POST",
                        url: "SearchEmp",
                        data: "email=" + email,
                        success: function (data) {

                            json = JSON.parse(data);
                            var tableIn = "";
                            $("#load").hide();

                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "Employee ID" + "</td>";
                            tableIn += "<td>" + json['empid'] + "</td>" + "</tr>";

                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "Employee Name" + "</td>";
                            tableIn += "<td>" + json["fname"] + " " + json["lname"] + "</td>" + "</tr>";
                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "E-Mail" + "</td>";
                            tableIn += "<td>" + json["email"] + "</td>" + "</tr>";
                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "Designation" + "</td>";
                            tableIn += "<td>" + json["designationStr"] + "</td>" + "</tr>";
                            tableIn += "<td class=\"text-primary\">" + "Assistant General Manager" + "</td>";
                            tableIn += "<td>" + json["agm"] + "</td>" + "</tr>";
                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "Project Manager" + "</td>";
                            tableIn += "<td>" + json["proman"] + "</td>" + "</tr>";
                            tableIn += "<tr>";
                            tableIn += "<tr>";
                            tableIn += "<td class=\"text-primary\">" + "Project" + "</td>";
                            tableIn += "<td>" + json["project"] + "</td>" + "</tr>";
                            $("#employeeProfile table").append(tableIn);

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

            $(document).ready(function () {

                $("a.mlink").click(function () {
                    $("#OtherClaimDetails tbody").empty();// remove previous table data
                    $("#bulk_id").empty();
                    $("#date").empty();
                    $("#status").empty();
                    $("#total").empty();
                    $("#empid").empty();
                    $("#agm").empty();
                    $("#pm").empty();

                    var details = $(this).data("value");
                    var empId = $(this).data("empid");
                    var claimId = $(this).data("claimid");
                    var claimDate = $(this).data("claimdate");
                    var status = $(this).data("status");
                    var total = $(this).data("total");
                    var agm = $(this).data("agm");
                    var pm = $(this).data("pm");

                    $("#bulk_id").append(claimId);
                    $("#date").append(claimDate);
                    $("#status").append(status);// $("#status").css("color","#5cb85c");
                    $("#empid").append(empId);
                    $("#agm").append(agm);
                    $("#pm").append(pm);
                    $("#total").append("Rs. " + total);

                    for (var i = 0; i < details.length; i++) {
                        var tableIn = "";
                        //$("#OtherClaimDetails table").append("<tr><td>"+details[i]['billdate']+"</td></tr>");

                        tableIn += "<tr>";
                        tableIn += "<td>" + details[i]['billdate'] + "</td>";
                        tableIn += "<td>" + details[i]['claimgroup'] + "</td>";
                        tableIn += "<td>" + details[i]['billtype'] + "</td>";
                        tableIn += "<td>" + details[i]['mealtype'] + "</td>";
                        tableIn += "<td>" + details[i]['project'] + "</td>";
                        tableIn += "<td>" + details[i]['amount'] + "</td>";
                        tableIn += "<td>" + details[i]['description'] + "</td>";
                        tableIn += "<td>" + "<a href='" + details[i]['attachment'] + "' target='_blank'><i class='fa fa-file-image-o'> &nbsp;View</i></a>" + "</td>";
                        tableIn += "<td>" + details[i]['empdetails'] + "</td>";

                        tableIn += "</tr>";

                        $("#OtherClaimDetails table").append(tableIn);
                    }
                });
            });
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

           Employee user = (Employee) request.getSession().getAttribute("user");
            if (user.equals(null)) {
                response.sendRedirect("index.jsp");
            }

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();                                                   // setup the database connection
            DBCollection coll = dbcon.getData("claims");
            DBCollection notifycoll = dbcon.getData("notifications");
            DBCollection empColl = dbcon.getData("employee");

            BasicDBObject notifyFill = new BasicDBObject("receiver", "Admin");
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            Claims n1;
            Claims n2;
            Claims n3;

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
                        <li class="active"><a href="admin_view_claim_history.jsp"><i class="fa fa-history"></i>&nbsp; Claim Request History</a></li>
                        <li ><a href="admin_view_add_users.jsp"><i class="fa fa-table"></i>&nbsp; Add User Accounts</a></li>
                        <li ><a href="admin_view_edit_users.jsp"><i class="fa fa-times"></i>&nbsp; Edit/Remove User Account</a></li>
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
                                    <a href=<%= noti.getUrl()%>>
                                        <span class="avatar"><i class="fa fa-bell"></i></span>
                                        <span class="message"><%= list%></span>
                                    </a>
                                    <% }%>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" > &nbsp;<%= user.getEmail()%> <b class="caret"></b></a>
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
                        <h2>Employee Claim Requests</h2>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the Admin Dashboard.You can consider claim request, Add new user accounts, Edit/Remove accounts, Add current projects and Add new managers. 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8"></div>
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
                <div class="row margin_form">
                    <div class="col-md-11">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#Pending">Pending Claims</a></li>
                            <li ><a data-toggle="tab" href="#Approved">Approved Claims</a></li>
                            <li><a data-toggle="tab" href="#Rejected">Rejected Claims</a></li>
                        </ul>
                        <div class="tab-content margin_form">
                            <div id="Pending" class="tab-pane fade in active">                                
                                <div class="col-md-1"></div>
                                <div class="col-md-10">
                                    <p>Pending Claims</p>
                                    <table id="example1" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead  class="text-primary" >
                                            <tr >
                                                <th>Employee Email</th>
                                                <th>Claim ID</th>
                                                <th>Date</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot class="text-primary">
                                        </tfoot>
                                        <tbody align="center">
                                            <%
                                                String tableInner1 = "";
                                                BasicDBObject basic = new BasicDBObject("status", "On Approval Finance");

                                                DBCursor cursor1 = coll.find(basic);
                                                while (cursor1.hasNext()) {
                                                    DBObject dBObject = cursor1.next();
                                                    n1 = Claims.fromDBObject2(dBObject);

                                                    tableInner1 += "<tr>";
                                                    tableInner1 += "<td>" + "<a style=\"cursor:pointer\" data-toggle=\"modal\" data-target=\"#employeeProfile\" class='plink' data-email='" + n1.getEmail() + "' >" + n1.getEmail() + "<a>" + "</td>";
                                                    tableInner1 += "<td>" + n1.getClaimId() + "</td>";

                                                    tableInner1 += "<td>" + n1.getDate() + "</td>";

                                                    tableInner1 += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\"  data-total='" + n1.getTotal() + "' data-claimid='" + n1.getClaimId() + "' data-claimdate='" + n1.getDate() + "'  data-empid='" + n1.getEmpId() + "' data-agm='" + n1.getAgm() + "' data-pm='" + n1.getProMan() + "'data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n1.getDetails() + "'>Show Details &nbsp</a>  ";
                                                    tableInner1 += "<a style=\"cursor:pointer\" name=\"delete\"  title='Delete' class='dellink' data-claimid='" + n1.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-trash-o'></i></a>";
                                                    tableInner1 += "</td>";
                                                    tableInner1 += "</tr>";

                                                }

                                            %>
                                            <%=tableInner1%> 
                                        </tbody>
                                    </table>                
                                </div>                            
                            </div>
                            <div id="Approved" class="tab-pane fade">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" id="Pending">
                                    <p>Approved Claims</p>
                                    <table id="example2" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead  class="text-primary" >
                                            <tr >
                                                <th></th>
                                                <th>Employee Email</th>
                                                <th>Claim ID</th>
                                                <th>Date</th>
                                                <th>Approved Date</th>

                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot class="text-primary">
                                        </tfoot>
                                        <tbody align="center">
                                            <%
                                                String tableInner2 = "";
                                                BasicDBObject basic2 = new BasicDBObject();
                                                basic2.put("status", "Approved");//database search quary by session id
                                                DBCursor cursor12 = coll.find(basic2);

                                                while (cursor12.hasNext()) {
                                                    DBObject dBObject = cursor12.next();
                                                    n2 = Claims.fromDBObject2(dBObject);

                                                    tableInner2 += "<tr>";
                                                    tableInner2 += "<td>" + "<i class=\"fa fa-check-square-o\"></i>" + "</td>";
                                                    tableInner2 += "<td>" + "<a style=\"cursor:pointer\" data-toggle=\"modal\" data-target=\"#employeeProfile\" class='plink' data-email='" + n2.getEmail() + "' >" + n2.getEmail() + "<a>" + "</td>";
                                                    tableInner2 += "<td>" + n2.getClaimId() + "</td>";
                                                    tableInner2 += "<td>" + n2.getDate() + "</td>";
                                                    tableInner2 += "<td>" + n2.getApprovedDate() + "</td>";

                                                    tableInner2 += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\"  data-total='" + n2.getTotal() + "' data-claimid='" + n2.getClaimId() + "' data-claimdate='" + n2.getDate() + "' data-empid='" + n2.getEmpId() + "' data-agm='" + n2.getAgm() + "' data-pm='" + n2.getProMan() + "' data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n2.getDetails() + "'>Show Details &nbsp</a>  ";
                                                    tableInner2 += "<a style=\"cursor:pointer\" name=\"delete\"  title='Delete' class='dellink' data-claimid='" + n2.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-trash-o'></i></a>";
                                                    tableInner2 += "</td>";
                                                    tableInner2 += "</tr>";

                                                }

                                            %>

                                            <%=tableInner2%> 
                                        </tbody>
                                    </table>                
                                </div>                            
                            </div>
                            <div id="Rejected" class="tab-pane fade">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" id="Rejected">
                                    <p>Rejected Claims</p>
                                    <table id="example3" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead  class="text-primary" >
                                            <tr >
                                                <th></th>
                                                <th>Employee Email</th>
                                                <th>Claim ID</th>
                                                <th>Date</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot class="text-primary">
                                        </tfoot>
                                        <tbody align="center">
                                            <%
                                                String tableInner3 = "";
                                                BasicDBObject basic3 = new BasicDBObject();
                                                basic3.put("rejectedby", "Admin");
                                                basic3.put("status", "Rejected");//database search quary by session id
                                                DBCursor cursor13 = coll.find(basic3);

                                                while (cursor13.hasNext()) {
                                                    DBObject dBObject = cursor13.next();
                                                    n3 = Claims.fromDBObject2(dBObject);

                                                    tableInner3 += "<tr>";
                                                    tableInner3 += "<td>" + "<i class=\"fa fa-times-circle\"></i>" + "</td>";
                                                    tableInner3 += "<td>" + "<a style=\"cursor:pointer\" data-toggle=\"modal\" data-target=\"#employeeProfile\" class='plink' data-email='" + n3.getEmail() + "' >" + n3.getEmail() + "<a>" + "</td>";
                                                    tableInner3 += "<td>" + n3.getClaimId() + "</td>";

                                                    tableInner3 += "<td>" + n3.getDate() + "</td>";

                                                    tableInner3 += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\"  data-total='" + n3.getTotal() + "' data-empid='" + n3.getEmpId() + "' data-claimid='" + n3.getClaimId() + "' data-claimdate='" + n3.getDate() + "' data-empid='" + n3.getEmpId() + "' data-agm='" + n3.getAgm() + "' data-pm='" + n3.getProMan() + "' data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n3.getDetails() + "'>Show Details &nbsp</a>  ";
                                                    tableInner3 += "<a style=\"cursor:pointer\" name=\"delete\"  title='Delete' class='dellink' data-claimid='" + n3.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-trash-o'></i></a>";
                                                    tableInner3 += "</td>";
                                                    tableInner3 += "</tr>";

                                                }

                                            %>

                                            <%=tableInner3%> 
                                        </tbody>
                                    </table>                
                                </div>                            
                            </div>           
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade bs-example-modal-lg  " id="employeeProfile" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:140px;width:50%">
                    <div class="modal-content">
                        <div class="modal-body"> 
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-8">
                                    <h4 class="text-primary" id="myModalLabel">   Details about the Employee</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10">
                                    <div class="table-responsive margin_form ">
                                        <table class="table table-striped table-bordered" >
                                            <tbody  align="center" id="list tbody" name="list tbody">
                                            <div id="load" align="center"><img src="images/loading.gif" /></div>
                                            </tbody>
                                        </table>
                                    </div>	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal of login pop up window -->
            <div class="modal fade bs-example-modal-lg  " id="OtherClaimDetails" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:120px;width:80%;">
                    <div class="modal-content">
                        <div class="modal-body"> <!-- Modal body And login form -->
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <div class="row">
                                <div class="col-md-11">
                                    <h4 class="text-primary" id="myModalLabel">   Details about the claims</h4>
                                </div>
                                <div class="col-md-1">
                                    <img src="images/printlogo02 copy.png" onclick="popupPrint()" class="img-responsive" style="cursor:pointer;">                           
                                </div>
                            </div>
                            <div class="row margin_form">
                                <div class="col-md-4" id="printClaimID">
                                    <label class="label  label_1 "> Claim ID: <span id="bulk_id" class="label label-info"></span></label>
                                </div>
                                <div class="col-md-4">

                                </div>
                                <div class="col-md-4" id="printClaimDate">
                                    <label class="label  label_1 "> Claim Date: <span id="date" class="label label-info"></span></label>                                  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive margin_form " id="printClaimData">
                                        <table class="table table-striped table-bordered" >
                                            <thead align="center" class="text-primary" >
                                                <tr>
                                                    <td>&nbsp;Bill Date</td>
                                                    <td>&nbsp;Claim Type</td>
                                                    <td>&nbsp;Bill Type</td>
                                                    <td>&nbsp;Meal Type</td>
                                                    <td>&nbsp;Project</td>
                                                    <td>&nbsp;Amount</td>
                                                    <td>&nbsp;Description</td>
                                                    <td>&nbsp;Attachment</td>
                                                    <td>&nbsp;Details Of Group</td>
                                                </tr>
                                            </thead>
                                            <tbody  id="list tbody" name="list tbody">
                                            </tbody>
                                        </table>
                                    </div>	
                                </div>
                            </div>
                            <!--Only for get details to print document-->
                            <div class="row" id="printEmpId" style="display:none;">
                                <label class="label label_1 "> Employee ID: <span id="empid" class="label label-info"></span></label>
                            </div>
                            <div class="row" id="printPM" style="display:none;">
                                <label class="label label_1 "> Name: <span id="pm" class="label label-info"></span></label>
                            </div>
                            <div class="row" id="printAGM" style="display:none;">
                                <label class="label label_1 "> Name: <span id="agm" class="label label-info"></span></label>
                            </div>
                            <div class="col-md-4" id="printTitle" style="display:none;">
                                <label class="label label_1 "> Title: <span id="Title" class="label label-info"></span></label>
                            </div>
                            <div class="col-md-4" id="printProject" style="display:none;">
                                <label class="label label_1 "> Project: <span id="project" class="label label-info"></span></label>
                            </div>
                            <!-- End of get details section-->
                            <div class="row" > 
                                <div class="col-md-4"></div>
                                <div class="col-md-4"></div>
                                <div class="col-md-4" id="printClaimTotal">
                                    <label class="label  label_1 "> Total Claim: <span id="total" class="label label-default"></span></label> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>