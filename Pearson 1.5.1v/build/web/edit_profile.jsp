<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>
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

        <!-- For shortcut icon -->
        <link rel="shortcut icon" href="images/logo.png">        

        <!-- Link for CSS files-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/admin_view.css" >
        <link rel="stylesheet" type="text/css" href="css/date_picker.css" >
        <link rel="stylesheet" href="css/date_picker.css">

        <!-- Link for javascript-->
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>


        <!-- Load jQuery and bootstrap datepicker scripts -->
        <script src="js/jQuery v1.9.1.js"></script>
        <script src="js/boostrap_datepicker.js"></script>

        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function() {

                $('#event_date').datepicker({
                    format: "dd/mm/yyyy"
                });
                $('#bill_date').datepicker({
                    format: "dd/mm/yyyy"
                });

            });

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
        </script>

    </head>

    <body>
        <%
            Employee e = (Employee) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");

            BasicDBObject basic = new BasicDBObject();
            basic.put("empid", e.getEmpId());//database search quary by session id

            DBCursor cursor = coll.find(basic);

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
                    <a class="navbar-brand" href="#">Employee Panel</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="#"><i class="fa fa-tasks"></i> Edit Profile</a></li>                         
                        <li ><a href="home_page_claim_add.jsp"><i class="fa fa-bullseye"></i> New Claim</a></li>
                        <li><a href="#"><i class="fa fa-tasks"></i> Claim History</a></li>                    
                        <!-- <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
                         <li><a href="forms.html"><i class="fa fa-list-ol"></i> Forms</a></li>
                         <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                         <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                         <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i > Bootstrap Grid</a></li>  -->                  
                    </ul>
                    <ul class="nav navbar-nav navbar-right ">
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp; <%= e.getfName()%>  <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="edit_profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>

                                <li class="divider"></li>

                                <!-- form Logout connect to Logout servlet-->

                                <form action="Logout" method="post" >
                                    <li> <button type="submit" class="btn  button ">
                                            <i class="fa fa-power-off"></i> 
                                            Logout</button> </li>   

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
                        <h1>Edit Profile<small>&nbsp;Edit your personal info</small></h1>

                        <div class="alert alert-success alert-dismissable">                         <!-- Alert massage-->
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                            For the purpose of data visualization, additional widgets are used, so make sure you review all provided information.
                        </div>
                    </div>
                </div>



                <!--       <div class="row">
       
                           <div class="col-lg-12"> 
                               <hr> <h3 class="text-center">Claim Form</h3> <hr>
                           </div>
                <!-- Claim form Start point-->                   

               
                    <hr>
                    <div class="row">

                        <h3>Personal info</h3>
                        <!-- left column -->
                        <div class="col-md-3">
                            <div class="text-center">
                                <img  id="reg_pro_pic1" class=" img-thumbnail img-responsive" src="images/profile-placeholder.png" style="width:180px;height:auto;">
                                <!--<img src="//placehold.it/100" class=" img-circle" alt="default image">-->
                                <h6>Upload a profile picture...</h6>

                                <input id="edit_profile_pic" name="edit_profile_pic"  type="file"  onchange="show_pic(this)" placeholder="Attachment" >


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
                                    <label class="col-md-3 control-label">Password:</label>
                                    <div class="col-md-8">
                                        <input name="password" class="form-control" type="password" value="<%=e.getPassword()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email:</label>
                                    <div class="col-md-8">
                                        <input name="email" class="form-control" type="text" value="<%=e.getEmail()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">NIC</label>
                                    <div class="col-md-8">
                                        <input name="nic" class="form-control" type="text" value="<%=e.getNIC()%>">
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
                                        <span></span>
                                        <input type="reset" class="btn btn-default" value="Cancel">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <hr>
            </div>



        

   

   
    
</body>
</html>
