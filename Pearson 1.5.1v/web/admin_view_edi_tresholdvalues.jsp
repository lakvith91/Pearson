<%-- 
    Document   : index
    Created on : Mar 2, 2015, 1:06:05 PM
    Author     : Lakshan
--%>

<%@page import="com.beans.Claims"%>										Me tike coment ain kara ganna
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
        <div id="wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" >            
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="">Admin Panel</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                         <li><a href="admin_view_home.jsp"><i class="fa fa-bullseye"></i> Claim Requests</a></li>
                        <li ><a href="admin_view_add_users.jsp"><i class="fa fa-bullseye"></i> Add User Account</a></li>
                        <li ><a href="admin_view_edit_users.jsp"><i class="fa fa-bullseye"></i> Edit User Account</a></li>
                        <li><a href="admin_view_add_projects.jsp"><i class="fa fa-tasks"></i> Add Current Projects</a></li> 
                        <li class="active"><a href="admin_view_edi_tresholdvalues.jsp"><i class="fa fa-bullseye"></i>Edit Treshold Value</a></li>
                        <!-- <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
                        <li><a href="forms.html"><i class="fa fa-list-ol"></i> Forms</a></li>
                        <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                        <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                        <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i > Bootstrap Grid</a></li>  -->                  
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp; PEARSON  <b class="caret"></b></a>
                            <ul class="dropdown-menu">
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

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Treshold Value<small>&nbsp;&nbsp;</small></h1>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                            For the purpose of data visualization, additional widgets are used, so make sure you review all provided information.
                        </div>
                    </div>
                </div>




                <div class="row">

                    <div class="col-lg-12"> 
                        <hr> <h3 class="text-center">Add new Treshhold or Edit</h3> <hr>
                    </div>

                    <div class="col-lg-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>&nbsp;Edit Treshold Value</h3>
                            </div>
                            <div class="panel-body">

                                <div class="row margin_form">

                                    <div class="col-lg-12">
                                        <form  action="" class="form-control-static marginedit" name="addAgmList" method="post" >
                                            <div class="form-group row margin_form">
                                                <label class="col-lg-5 control-label" style="text-align:right">Monthly Total Claim Value &nbsp;</label>
                                                
                                                <div class="col-lg-3">
                                                    <input class="form-control" type="text" value="Rs.5000.00" name="agmID">
                                                </div>
                                            </div>
                                            <div class="form-group row  ">
                                                <div class="col-lg-1 control-label" > </div>
                                                <div class="col-lg-6">
                                                    <h4 class="text-danger" >Margin Value For Group Claim </h4>
                                                </div>
                                            </div>

                                            <div class="form-group row  ">
                                                <label class="col-lg-5 control-label " style="text-align:right">For Breakfast &nbsp;:</label>
                                                <div class="col-lg-3">
                                                    <input class="form-control" type="text" value="Rs.120.00" name="breakfast">
                                                </div>
                                            </div>
                                            <div class="form-group row  ">
                                                <label class="col-lg-5 control-label " style="text-align:right">For Lunch &nbsp;:</label>
                                                <div class="col-lg-3">
                                                    <input class="form-control" type="text" value="Rs.400.00" name="lunch">
                                                </div>
                                            </div>
                                            <div class="form-group row  ">
                                                <label class="col-lg-5 control-label " style="text-align:right">For Dinner &nbsp;:</label>
                                                <div class="col-lg-3">
                                                    <input class="form-control" type="text" value="Rs.400.00" name="dinner">
                                                </div>
                                            </div>
                                            <div class="form-group row margin_form">
                                                <label class="col-md-7 control-label"></label>
                                                <div class="col-md-5">
                                                    <button type="submit" class="btn btn-primary button  " ><!--Add button -->
                                                        <span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;Save changes
                                                    </button>    											              <span></span>
                                                    <button type="reset" class="btn btn-default  button  " ><!--Add button -->
                                                        <span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;Clear
                                                    </button>         	
                                                </div>
                                            </div>

                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--         <div class="col-lg-6">
                                   <div class="panel panel-primary">
                                       <div class="panel-heading">
                                           <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>&nbsp; Project Managers </h3>
                                       </div>
                                       <div class="panel-body">
                                   <div class="row margin_form">
                                                        <div class="col-lg-12" >
                                                          <div class="table-responsive " align="center">
                                                              <table class="table table-bordered tableStyle" >
                                                                  <thead align="center" class="text-primary"  >
          
                                                                      <tr>
                                                                          <td>&nbsp;No</td>
                                                                          <td>&nbsp;PM ID </td>
                                                                           <td>&nbsp;PM Name </td>
          
                                                                      </tr>
                                                                  </thead>
                                                                  <tbody id="list tbody" name="list tbody" align="center">
                                                                      <tr>
                                                                          <td >&nbsp;01</td>
                                                                          <td>&nbsp;124043</td>
                                                                          <td>&nbsp;Manager 1</td>
          
                                                                      </tr>
          
          
                                                                  </tbody>
                                                              </table>
          
                                                          </div>
                                                      </div>
                                                  </div>
                                                  <div class="col-lg-12">
                                                        <form  action="" class="form-control-static marginedit" name="addPmList" method="post" >
                                                                 <div class="form-group row margin_form">
                                                                                                              <label class="col-lg-4 control-label" style="text-align:right">PM ID &nbsp;:</label>
                                                                                                              <div class="col-lg-6">
                                                                                                                <input class="form-control" type="text" value="" name="agmID">
                                                                                                              </div>
                                                                                                            </div>
                                                               <div class="form-group row  ">
                                                                                                              <label class="col-lg-4 control-label " style="text-align:right">PM Name &nbsp;:</label>
                                                                                                              <div class="col-lg-6">
                                                                                                                <input class="form-control" type="text" value="" name="agmName">
                                                                                                              </div>
                                                                                                            </div>
                                                                                                                  <div class="form-group row margin_form">
                                                                                                              <label class="col-md-8 control-label"></label>
                                                                                                              <div class="col-md-3">
                                                                                                                 <button type="submit" class="btn btn-default active button  " ><!--Add button -->
                        <!--                		<span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;Add
                                                            </button>         	
    
                                                                        </div>
                                                                      </div>


                                                              </form>
            </div>
      
      </div>
 </div>
