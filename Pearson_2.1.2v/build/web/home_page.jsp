<%--  
   Document   : home_page
   Created on : Jan 13, 2015, 8:38:31 PM
   Author     : Lakshan
--%>
<%@page import="com.beans.Notifications"%>
<%@page import="java.util.List"%>
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
        <%  try {
                if (request.getSession().getAttribute("user") == null) {
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
            }
        %>
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
        <link rel="shortcut icon" href="images/browserLogo.png">        

        <script type="text/javascript" language="javascript">
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

                // #searchByDate is a <input type="text"> element
                $('#searchByDate').on('change', function () {                    //change the search input to custom 
                    table1.search(this.value).draw();
                    table2.search(this.value).draw();
                    table3.search(this.value).draw();

                });
            });

            //Data picker javascript
            $(document).ready(function () {
                $('#searchByDate').datepicker({//load calendar to search input
                    format: "dd/mm/yyyy"
                });
            });
            //ajax jquary

            $(document).ready(function () {

                $("a[name='claimRequest']").click(function () {
                    var ask = window.confirm("Are you sure you want to create new claim?");
                    if (ask == true) {
                        $.ajax({
                            type: "POST",
                            url: "AddNewClaim",
                            data: "",
                            success: function () {
                                document.location.href = "home_page_claim_add.jsp";
                            }
                        });
                    } else {
                        document.location.href = "home_page.jsp";
                    }
                });

                //notifications read
                $("a.notifylink").click(function () {

                    var email = $(this).data("email");

                    $.ajax({
                        type: "POST",
                        url: "SetRead",
                        data: "id=" + email,
                        success: function (data) {

                        }
                    });

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
                                document.location.href = "home_page.jsp";

                            }
                        });
                    } else {

                    }
                });

                //edit claim
                $("a.editlink").click(function () {

                    var claimId = $(this).data("claimid");
                    $.ajax({
                        type: "POST",
                        url: "EditPendingClaims",
                        data: "id=" + claimId,
                        success: function (data) {

                            document.location.href = "home_page_claim_add.jsp";

                        }
                    });

                });
            });

            $(document).ready(function () {

                $("a.mlink").click(function () {
                    var a = $(this).closest('tr').children('td.a').text();

                    // alert(a);

                    $("#OtherClaimDetails tbody").empty();
                    $("#bulk_id").empty();
                    $("#date").empty();// remove previous table data
                    $("#total").empty();
                    $("#ass").empty();

                    var details = $(this).data("value");
                    var claimId = $(this).data("claimid");
                    var claimDate = $(this).data("claimdate");
                    var total = $(this).data("total");



                    $("#bulk_id").append(claimId);
                    $("#date").append(claimDate);
                    $("#total").append("Rs. " + total);
                    var length = details.length;
                    for (var i = 0; i < length; i++) {
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

                        $("#OtherClaimDetails table").append(tableIn);
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
                        $("#changepassword").prop("disabled", false);
                        $("#newPass2").css("background-color", goodColor);


                    } else {
                        $("#newPass2").css("background-color", badColor);
                        $("#confirmMessage").css("color", badColor);
                        $("#confirmMessage").append("Passwords Do Not Match");
                        $("#changepassword").prop("disabled", true);
                    }
                });

                $("#changepassword").click(function () {
                    var oldPass = $("#oldPass").val();
                    var newPass = $("#newPass").val();
                    var userEmail = $("#userEmail").val();
                    $.ajax({
                        type: "POST",
                        url: "ChangePassword",
                        data: "oldPass=" + oldPass + "&newPass=" + newPass + "&userEmail=" + userEmail,
                        success: function (data) {
                            if (data != "done") {
                                $("#msg").append("Your Old Password is Incorrect");
                            }else{
                              //  $("#msg").append("Your Password Sucessfully Changed");
                              document.location.href = "home_page.jsp";  
                            }

                        }
                    });



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
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
            }

            Employee e = (Employee) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();                                                   // setup the database connection
            DBCollection coll = dbcon.getData("claims");
            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", e.getEmail());
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            Claims n = null;
            Claims n2 = null;
            Claims n3 = null;


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
                    <a class="navbar-brand" href="https://www.pearson.com/"><b>PEARSON</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="home_page.jsp" title="Employee Claim History"><i class="fa fa-history"></i> &nbsp;My History</a></li> 
                        <li><a name="claimRequest" style="cursor:pointer;" title="Create New Claim"><i class="fa fa-file-text"></i>&nbsp; New Claim </a></li>   

                        <%   if (e.getDesignation().equals("2") || e.getDesignation().equals("3")) {
                        %>
                        <li ><a href="claim_request.jsp" title="Received New Claim Requests from Employees"><i class="fa fa-table"></i> &nbsp;View Claim Request</a></li> 
                            <%                             }
                            %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown messages-dropdown">
                            <a class="notifylink" href="#" title="Notifications" data-email=<%= e.getEmail()%> "" class="dropdown-toggle" data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img  id="reg_pro_pic" class=" img-rounded " src="<%=e.getProPic()%>" style="width:25px;height:25px;">  <%= e.getfName()%>  <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="edit_profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>
                                <li class="divider"></li>
                                <li><a  data-toggle="modal" data-target="#password" ><i class="fa fa-wrench"></i> Change Password</a></li>
                                <li class="divider"></li>
                                <form action="Logout" method="post">
                                    <li style="margin-left:45px;">                                       
                                        <button title="Logout" type="submit" class="btn btn-danger">
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
                        <h2>Claim History<small></small></h2>
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome <b><%= e.getfName()%> </b> to PEARSON Claim Management System Employee View.You can Send claim requests, View your claim history and the current status of requested claims. 
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
                                    <p><b>Pending Claims</p></b>
                                    <table  id="example1" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead  class="text-primary" >
                                            <tr >
                                                <th>Claim ID</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot class="text-primary">
                                        </tfoot>
                                        <tbody align="center">
                                            <%
                                                String tableInner1 = "";
                                                BasicDBObject basic = new BasicDBObject();
                                                List<BasicDBObject> sl = new ArrayList<BasicDBObject>();
                                                sl.add(new BasicDBObject("status", "On Approval PM"));
                                                sl.add(new BasicDBObject("status", "On Approval AGM"));
                                                sl.add(new BasicDBObject("status", "On Approval Finance"));
                                                sl.add(new BasicDBObject("status", "Pending"));

                                                basic.put("$or", sl);

                                                List<BasicDBObject> sls = new ArrayList<BasicDBObject>();
                                                sls.add(new BasicDBObject("email", e.getEmail()));
                                                sls.add(basic);

                                                BasicDBObject finds = new BasicDBObject("$and", sls);

                                                DBCursor cursor = coll.find(finds);
                                                while (cursor.hasNext()) {
                                                    DBObject dBObject = cursor.next();
                                                    n = Claims.fromDBObject2(dBObject);

                                                    tableInner1 += "<tr>";
                                                    tableInner1 += "<td class='a'>" + n.getClaimId() + "</td>";

                                                    tableInner1 += "<td>" + n.getDate() + "</td>";
                                                    if (n.getStatus().equals("Pending")) {
                                                        tableInner1 += "<td><span class='label label-primary'>" + n.getStatus() + "</span></td>";
                                                    } else {
                                                        tableInner1 += "<td><span class='label label-warning'>" + n.getStatus() + "</span></td>";
                                                    }
                                                    tableInner1 += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\"  data-total='" + n.getTotal() + "' data-claimid='" + n.getClaimId() + "' data-claimdate='" + n.getDate() + "'  data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n.getDetails() + "' title='More Details on Claim'>Show Details&nbsp;&nbsp;</a>";
                                                    if (n.getStatus().equals("Pending")) {
                                                        tableInner1 += "<a style=\"cursor:pointer\"  name=\"edit\" class='editlink' title='Edit Claim' data-claimid='" + n.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-pencil-square-o'></i></a>";
                                                        tableInner1 += "<a style=\"cursor:pointer\" name=\"delete\" class='dellink' title='Delete Claim' data-claimid='" + n.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-trash-o'></i></a>" + "</td>";//<i class="fa fa-trash-o"></i>

                                                    }
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
                                <div class="col-md-10" >
                                    <p>Approved Claims</p>
                                    <table id="example2" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead  class="text-primary" >
                                            <tr >
                                                <th></th>
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
                                                basic2.put("email", e.getEmail());
                                                basic2.put("status", "Approved");//database search quary by session id
                                                DBCursor cursor12 = coll.find(basic2);

                                                while (cursor12.hasNext()) {
                                                    DBObject dBObject = cursor12.next();
                                                    n2 = Claims.fromDBObject2(dBObject);

                                                    tableInner2 += "<tr>";
                                                    tableInner2 += "<td>" + "<i class=\"fa fa-check-square-o\"></i>" + "</td>";

                                                    tableInner2 += "<td>" + n2.getClaimId() + "</td>";

                                                    tableInner2 += "<td>" + n2.getDate() + "</td>";
                                                    tableInner2 += "<td>" + n2.getApprovedDate() + "</td>";

                                                    tableInner2 += "<td>" + "<a title='More Details On Claim' style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\"  data-total='" + n2.getTotal() + "' data-claimid='" + n2.getClaimId() + "' data-claimdate='" + n2.getDate() + "'  data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n2.getDetails() + "'>Show Details &nbsp</a>  ";

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
                                                <th>Claim ID</th>
                                                <th>Date</th>
                                                <th>Rejected By</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot class="text-primary">
                                        </tfoot>
                                        <tbody align="center">
                                            <%
                                                String tableInner3 = "";
                                                BasicDBObject basic3 = new BasicDBObject();
                                                basic3.put("email", e.getEmail());
                                                basic3.put("status", "Rejected");//database search quary by session id
                                                DBCursor cursor13 = coll.find(basic3);

                                                while (cursor13.hasNext()) {
                                                    DBObject dBObject = cursor13.next();
                                                    n3 = Claims.fromDBObject2(dBObject);

                                                    tableInner3 += "<tr>";
                                                    tableInner3 += "<td>" + "<i class=\"fa fa-times-circle\"></i>" + "</td>";

                                                    tableInner3 += "<td>" + n3.getClaimId() + "</td>";

                                                    tableInner3 += "<td>" + n3.getDate() + "</td>";
                                                    tableInner3 += "<td>" + n3.getRejectedBy() + "</td>";

                                                    tableInner3 += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-toggle=\"modal\" title='More Details on Claim' data-total='" + n3.getTotal() + "' data-claimid='" + n3.getClaimId() + "' data-claimdate='" + n3.getDate() + "'  data-target=\"#OtherClaimDetails\" class='mlink' data-value='" + n3.getDetails() + "'>Show Details &nbsp</a>  ";
                                                    tableInner3 += "<a style=\"cursor:pointer\"  name=\"edit\" class='editlink' title='Edit Claim' title='Edit Rejected Claim' data-claimid='" + n3.getClaimId() + "'  >&nbsp;&nbsp;&nbsp;<i class='fa fa-pencil-square-o'></i></a>";
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
                <!-- Modal of Details about claim pop up window -->
                <div class="modal fade bs-example-modal-lg  " id="OtherClaimDetails" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                    <div class=" modal-dialog modal-lg" style="margin-top:140px;width:80%;">
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
                                        <label class="label  label_1 "> Claim ID: <span id="bulk_id" class="label label-info"></span></label>
                                    </div>
                                    <div class="col-md-4"></div>        
                                    <div class="col-md-4">
                                        <div class="col-md-4">
                                            <label class="label  label_1 "> Claim Date: <span id="date" class="label label-info"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive margin_form ">
                                            <table class="table table-striped table-bordered" >
                                                <thead align="center" class="text-primary" >
                                                    <tr>
                                                        <td>&nbsp;Bill Date</td>
                                                        <td>&nbsp;Claim Type</td>
                                                        <td>&nbsp;Bill Type</td>
                                                        <td>&nbsp;Meal Type</td>
                                                        <td>&nbsp;Project</td>
                                                        <td>&nbsp;Amount(Rs)</td>
                                                        <td>&nbsp;Description</td>
                                                        <td>&nbsp;Attachment</td>
                                                        <td>&nbsp;Details Of Group</td>
                                                    </tr>
                                                </thead>
                                                <tbody  align="center" id="list tbody" name="list tbody">
                                                </tbody>
                                            </table>
                                        </div>	
                                    </div>
                                </div>
                                <div class="row" > 
                                    <div class="col-md-8"></div>

                                    <div class="col-md-4">
                                        <h4> Total Claim: <span id="total" class="label label-default"></span></h4> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- change password model -->
                <div  class="modal fade in " id="password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                    <div class="modal-dialog " style="margin-top:120px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-8"> <h3 class="modal-title" id="myModalLabel"><i class="fa fa-wrench"></i> Change Password</h3></div>
                                </div>
                            </div>
                            <div class="modal-body"> <!-- Modal body And login form -->
                                <div class="row">

                                    <form  method="POST" class="col-md-12 has-success"  name="myForm"  id="passwordChange"> 
                                        <div class="row"><!-- First row start -->
                                            <div class="col-md-1"></div>
                                            <div class="col-md-4">
                                                <div class="label label_2  " >Current Password&nbsp;:</div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <input type="password" class="form-control input-lg" id="oldPass" name="oldPass">
                                                    <input type="hidden" class="form-control input-lg" id="userEmail" name="userEmail" value="<%= e.getEmail()%>">
                                                </div>
                                            </div>
                                        </div><!-- First row End-->
                                        <div class="row"><!-- Second row start -->
                                            <div class="col-md-1"></div>

                                            <div class="col-md-4">
                                                <div class="label label_2" >New Password&nbsp;&nbsp;&nbsp;:</div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <input  type="password" class="form-control input-lg"  id="newPass" name="newPass">
                                                </div>
                                            </div>
                                        </div><!--second row End-->
                                        <div class="row"><!-- Second row start -->
                                            <div class="col-md-1"></div>

                                            <div class="col-md-4">
                                                <div class="label label_2" >Retype New Password&nbsp;&nbsp;&nbsp;:</div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <input  type="password" class="form-control input-lg"  id="newPass2" name="newPass2">
                                                    <span id="confirmMessage" class="confirmMessage"></span>
                                                </div>
                                            </div>
                                        </div><!--second row End-->


                                    </form> 
                                    <div class="row">
                                        <div class="col-md-8"></div>
                                        <div class="col-md-4">
                                            <button id="changepassword"  class="btn btn-success"><span class="fa fa-cog"></span>&nbsp;Apply</button>
                                        </div>


                                    </div>
                                    <!-- Simple Login - END -->
                                </div><!-- for row in body-->
                            </div>
                            <div class="modal-footer">
                                <div class="col-lg-2"></div>

                                <div class="col-lg-6"><h4><span id="msg" class="label label-danger"></span></h4></div>

                            </div>
                        </div>
                    </div>
                </div>





            </div>
            <!-- Simple modal -->
    </body>
</html>
