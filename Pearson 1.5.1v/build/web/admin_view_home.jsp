<%-- 
    Document   : admin_view_home
    Created on : Mar 15, 2015, 9:38:07 AM
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


            String s = (String) request.getSession().getAttribute("user");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();                                                   // setup the database connection
            DBCollection coll = dbcon.getData("claims");



            DBCursor cursor = coll.find();
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
                    <a class="navbar-brand" href="#">Admin Panel</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active" ><a href="admin_view_home.jsp"><i class="fa fa-bullseye"></i> Claim Requests</a></li>
                        <li ><a href="admin_view_add_users.jsp"><i class="fa fa-bullseye"></i> Add User Accounts</a></li>
                        <li ><a href="admin_view_edit_users.jsp"><i class="fa fa-bullseye"></i> Edit/Remove User Account</a></li>
                        <li ><a href="admin_view_add_projects.jsp"><i class="fa fa-tasks"></i> Add Current Projects</a></li>

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
                        <h1>Employee Claim Requests<small>&nbsp;&nbsp;</small></h1>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! 
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
                                    <th>Employee Id</th>
                                    <th>Claim Id</th>
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
                                        tableInner += "<td>" + n.getEmpId() + "</td>";
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
                                        <label id="bulk_id" class="label label_1"></label>
                                    </div>
                                </div>
                                <div class="col-md-4"></div>        
                                <div class="col-md-4">
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label  label_1  ">Claim Date&nbsp;:</label>
                                    </div>
                                    <div class="col-md-4">
                                        <label id="bulk_id" class="label label_1"></label>
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





    </div>




</div>

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