</div>     

    <div class="col-lg-6">
<div class="panel panel-primary">
 <div class="panel-heading">
     <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>&nbsp;Current Projects  </h3>
 </div>
 <div class="panel-body">
<div class="row margin_form">
                  <div class="col-lg-12" >
                    <div class="table-responsive " align="center">
                        <table class="table table-bordered tableStyle" >
                            <thead align="center" class="text-primary"  >

                                <tr>
                                    <td>&nbsp;No</td>
                                    <td>&nbsp;Project ID </td>
                                     <td>&nbsp;Project Name </td>

                                </tr>
                            </thead>
                            <tbody id="list tbody" name="list tbody" align="center">
                                <tr>
                                    <td >&nbsp;01</td>
                                    <td>&nbsp;1100</td>
                                    <td>&nbsp;Project 1</td>

                                </tr>


                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                  <form  action="" class="form-control-static marginedit" name="addProject" method="post" >
                           <div class="form-group row margin_form">
                                                                        <label class="col-lg-4 control-label" style="text-align:right">Project ID &nbsp;:</label>
                                                                        <div class="col-lg-6">
                                                                          <input class="form-control" type="text" value="" name="agmID">
                                                                        </div>
                                                                      </div>
                         <div class="form-group row  ">
                                                                        <label class="col-lg-4 control-label " style="text-align:right">Project Name &nbsp;:</label>
                                                                        <div class="col-lg-6">
                                                                          <input class="form-control" type="text" value="" name="agmName">
                                                                        </div>
                                                                      </div>
                                                                            <div class="form-group row margin_form">
                                                                        <label class="col-md-8 control-label"></label>
                                                                        <div class="col-md-3">
                                                                           <button type="submit" class="btn btn-default active button  " ><!--Add button -->
                        <!--                  		<span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;Add
                                                              </button>         	
      
                                                                          </div>
                                                                        </div>


                                                                </form>
              </div>
        
        </div>
   </div>
</div>     



