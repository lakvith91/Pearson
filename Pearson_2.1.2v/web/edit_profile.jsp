<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>
<%@page import="com.beans.Notifications"%>
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
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Person Claim Management System Employee View</title>

        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/browserLogo.png">        

        <!-- Link for CSS files-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >
        <link rel="stylesheet" type="text/css" href="css/date_picker.css" >
        <link rel="stylesheet" type="text/css" href="css/date_picker.css">

        <!-- Link for javascript-->
        <script type="text/javascript" language="javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.ajaxfileupload.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.MultiFile.js"></script>
        <script type="text/javascript" language="javascript" type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/boostrap_datepicker.js"></script>
        <script>
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
                            $("#noOfNotify").empty();
                            $("#noOfNotify").append("0");
                        }
                    });

                });
            });

            $(document).ready(function (e) {
                $("#targetLayer").hide();
                $("#uploadForm").on('submit', (function (e) {
                    e.preventDefault();
                    $.ajax({
                        url: "UploadProPicture",
                        type: "POST",
                        data: new FormData(this),
                        contentType: false,
                        cache: false,
                        processData: false,
                        success: function (data) {
                            $("#targetLayer").show();
                            $("#targetLayer").html(data);
                        }
                    });
                }));
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
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#event_date').datepicker({
                    format: "dd/mm/yyyy"
                });
                $('#bill_date').datepicker({
                    format: "dd/mm/yyyy"
                });

            });
            function show_pic(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#reg_pro_pic1').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }

            }
        </script>

    </head>

    <body>
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
            }
            Employee e = (Employee) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");
            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", e.getEmail());
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

            BasicDBObject basic = new BasicDBObject();
            basic.put("empid", e.getEmpId());//database search quary by session id

            DBCursor cursor = coll.find(basic);
            String link = e.getProPic();

        %> 
        <div id="wrapper">

            <!-- Nav bar Start-->          
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">            
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><b>PEARSON</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li><a href="home_page.jsp" ><i class="fa fa-history"></i>&nbsp; My History</a></li> 
                        <li><a name="claimRequest"><i class="fa fa-file-text"></i>&nbsp; New Claim </a></li>   


                        <% if (e.getDesignation().equals("2") || e.getDesignation().equals("3")) {
                        %>
                        <li ><a href="claim_request.jsp" ><i class="fa fa-table"></i>&nbsp; View Claim Request</a></li> 
                            <%                             }
                            %>                  

                    </ul>
                    <ul class="nav navbar-nav navbar-right ">
                        <li class="dropdown messages-dropdown">
                             <a href="#" class="notifylink" data-email=<%= e.getEmail()%> ""  class="dropdown-toggle" data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
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
            <!-- End of nav Bar-->
            <!-- Start of content of the page-->
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Edit Profile<small>&nbsp;Your Personal Information</small></h2>
                        <div class="alert alert-success alert-dismissable">                         <!-- Alert massage-->
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome <b><%= e.getfName()%> </b> to PEARSON Claim Management System Employee View.You can Send claim requests, View your claim history and the current status of requested claims. 
                        </div>
                    </div>
                </div>
                
                <div class="row margin_form">
                    <!-- left column -->
                    <div class="col-md-3">
                        <div class="text-center">
                            <form id="uploadForm">
                                <img  id="reg_pro_pic1" class=" img-circle img-responsive" src="<%=e.getProPic()%>" style="width:180px;height:180px;">
                                <h6>Upload a profile picture...</h6>
                                <input id="edit_profile_pic" name="edit_profile_pic"  type="file"  onchange="show_pic(this)" placeholder="Attachment" >
                                <br><button type="submit" class="btn  button ">
                                    <i class="fa-upload"></i> 
                                    Upload</button> </li> 
                            </form> 
                            <div  id="targetLayer" class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                        </div>
                    </div>
                    <!-- edit form column -->
                    <div class="col-md-8 personal-info">
                        <form action="EditEmployee" method="post" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-md-3 control-label">First name:</label>
                                <div class="col-md-8">
                                    <input name="fname" class="form-control" type="text" value="<%=e.getfName()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Last name:</label>
                                <div class="col-md-8">
                                    <input name="lname" class="form-control" type="text" value="<%=e.getlName()%>">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-3 control-label">Email:</label>
                                <div class="col-md-8">
                                    <input name="email" class="form-control" type="email" value="<%=e.getEmail()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">NIC:</label>
                                <div class="col-md-8">
                                    <input name="nic" class="form-control" type="text" value="<%=e.getNIC()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Designation:</label>
                                <div class="col-md-8">
                                    <%
                                        String desig = null;

                                        if (e.getDesignation().equals("2")) {
                                            desig = "Assistant General Manager";
                                        } else if (e.getDesignation().equals("3")) {
                                            desig = "Project Manager";
                                        } else if (e.getDesignation().equals("4")) {
                                            desig = "Employee";
                                        }
                                    %>
                                    <input readonly name="designation" class="form-control" type="text" value="<%=desig%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Project:</label>
                                <div class="col-md-8">
                                    <input name="project" class="form-control" type="text" value="<%=e.getProject()%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Assistant General Manager :</label>
                                <div class="col-md-8">
                                    <input name="agm" class="form-control" type="text" value="<%=e.getAgm()%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Project Manager:</label>
                                <div class="col-md-8">
                                    <input name="proman" class="form-control" type="text" value="<%=e.getProMan()%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <input type="submit" class="btn btn-primary" value="Save Changes">
                                    <input type="reset" class="btn btn-default" value="Cancel">
                                </div>
                            </div>
                        </form>
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
        </div>
    </body>
</html>
