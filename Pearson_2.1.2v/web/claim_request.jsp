<%-- 
    Document   : claim_request
    Created on : Mar 19, 2015, 8:32:31 PM
    Author     : Dasun
--%>

<%@page import="com.beans.Notifications"%>
<%@page import="java.lang.String"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.beans.Claims"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.dbops.DBcon"%>
<%@page import="com.beans.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
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
                var table;
                 $(window).load(function () {
                    table = $('#example').DataTable();

                });
                $('#searchByDate').datepicker({//load calendar to search input
                    format: "dd/mm/yyyy"
                });
               
                //load datatable
                // #searchByDate is a <input type="text"> element
                $('#searchByDate').on('change', function () {                    //change the search input to custom 
                    table.search(this.value).draw();
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
                var claimId;
                var empId;
               
                $("a.mlink").click(function () {
                     
                    $("#OtherClaimDetails tbody").empty();
                    $("#bulk_id").empty();
                    $("#date").empty();// remove previous table data
                    $("#total").empty();
                    var details = $(this).data("value");
                    claimId = $(this).data("claimid");
                    empId = $(this).data("empid");
                    var claimDate = $(this).data("claimdate");
                    var total = $(this).data("total");


                    $("#bulk_id").append(claimId);
                    $("#date").append(claimDate);
                    $("#total").append("Rs." + total);
                    for (var i = 0; i < details.length; i++) {
                        var tableIn = "";
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


                $("#approve").click(function () {
                    var ask = window.confirm("You sure you want to Approve Claim?");
                    if (ask) {
                        //window.alert(claimId+"  "+empId);
                        $.ajax({
                            type: "POST",
                            url: "SubmitToManager",
                            data: "claimid=" + claimId + "&empid=" + empId,
                            success: function (data) {
                                
                                document.location.href = "claim_request.jsp";
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
                                
                                document.location.href = "claim_request.jsp";
                            }
                        });
                    }

                });
            });

            $(document).ready(function () {
                //notifications read
                $("a.notifylink").click(function () {
                    var email = $(this).data("email");

                    $.ajax({
                        type: "POST",
                        url: "SetRead",
                        data: "id=" + email,
                        success: function (data) {
                            $("#noOfNotify").empty();
                            $("#noOfNotify").append("0");
                        }
                    });

                });

                //create new claim
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
            String designation = null;
            String status = null;

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();                                                   // setup the database connection
            DBCollection coll = dbcon.getData("claims");

            if (e.getDesignation().equals("2")) {//if manager is a AGM
                status = "On Approval AGM";
                designation = "agm";
            } else if (e.getDesignation().equals("3")) {//if manager is a PM
                status = "On Approval PM";
                designation = "proman";
            }

            String empId = Integer.toString(e.getEmpId());
            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", e.getEmail());
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            BasicDBObject search = new BasicDBObject();
            List<BasicDBObject> sl = new ArrayList<BasicDBObject>();
            sl.add(new BasicDBObject("status", status));
            sl.add(new BasicDBObject(designation, e.getEmail()));
            search.put("$and", sl);

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
                    <a class="navbar-brand" href="https://www.pearson.com/"><b>PEARSON</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li ><a title="Employee Claim History" href="home_page.jsp" ><i class="fa fa-history"></i> &nbsp;My History</a></li> 
                        <li><a name="claimRequest" title="Create New Claim" style="cursor:pointer;"><i class="fa fa-file-text"></i>&nbsp; New Claim </a></li>   

                        <% if (e.getDesignation().equals("2") || e.getDesignation().equals("3")) {%><!--Check whether user role is employee or manger-->
                        <li class="active" ><a href="claim_request.jsp" title="Received Claim Requests from Employees"><i class="fa fa-table"></i>&nbsp; Claim Request</a></li>
                            <%}%> 
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown messages-dropdown">
                            <a href="#" class="notifylink" data-email=<%= e.getEmail()%> ""  class="dropdown-toggle" title="Notifications"data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
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
                                <li><a href="edit_profile.jsp"><i class="fa fa-user"></i>Edit Profile</a></li>
                                <li class="divider"></li>
                                <li><a  data-toggle="modal" data-target="#password" ><i class="fa fa-wrench"></i> Change Password</a></li>
                                <li class="divider"></li>
                                <form action="Logout" method="post">
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
                        <h2>Claim Requests</h2>
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome <b><%= e.getfName()%> </b> to PEARSON Claim Management System Employee View.You can Send claim requests, View your claim history and the current status of requested claims. 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8"><h4 class="text-danger"> </h4></div>
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
                            <thead class="text-primary" >
                                <tr>
                                    <th >Employee Email</th>
                                    <th >Claim ID</th>
                                    <th>Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody align="center">
                                <%String tableInner = "";

                                    while (cursor.hasNext()) {
                                        DBObject dBObject = cursor.next();

                                        n = Claims.fromDBObject2(dBObject);

                                        tableInner += "<tr>";
                                        tableInner += "<td>" + "<a style=\"cursor:pointer\" data-toggle=\"modal\" data-target=\"#employeeProfile\" class='plink'  data-email='" + n.getEmail() + "'>" + n.getEmail() + "<a>" + "</td>";
                                        tableInner += "<td>" + n.getClaimId() + "</td>";

                                        tableInner += "<td>" + n.getDate() + "</td>";

                                        tableInner += "<td>" + "<a style=\"cursor:pointer\" name=\"details\" data-total='" + n.getTotal() + "' data-toggle=\"modal\" data-target=\"#OtherClaimDetails\" title='More Details On Claim' data-empid='" + n.getEmpId() + "' data-claimid='" + n.getClaimId() + "' data-claimdate='" + n.getDate() + "' class='mlink' data-value='" + n.getDetails() + "'>Show Details</a>" + "</td>";
                                        tableInner += "</tr>";

                                    }

                                %>
                                <%=tableInner%>   

                            </tbody>
                        </table>                
                    </div>
                </div>
            </div>
            <!-- Modal for show employee claim details -->
            <div class="modal fade bs-example-modal-lg  " id="OtherClaimDetails" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:140px;width:80%;">
                    <div class="modal-content">
                        <div class="modal-body"> <!-- Modal body And login form -->
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <div class="row"><div class="col-md-4"></div>
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
                                            <thead class="text-primary text-center" >
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
                                            <tbody  align="center" id="list tbody" name="list tbody">
                                            </tbody>
                                        </table>
                                    </div>	
                                </div>
                            </div>
                            <div class="row" > 
                                <div class="col-md-6"></div>
                                <div class="col-md-4">
                                    <h4> Total Claim: <span id="total" class="label label-default"></span></h4> 
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
            </div><!-- Modal for employee claim details pop up - END -->
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
            <!-- Modal for profile details pop up -->
           
            <div class="modal fade bs-example-modal-lg  " id="employeeProfile" tabinmodal-lg dex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class=" modal-dialog modal-lg" style="margin-top:140px;width:700px;">
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
        <!-- Modal for profile details pop up - END -->
    </div>

</body>
</html>