</div><!-- End row-->


                        <!-- Sign Up form using div tags START-->


                        <!--               <form action="AddEmployee" method="post" >   <!-- Start Form-->

                        <!--                      <div class="col-md-6"> <!-- Start of main two coloumn left-->

                        <!--                          <div class="row"><!-- first row on left -->

                        <!--                            <div class="col-md-4">
                                                    <div class="label label_1">First Name &nbsp;:</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <input name="fname" type="text" class="form-control input-lg" placeholder="First Name*">
                                                    </div>
                                                </div>
                                            </div><!-- first row end -->

                        <!--                      <div class="row" style="margin-top:20px;"><!-- Second row on left -->

                        <!--                       <div class="col-md-4 ">
                                               <div class="label label_1">Password &nbsp;:</div>
                                           </div>
                                           <div class="col-md-7">
                                               <div class="form-group">
                                                   <input name="password" type ="password" class="form-control input-lg" placeholder="Password*"  id="pass1">
                                               </div>
                                           </div>
                                       </div><!-- Second row end -->

                        <!--                      <div class="row" style="margin-top:20px;"><!-- Third row on left-->

                        <!--                      <div class="col-md-4 ">
                                              <div class="label label_1">Confirm Password &nbsp;:</div>
                                          </div>
                                          <div class="col-md-7">
                                              <div class="form-group">
                                                  <input name="password2" type="password" class="form-control input-lg" placeholder="Confirm Password*"  id="pass2" onkeyup="checkPass();">
                                              </div>
                                          </div>
                                      </div><!-- Third row end -->

                        <!--                <div class="row"  style="margin-top:20px;"><!-- Forth row start on left-->

                        <!--                    <div class="col-md-4 ">
                                            <div class="label label_1">Employee ID&nbsp;:</div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <input name="empid" type="text" class="form-control input-lg" placeholder="Employee ID*">
                                            </div>
                                        </div>
                                    </div><!-- Forth row end -->



                        <!--             </div><!-- end of main two coloumn left-->

                        <!--              <div class="col-md-6"><!-- Start of main two coloumn Right-->

                        <!--                  <div class="row"><!-- First row Start on right -->

                        <!--                   <div class="col-md-4">
                                           <div class="label label_1">Last Name&nbsp;:</div>
                                       </div>
                                       <div class="col-md-7">
                                           <div class="form-group">
                                               <input name="lname" type="text" class="form-control input-lg" placeholder="Last Name*">
                                           </div>
                                       </div>
                                   </div><!-- First row end -->


                        <!--                <div class="row" style="margin-top:20px;"><!-- Secend row Start on right -->
                        <!--                   <div class="col-md-4 ">
                                           <div class="label label_1">Designation&nbsp;:</div>
                                       </div>
                                       <div class="col-md-7">
                                           <div class="form-group">
                                               <select class="dropdown_signup" name="designation" id="designation"> 
                                                   <option value="-1">Designation*</option>
                                                   <option value="1">Project Manager</option>
                                                   <option value="2">Business Architecture</option>
                                                   <option value="3">Software Engineer</option>
                                                   <option value="4">System Developer</option>
                                                   <option value="5">UI Designer</option>
                                                   <option value="6">UI Engineer</option>
                                                   <option value="7">Quality Assurancer </option>
                                               </select>
       
                                           </div>
                                       </div>
                                   </div><!-- Seceond row end -->

                        <!--                <div class="row"  style="margin-top:20px;"><!-- Third row start on Right-->

                        <!--                  <div class="col-md-4 ">
                                          <div class="label label_1">Reporting AGM&nbsp;:</div>
                                      </div>
                                      <div class="col-md-7">
                                          <div class="form-group">
                                              <select class="dropdown_signup" name="agm" id="agm">
                                                  <option value="-1">Reporting AGM*</option>
                                                  <option value="1">Option 1</option>
                                                  <option value="2">Option 2</option>
                                                  <option value="3">Option 3</option>
                                                  <option value="4">Option 4</option>
                                                  <option value="5">Option 5</option>
                                                  <option value="6">Option 6</option>
                                                  <option value="7">Option 7 </option>
                                              </select>
      
                                          </div>
                                      </div>
                                  </div><!-- third row end -->

                        <!--                   <div class="row"  style="margin-top:20px;"><!-- forth row start on Right-->

                        <!--                   <div class="col-md-4 ">
                                           <div class="label label_1">Reporting PM&nbsp;:</div>
                                       </div>
                                       <div class="col-md-7">
                                           <div class="form-group">
                                               <select class="dropdown_signup" name="proman" id="pm">
                                                   <option value="-1">Reporting Project Manager*</option>
                                                   <option value="1">Option 1</option>
                                                   <option value="2">Option 2</option>
                                                   <option value="3">Option 3</option>
                                                   <option value="4">Option 4</option>
                                                   <option value="5">Option 5</option>
                                                   <option value="6">Option 6</option>
                                                   <option value="7">Option 7 </option>
                                               </select>
       
                                           </div>
                                       </div>
                                   </div><!-- forth row end -->

                        <!--                      <div class="row" style="margin-top:20px;margin-bottom:10px;"><!-- Fifth row start on Right-->

                        <!--                     <div class="col-md-7"></div>
                                         <div class="col-md-4">
                                             <div class="form-group  "><!-- Sign up button-->

                        <!--                           <button type="submit" class="btn  button btn-primary  ">
                                                   <span class=" glyphicon glyphicon-upload"></span> 
                                                   Create Account</button>
       
                                           </div>
       
       
       
                                       </div>
       
       
       
                                   </div><!-- Fifth row end -->


                        <!--          </div><!-- end of main two coloumn right-->

                        <!--       </form> <!-- End Form-->






                    </div>



                    <!--     <div class="row">
                             <div class="col-lg-3">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-clock-o"></i>Alerts</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div class="row alert-success">
                                             <div class="col-xs-5">
                                                 <i class="fa fa-thumbs-o-up fa-5x"></i>
                                             </div>
                                             <div class="col-xs-5 text-right">
                                                 <p class="alerts-heading">343</p>
                                                 <p class="alerts-text">New Orders</p>
                                             </div>
                                         </div>
                                         <div class="row alert-success">
                                             <div class="col-xs-5">
                                                 <i class="fa fa-thumbs-o-up fa-5x"></i>
                                             </div>
                                             <div class="col-xs-5 text-right">
                                                 <p class="alerts-heading">1256</p>
                                                 <p class="alerts-text">Registrations</p>
                                             </div>
                                         </div>
                                         <div class="row alert-danger">
                                             <div class="col-xs-5">
                                                 <i class="fa fa-thumbs-o-down fa-5x"></i>
                                             </div>
                                             <div class="col-xs-5 text-right">
                                                 <p class="alerts-heading">4</p>
                                                 <p class="alerts-text">Errors</p>
                                             </div>
                                         </div>
                                         <div class="row alert-success">
                                             <div class="col-xs-5">
                                                 <i class="fa fa-thumbs-o-up fa-5x"></i>
                                             </div>
                                             <div class="col-xs-5 text-right">
                                                 <p class="alerts-heading">11</p>
                                                 <p class="alerts-text">Mentions</p>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-lg-9">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Traffic Estimations for last 30 days</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div id="shieldui-chart1"></div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-lg-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Logins per week</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div id="shieldui-chart2"></div>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Budget</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div id="shieldui-chart3"></div>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Purchases</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div id="shieldui-chart4"></div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-lg-12">
                                 <div class="panel panel-primary">
                                     <div class="panel-heading">
                                         <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Sales personnel Data</h3>
                                     </div>
                                     <div class="panel-body">
                                         <div id="shieldui-grid1"></div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                    <!-- /.row -->
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
                    /*  jQuery(function ($) {
                     var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                     visits = [123, 323, 443, 32],
                     budget = [23, 19, 11, 134, 242, 352, 435, 22, 637, 445, 555, 57],
                     sales = [11, 9, 31, 34, 42, 52, 35, 22, 37, 45, 55, 57];
         
                     $("#shieldui-chart1").shieldChart({
                     primaryHeader: {
                     text: "Visitors"
                     },
                     exportOptions: {
                     image: false,
                     print: false
                     },
                     dataSeries: [{
                     seriesType: "area",
                     collectionAlias: "Q Data",
                     data: performance
                     }]
                     });
         
                     $("#shieldui-chart2").shieldChart({
                     primaryHeader: {
                     text: "Logins Per week"
                     },
                     exportOptions: {
                     image: false,
                     print: false
                     },
                     seriesSettings: {
                     donut: {
                     enablePointSelection: true
                     }
                     },
                     dataSeries: [{
                     seriesType: "donut",
                     collectionAlias: "logins",
                     data: visits
                     }]
                     });
         
                     $("#shieldui-chart3").shieldChart({
                     primaryHeader: {
                     text: "Budget"
                     },
                     dataSeries: [{
                     seriesType: "line",
                     collectionAlias: "Budget",
                     data: budget
                     }]
                     });
         
                     $("#shieldui-chart4").shieldChart({
                     primaryHeader: {
                     text: "Sales"
                     },
                     dataSeries: [{
                     seriesType: "bar",
                     collectionAlias: "sales",
                     data: sales
                     }]
                     });
         
                     $("#shieldui-grid1").shieldGrid({
                     dataSource: {
                     data: gridData
                     },
                     sorting: {
                     multiple: true
                     },
                     paging: {
                     pageSize: 12,
                     pageLinksCount: 4
                     },
                     selection: {
                     type: "row",
                     multiple: true,
                     toggle: false
                     },
                     columns: [
                     { field: "id", width: "70px", title: "ID" },
                     { field: "name", title: "Person Name" },
                     { field: "company", title: "Company Name" },
                     { field: "email", title: "Email Address", width: "270px" }
                     ]
                     });
                     });
                     */

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

