<%-- 
    Document   : admin_view_home
    Created on : Mar 15, 2015, 9:38:07 AM
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
                my_window.document.write('<h4 style=\"margin-top:20px;\">Details of the claim:</h4>');
                my_window.document.write(pclaimdata.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:40px;\"></h4>');
                my_window.document.write(pclaimtotal.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:20px;\">Cheked By Manager(Project Manager):</h4>');
                my_window.document.write(pmname.innerHTML);
                my_window.document.write('<h4 style=\"margin-top:20px;\">Approved By(AGM):</h4>');
                my_window.document.write(agmname.innerHTML);
                my_window.print();//print document in another browser window
                my_window.document.write('</div></body></html>');
            }
            //Data Table javascript 
            $(document).ready(function () {
                var table;
                $(window).load(function () {
                    table = $('#example').DataTable();

                });
                //load datatable
                // #searchByDate is a <input type="text"> element
                $('#searchByDate').on('change', function () {                    //change the search input to custom 
                    table.search(this.value).draw();
                });
                $('#searchByDate').datepicker({//load calendar to search input
                    format: "dd/mm/yyyy"
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

                        }
                    });

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

            //add data to model
            $(document).ready(function () {
                var claimId;
                var empId;
                var monthTotal = 0;
                $("a.mlink").click(function () {

                    $("#listtbody").empty();// remove previous table data
                    $("#bulk_id").empty();
                    $("#date").empty();
                    $("#thisTotal").empty();
                    $("#exeed").empty();
                    $("#empid").empty();
                    $("#agm").empty();
                    $("#pm").empty();
                    $("#monthTotal").empty();
                    $("#total").empty();

                    var details = $(this).data("value");
                    claimId = $(this).data("claimid");
                    empId = $(this).data("empid");
                    var email = $(this).data("email");
                    var claimDate = $(this).data("claimdate");
                    var agm = $(this).data("agm");
                    var pm = $(this).data("pm");
                    var thisTotal = $(this).data("total");


                    $.ajax({
                        type: "POST",
                        url: "MonthlyClaimLimit",
                        data: "email=" + email,
                        success: function (data) {
                            monthTotal = data;


                            $("#monthTotal").append(monthTotal);
                            var total = parseFloat(thisTotal) + parseFloat(monthTotal);
                            $("#thisTotal").val(thisTotal);
                            $("#total").append(total);
                            if (total > 5000) {
                                
                                $("#exeed").append("Claim has been Exeeded the Monthly Limit");
                            }
                            $('#OtherClaimDetails').modal('toggle');
                            $('#OtherClaimDetails').modal('show');


                        }
                    });


                    $("#bulk_id").append(claimId);
                    $("#empid").append(empId);
                    $("#date").append(claimDate);
                    $("#agm").append(agm);
                    $("#pm").append(pm);


                    






                    for (var i = 0; i < details.length; i++) {
                        var tableIn = "";
                        //$("#OtherClaimDetails table").append("<tr><td>"+details[i]['billdate']+"</td></tr>");

                        tableIn += "<tr>";
                        tableIn += "<td>" + details[i]['billdate'] + "</td>";
                        tableIn += "<td>" + details[i]['claimgroup'] + "</td>";
                        tableIn += "<td>" + details[i]['billtype'] + "</td>";
                        tableIn += "<td>" + details[i]['mealtype'] + "</td>";
                        tableIn += "<td>" + details[i]['project'] + "</td>";
                        tableIn += "<td align='right'>" + details[i]['amount'] + "</td>";
                        tableIn += "<td>" + details[i]['description'] + "</td>";
                        tableIn += "<td>" + "<a href='" + details[i]['attachment'] + "' target='_blank'><i class='fa fa-file-image-o'> &nbsp;View</i></a>" + "</td>";
                        tableIn += "<td>" + details[i]['empdetails'] + "</td>";


                        tableIn += "</tr>";

                        $("#listtbody").append(tableIn);
                    }
                });

                //claim approve 
                $("#approve").click(function () {

                    var ask = window.confirm("You sure you want to Approve Claim?");
                    if (ask) {
                        //window.alert(claimId+"  "+empId);
                        $.ajax({
                            type: "POST",
                            url: "AdminClaimApprove",
                            data: "claimid=" + claimId + "&empid=" + empId,
                            success: function (data) {
                                // window.alert(data);
                                document.location.href = "admin_view_home.jsp";
                            }

                        });
                    }
                });

                $("#reject").click(function () {
                    var ask = window.confirm("You sure you want to  Claim?");
                    if (ask) {
                        //window.alert(claimId + "  " + empId);
                        $.ajax({
                            type: "POST",
                            url: "CancelSubmit",
                            data: "claimid=" + claimId,
                            success: function (data) {
                                // window.alert(data);
                                document.location.href = "admin_view_home.jsp";
                            }
                        });
                    }

                });
            });</script>

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
            Employee user = (Employee) request.getSession().getAttribute("user");
             
            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");

            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", "Admin");
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            BasicDBObject search = new BasicDBObject("status", "On Approval Finance");
            DBCursor cursor = coll.find(search);
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
                    <a class="navbar-brand" href="#"><b>Admin DashBoard</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="admin_view_home.jsp"><i class="fa fa-file-text"></i> &nbsp;New Claim Requests</a></li>
                        <li><a href="admin_view_claim_history.jsp"><i class="fa fa-history"></i>&nbsp; Claim Request History</a></li>
                        <li><a href="admin_view_add_users.jsp"><i class="fa fa-table"></i>&nbsp; Add User Accounts</a></li>
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
                                <span id="noOfNotify" class="label label-warning"> <%=notifycoll.count(notifyFill)%></span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images/icon_logo.png" style="width: 25px; height: 25px" >&nbsp;<%= user.getEmail()%> <b class="caret"></b></a>
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
                        <h2>Employee Claim Requests for Approval </h2>
                        <div class="alert alert-info alert-dismissable">	
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
                <div class="row margin_form" >
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead  class="text-primary" >
                                <tr >
                                    <th>Employee Email</th>
                                    <th>Claim Id</th>
                                    <th>Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody align="center">
                                <%String tableInner = "";

                                    while (cursor.hasNext()) {
                                        try {
                                            DBObject dBObject = cursor.next();
                                            n = Claims.fromDBObject2(dBObject);

                                            tableInner += "<tr>";
                                            tableInner += "<td>" + "<a style=\"cursor:pointer\" data-toggle=\"modal\" data-target=\"#employeeProfile\" class='plink' data-email='" + n.getEmail() + "' >" + n.getEmail() + "<a>" + "</td>";
                                            tableInner += "<td>" + n.getClaimId() + "</td>";
                                            tableInner += "<td>" + n.getDate() + "</td>";
                                            tableInner += "<td>" + "<a style=\"cursor:pointer\"  data-target=\"#OtherClaimDetails\" name=\"details\"  data-email='" + n.getEmail() + "' data-empid='" + n.getEmpId() + "' data-agm='" + n.getAgm() + "' data-pm='" + n.getProMan() + "'data-total='" + n.getTotal() + "' data-claimid='" + n.getClaimId() + "' data-claimdate='" + n.getDate() + "'  class='mlink' data-value='" + n.getDetails() + "'>Show Details</a>" + "</td>";

                                            tableInner += "</tr>";
                                        } catch (Exception e) {
                                        }

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
                <div class=" modal-dialog modal-lg" style="margin-top:120px;width:80%;">
                    <div class="modal-content">
                        <div class="modal-body" > <!-- Modal body And login form -->
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <div class="row">
                                <div class="col-md-11">
                                    <h4 class="text-primary" id="myModalLabel">   Details about the claims</h4>
                                </div>
                                <div class="col-md-1">
                                    <img src="images/printlogo02 copy.png" onclick="popupPrint()" class="img-responsive" style="cursor:pointer;">                  
                                </div>
                            </div>
                            <div id="printDetails">
                                <div class="row margin_form">
                                    <div class="col-md-4" id="printClaimID">
                                        <label class="label  label_1 "> Claim ID: <span id="bulk_id" class="label label-info"></span></label>
                                    </div>
                                    <div class="col-md-4"></div>        
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
                                                <tbody  id="listtbody" name="list tbody">
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
                                <div class="row">
                                    <div class="col-md-6"></div>
                                    <div class="col-md-6">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td><label class="label label_1 ">Current Month Claim Total: Rs.</label></td>
                                                    <td><label id="monthTotal" ></label></td>
                                                </tr>
                                                <tr>
                                                    <td><label class="label label_1 ">This Claim Total: Rs.</label></td>
                                                    <td><input style="border: none" id="thisTotal" /></td>
                                                </tr>
                                                <tr>
                                                    <td><label class="label label_1 ">Total: Rs.</label></td>
                                                    <td><label id="total" ></label></td>
                                                </tr>
                                                <tr>
                                                    <td>  <span id="exeed" class=" label label-warning"></span>

                                            </tbody>

                                        </table>
                                    </div> 
                                </div>


                                <div class="row margin_form">
                                    <div class="col-sm-9"></div>

                                    <div class="col-sm-1" style="margin-left: 15px">
                                        <button id="approve"  class="btn btn-success"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;Approve</button>
                                    </div>
                                    <div class="col-sm-1 " style="margin-left: 15px">
                                        <button id="reject"  class="btn btn-danger"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;Reject&nbsp;&nbsp;</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal for profile details pop up -->
            <div class="modal fade bs-example-modal-lg  " id="employeeProfile" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:140px;width:50%;">
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
        </div>
    </body>
</html>