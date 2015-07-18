<%-- 
    Document   : home_page_claim_add
    Created on : Mar 2, 2015, 1:07:53 PM
    Author     : Lakshan
--%>

<%@page import="java.util.List"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Claims"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
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

            // for data calendar
            $(document).ready(function() {

                $('#event_date').datepicker({
                    format: "dd/mm/yyyy"
                });
                $('#bill_date').datepicker({
                    format: "dd/mm/yyyy"
                });

            });

            //for image adding
            var xx = 0;

            function show_pic(input) {
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

            //for hide and show div tags
            function add_details() {

                var details = document.getElementById("emp_details").innerHTML;
                document.getElementById("setHere").innerHTML = details;

            }

            function addEmployeDetails() {                                      //get a additional form input for group type input radio btn

                var details = document.getElementById("emp_details").innerHTML; //for visible the details of group claims when choose group clim radio buuton
                document.getElementById("setHere").innerHTML = details;
                
                document.getElementById("internetDiv").style.display = 'none';  // for non visible internet radio button and label
                document.getElementById("setHere").style.display = 'block';     // for visible the additional claim details for group biils   

            }

            function hideEmployeeDetails() {

                document.getElementById("setHere").style.display = 'none';      // for non  visible the additional claim details for group biils  
                document.getElementById("internetDiv").style.display = 'block'; // for visible internet radio button and label
            }

            function hideMealsType() {
                document.getElementById("mealsType").style.display = 'none';    //for hide the meal type row
                document.getElementById("setOptinal").style.display = 'none';   //for non visible the type of row

            }

            function showMealsType() {
                document.getElementById("mealsType").style.display = 'block';   //for visible the type of row
                document.getElementById("setOptinal").style.display = 'none';   //for non visible the type of row
            }


            function otherType() {
                document.getElementById("setOptinal").style.display = 'block';  //for visible the type of row

                var detailsOptinalClaimType = document.getElementById("optionalClaimType").innerHTML; //for set the optinal div to the set optinal div
                document.getElementById("setOptinal").innerHTML = detailsOptinalClaimType;

                document.getElementById("mealsType").style.display = 'none';    //for non visible the type of row
            }

            //for dynamic table create for group claims employee details adding
            var count = 0;
            function addRow() {

                count++;

                var emloyeesid = document.getElementById("employeesId");        //set input value to varible
                var table = document.getElementById("myTableData");

                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);

                row.setAttribute('id', 'row_' + count);                         //set row id & name
                row.setAttribute('name', 'row_' + count);

                row.insertCell(0).innerHTML = (rowCount - 1);                   //insert no to the cell 1 in column 1

                var cell1 = row.insertCell(1);
                var element1 = document.createElement("p");
                element1.setAttribute('name', 'empid_' + count);
                element1.setAttribute('id', 'empid_' + count);                  //set paragraph id & name
                var temp = cell1.appendChild(element1);

                temp.innerHTML = emloyeesid.value;                              //insert cell 2 column 2

                row.insertCell(2).innerHTML = '<a class="btn btn-default btn-sm" onClick="Javacsript:deleteRow(this)">Delete</a>';//insert cell 3 column 3

                //var element1=document.createElement("input");element1.type="text";element1.name="chkbox[]";element1.value=count;
                var a = $('#row_' + count).html();
                window.alert(a);

                var b = $('#empid_' + count).html();
                window.alert(b);

            }

            function deleteRow(obj) {                                           //to delete table row

                var index = obj.parentNode.parentNode.rowIndex;
                var table = document.getElementById("myTableData");
                var rowCount=table.rows.length;
                for(var i=0;i<rowCount;i++){
                    table.deleteRow(index);
                    rowCount--;
                    i--;
                    count--;
                }
            }    
            //Window confirmation when new cliam click event
            function newclaim() {
                var ask = window.confirm("sedddddd?");
               
                if (ask) {
                   
                    var xmlhttp;
                    if (window.XMLHttpRequest)
                    {xmlhttp=new XMLHttpRequest();}
                    else
                    {xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
                    xmlhttp.onreadystatechange=function() {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200)
                        {
                            document.getElementById("content").innerHTML=xmlhttp.responseText;
                            
                        }
                    }
                    window.alert("hi");
                    xmlhttp.open("POST","AddNewClaim",true);
                    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                    xmlhttp.send().value;
                    document.location.href = "home_page_claim_add.jsp";
                    
                }else{
                    //window.alert("New Claim Created !");
                    document.location.href ="home_page.jsp";
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

            Claims c = (Claims) request.getSession().getAttribute("c");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");

            BasicDBObject basic = new BasicDBObject();
            List<BasicDBObject> sl = new ArrayList<BasicDBObject>();
            sl.add(new BasicDBObject("empid", e.getEmpId()));
            try {

                sl.add(new BasicDBObject("claimid", c.getClaimId()));

            } catch (Exception w) {
            }
            basic.put("$and", sl);

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
                    <a class="navbar-brand" href="home_page.jsp">PEARSON</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <!--<li ><a href="home_page.jsp"><i class="fa fa-bullseye"></i> New Claim &nbsp;(Individual)</a></li>--> 

                        <li><a href="home_page.jsp"><i class="fa fa-tasks"></i> Claim History</a></li>       
                        <li class="active"><a href="home_page_claim_add.jsp" onclick="newclaim()"><i class="fa fa-bullseye"></i> New Claim  </a></li>

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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp; <%= e.getfName()%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="edit_profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>

                                <li class="divider"></li>
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
                    <div class="col-lg-12">
                        <h1>New Claim Request <small>&nbsp; </small></h1>

                        <div class="alert alert-success alert-dismissable">                         <!-- Alert massage-->
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                            For the purpose of data visualization, additional widgets are used, so make sure you review all provided information.
                        </div>
                    </div>
                </div>



                <div class="row">

                    <div class="col-lg-12"> 
                        <h3 class="text-center">Claim Form</h3> <hr>
                    </div>




                    <!-- Claim form Start point-->                   
                    <form  action="AddClaim" class="form-control-static marginedit" name="myClaimForm" method="post" ><!--Start point of form-->

                        <div class="row  margin_form"><!-- radoi button for individual or goup claim -->
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="claim_group" id="individualClaim" onclick="hideEmployeeDetails()" value="Individual" checked="checked"  >&nbsp;&nbsp;Individual Claim</label>
                                </div>
                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="claim_group" id="grupClaim" onclick="addEmployeDetails()" value="Group">&nbsp;&nbsp;Group Claim</label>

                                </div>
                            </div>
                        </div>

                        <div class="row  margin_form"><!-- row number 1 -->

                            <div class="col-md-6">
                                <!--      <div class="col-md-2"></div>-->
                                <div class="col-md-4">
                                    <label id="bulk_id" class="label  label_1  ">Claim ID &nbsp;:</label>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">

                                        <input name="claimid" id="bulk_id" class="form-control input-lg" readonly value="<%= c.getClaimId()%>" > </input>

                                    </div>	
                                </div>
                            </div>

                            <!-- <div class="col-md-6 ">
                                 <div class="col-md-4">
                                     <label id="claim_id" class="label label_1  ">Claim ID &nbsp;:</label>
                                 </div>
                                 <div class="col-md-4">
 
                                     <label id="claim_id " class="label  label_1  label-default">001</label>
 
 
                                 </div>
                             </div>-->

                        </div>  <!--end of row number 1-->

                        <div class="row margin_form" ><!-- row number 2 -->

                            <div class="col-md-6">
                                <!--                 <div class="col-md-2"></div>-->
                                <div class="col-md-4">
                                    <label id="type_of_claim" class="label  label_1">Bill Type &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">

                                    <div id="foodDiv">
                                        <label class="label label_1 " >
                                            <input onclick="showMealsType()" type="radio" checked name="type_of_claim" id="type_of_claim_food" value="Food" >&nbsp;&nbsp;Food</label>
                                    </div>
                                    <div id="internetDiv"> 
                                        <label class="label label_1 " id="labelInternet" >
                                            <input onclick="hideMealsType()" type="radio" name="type_of_claim" id="type_of_claim_internet" value="Internet" >&nbsp;&nbsp;Internet</label>
                                    </div>
                                    <div id="otherDiv"> 
                                        <label class="label label_1 " id="otherlabel" >
                                            <input onclick="otherType()" type="radio" name="type_of_claim" id="type_of_claim_other" value="Other"  >&nbsp;&nbsp;Other</label>
                                    </div>

                                    <!-- <select id="type_of_claim" name="type_of_claim" class="dropdown_signup form-control" placeholder="Claim Type" style="height:37px;">
                                          <option value="Null">~~Select~~</option>
                                          <option value="Food Bills"> Food Bills</option>
                                          <option value="Internet Bills"> Internet Bills</option>
  
                                      </select>-->

                                </div>
                            </div>

                            <div class="col-md-6" id="setOptinal" style="display: none;"> <!-- set here the optional div-->
                            </div>

                            <div class="col-md-6" id="mealsType">
                                <div class="col-md-4">
                                    <label id="project" class="label  label_1">Meals Type &nbsp;&nbsp;&nbsp;:</label>
                                </div> 
                                <div class="col-md-7">
                                    <div >
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="breakfast" value="Breakfast"  >&nbsp;&nbsp;Breakfast</label>
                                    </div>
                                    <div >
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="lunch"  value="Lunch">&nbsp;&nbsp;Lunch</label>
                                    </div >
                                    <div  >
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="dinner"  value="Dinner">&nbsp;&nbsp;Dinner</label>
                                    </div>
                                </div>

                            </div>

                        </div>  <!--end of row number 2-->

                        <div id="optionalClaimType" style="display:none;"><!-- Optional div -->

                            <div class="col-md-4">
                                <label id="project" class="label  label_1">Optional Type &nbsp;:</label>
                            </div>
                            <div class="col-md-7  ">
                                <input name="OptinalClaim" class="form-control input-lg" type="text" placeholder="New Claim Type"  >
                            </div>

                        </div>

                        <div class="row margin_form"><!-- row number 3 -->

                            <div class="col-md-6">

                                <div class="col-md-4">
                                    <label id="billdate" class="label  label_1">Bill Date &nbsp;:</label>
                                </div>

                                <div class="col-md-6 input-group " style="padding-left: 15px;">
                                    <input required id="bill_date" name="bill_date" class="form-control input-lg" type="text" placeholder="MM/DD/YY" >
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>

                            </div>


                        </div>  <!--end of row number 3-->

                        <div class="row margin_form"><!-- row number 4 -->

                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label id="project" class="label  label_1">Amount &nbsp;:</label>
                                </div>
                                <div class="col-md-7  ">
                                    <input required name="amount" class="form-control input-lg" type="text" placeholder="Amount"   >
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label id="project" class="label  label_1">Project &nbsp;&nbsp;&nbsp;&nbsp;:</label>
                                </div>
                                <div class="col-md-7">
                                    <select id="project" name="project" class="dropdown_signup form-control" placeholder="Claim Type" style="height:37px;">
                                        <option value="">~~Select~~</option>
                                        <%

                                            DBCollection coll2 = dbcon.getData("projects");
                                            DBCursor cursor2 = coll2.find();

                                            while (cursor2.hasNext()) {// start of while loop 
                                                String list = cursor2.next().get("projname").toString();
                                        %>


                                        <option value=" <%= list%>"><%= list%>
                                        </option>

                                        <% }%> // end of while loop

                                    </select>
                                </div>
                            </div>

                        </div>  <!--end of row number 4-->

                        <div class="row margin_form"><!-- row number 5 -->

                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label id="description" class="label  label_1">Description &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">
                                    <textarea class="form-control input-lg" name="description" id="description" rows="5"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label id="attachment" class="label  label_1">Attachment &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">
                                    <input id="attachment" name="attachment"  type="file"  onchange="show_pic(this)" placeholder="Attachment" >
                                    <img style="width: 150px; height: auto;" id="reg_pro_pic1" src="images/photo-placeholder.gif" onchange="show_pic(this)">


                                </div>
                            </div>

                        </div>  <!--end of row number 5-->                       

                        <div class="row margin_form"><!-- additional details of employee grp claim-->

                            <div class="col-md-12 "  >

                                <div class="row margin_form " ><!-- inside the emplyee details -->

                                    <div id="setHere" class="col-md-12 " ></div>	
                                </div>  <!--end of inside the emplyee details-->


                            </div>

                        </div>  <!--end of row number 5-->

                        <div  id="emp_details" style="display:none;">	 <!--Details of employee/run via javascript   strat point-->

                            <div class="row " > <!--start of row number 1-->
                                <div class="col-md-12"><label class="label label_2 text-primary"> Details of Group Claim</label></div>
                            </div> <!--end of row number 1-->

                            <div class="row margin_form "> <!--start of row number 2-->

                                <div class="col-md-12">
                                    <div class="col-md-10">
                                        <p class="text-danger">This Details are required for employees who take the group claims</p>
                                    </div>


                                </div>

                            </div><!--end of row number 2-->



                            <div class="row margin_form" id="employeeDetails" ><!-- row number 3 in grp claim form-->

                                <div class="col-md-6" style="padding-top:30px;">

                                    <div class="col-md-4">
                                        <label id="labelEmpId" class="label  label_1">Employee ID &nbsp;:</label>
                                    </div>
                                    <div class="col-md-5">
                                        <input name="employeesId" id="employeesId" class="form-control input-lg" type="text" placeholder="Employee ID" >
                                    </div>

                                    <a class="btn btn-primary" id="btn3" onclick="addRow()"> here to add</a>
                                </div>

                                <div class="col-md-5 thumbnail">
                                    <p class="text-primary">Details of Employee</p>
                                    <div class="table-responsive col-md-10 col-md-offset-1 " align="center" >
                                        <table class="table table-hover" id="myTableData"   >
                                            <thead align="center" class="text-primary"  >

                                                <tr>
                                                    <td>&nbsp;No </td>
                                                    <td>&nbsp;Employee ID </td>
                                                    <td></td>

                                                </tr>
                                            </thead>
                                            <tbody id="list tbody" name="list tbody">

                                                <tr>
                                                </tr>  
                                            </tbody>
                                        </table>

                                    </div>


                                </div><!--end  row number 3 in grp claim form-->



                            </div>  
                        </div>     <!--Details of employee/run via javascript   end point -->

                        <div class="row"><!-- row number 5 -->
                            <div class="col-md-9"></div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-danger active button  " style="margin-top:20px;width:100%; "  ><!--Add button -->
                                    <span class="glyphicon glyphicon-th"></span>&nbsp;Add Claims
                                </button>         	
                            </div>
                            <div class="col-md-1"></div>
                        </div>

                    </form>
                    <!-- End of the claim add form -->


                </div>

                <div class="col-md-12"> 
                    <hr> <h3 class="text-center">Claim Details</h3> <hr>
                </div>
                <!-- Claim details table//when add the claim form details,all data are going here-->   

                <div class="col-md-1"></div>
                <div class="table-responsive margin_form col-md-10 ">

                    <table class="table table-bordered tableStyle" >
                        <thead align="center" >
                            <tr>
                                <td>&nbsp;Bill </td>
                                <td>&nbsp;Bill Date</td>
                                <td>&nbsp;Claim Type</td>
                                <td>&nbsp;Bill Type</td>
                                <td>&nbsp;Meal Type</td>
                                <td>&nbsp;Project</td>
                                <td>&nbsp;Amount</td>
                                <td>&nbsp;Option</td>



                            </tr>

                        </thead>


                        <tbody id="list tbody" name="list tbody" align="center">

                            <%
                                String tableInner = "";
                                DBObject dbo = cursor.next();
                                ArrayList li = (ArrayList) dbo.get("details");


                                if (!li.isEmpty()) {


                                    Iterator<BasicDBObject> intI = li.iterator();
                                    while (intI.hasNext()) {
                                        BasicDBObject o = intI.next();
                                        Claims cl = Claims.fromDBObject(o);
                                        tableInner += "<tr>";
                                        tableInner += "<td>" + cl.getBillDate() + "</td>";
                                        tableInner += "<td>" + cl.getBillDate() + "</td>";
                                        tableInner += "<td>" + cl.getClaimGroup() + "</td>";
                                        tableInner += "<td>" + cl.getBillType() + "</td>";
                                        tableInner += "<td>" + cl.getMealType() + "</td>";
                                        tableInner += "<td>" + cl.getProject() + "</td>";
                                        tableInner += "<td>" + cl.getAmount() + "</td>";
                                        tableInner += "<td>" + "<a href=\"#\">Edit&nbsp;</a>" + " &nbsp;  " + "<a href=\"#\">Delete</a>" + "</td>";
                                        tableInner += "</tr>";

                                    }

                                }






                            %>
                            <%=tableInner%>    
                        </tbody>
                    </table>
                </div>	

                <div class="row margin_form " style="padding-left: 50px;"><!-- Submit button -->
                    <div class="col-md-9"></div>
                    <div class="col-md-2" >
                        <button type="submit" class="btn btn-primary button pull-right " style="margin-top:10px;width:100%;"  ><!--Add button -->
                            <span class="glyphicon glyphicon-th"></span>&nbsp;Submit
                        </button>
                    </div>
                    <div class="col-md-1"></div>
                </div>

            </div><!--# page wrapper-->

        </div><!--# wrapper-->


    </body>
</html>

