<%-- 
    Document   : home_page_claim_add
    Created on : Mar 2, 2015, 1:07:53 PM
    Author     : Lakshan
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.beans.Notifications"%>
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
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!-- Link for javascript-->
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.ajaxfileupload.js"></script>
        <script type="text/javascript" src="js/jquery.MultiFile.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script><!--load data table jquary-->
        <!-- Load jQuery and bootstrap datepicker scripts -->
        <script src="js/jQuery v1.9.1.js"></script>
        <script src="js/boostrap_datepicker.js"></script>

        <script type="text/javascript">

            // for data calendar
            $(document).ready(function () {

                
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
                    reader.onload = function (e) {
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
                document.getElementById('lunch').checked = false;
                document.getElementById('food_type').checked = false;
                document.getElementById('dinner').checked = false;


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
                document.getElementById('lunch').checked = false;
                document.getElementById('food_type').checked = false;
                document.getElementById('dinner').checked = false;
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
                var rowCount = table.rows.length;
                for (var i = 0; i < rowCount; i++) {
                    table.deleteRow(index);
                    rowCount--;
                    i--;
                    count--;
                }
            }

            //ajax jquary

            $(document).ready(function () {
                $("#add").show();
                $("#update").hide();
                
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

                $("#send").click(function () {
                    claimid = $("#claimid").val();
                    empid = $("#empid").val();

                    var ask = window.confirm("You sure you want to Submit Claim?");
                    if (ask) {

                        //window.alert(claimid);
                        $.ajax({
                            type: "POST",
                            url: "SubmitToManager",
                            data: "claimid=" + claimid + "&empid=" + empid,
                            success: function (data) {
                                window.alert(data);
                                document.location.href = "home_page.jsp";
                            }
                        });
                    } else {
                        $.ajax({
                            type: "POST",
                            url: "CancelSubmit",
                            data: "",
                            success: function (data) {
                                document.location.href = "home_page.jsp";
                            }
                        });

                    }
                });
                $("a.editlink").click(function () {
                    
                    $("#add").hide();
                    $("#update").show();
                    var jsonObj = $(this).data("val");
                    var jsonStr = JSON.stringify(jsonObj);
                    var json = JSON.parse(jsonStr);

                    if (json['claimgroup'] == "Individual") {
                        $('input:radio[name=claim_group]')[0].checked = true;
                    } else {
                        $('input:radio[name=claim_group]')[1].checked = true;
                    }

                    if (json['billtype'] == "Food") {
                        $('input:radio[name=type_of_claim]')[0].checked = true;
                        $('mealsType').show();
                    } else if (json['billtype'] == "Internet") {
                        $('input:radio[name=type_of_claim]')[1].checked = true;
                        $('input:radio[name=food_type]')[0].checked = false;
                        $('input:radio[name=food_type]')[1].checked = false;
                        $('input:radio[name=food_type]')[2].checked = false;
                        $('#mealsType').hide();
                    } else {
                        $('input:radio[name=type_of_claim]')[2].checked = true;
                        $('input:radio[name=food_type]')[0].checked = false;
                        $('input:radio[name=food_type]')[1].checked = false;
                        $('input:radio[name=food_type]')[2].checked = false;
                        $('#mealsType').hide();
                    }

                    if (json['mealtype'] == "Breakfast")
                        $('input:radio[name=food_type]')[0].checked = true;
                    else if (json['mealtype'] == "Lunch")
                        $('input:radio[name=food_type]')[1].checked = true;
                    else if (json['mealtype'] == "Dinner")
                        $('input:radio[name=food_type]')[2].checked = true;

                    $("#amount").val(json['amount']);
                    $("#docid").val(json['docid']);
                    $("#attachment").val(json['attachment']);
                    $("#amount").val(json['amount']);//done
                    $("#project").val(json['project']);//done
                    $("#bill_date").val(json['billdate']);//done
                    $("#description").val(json['description']);//done


                });
                ///////////////////////////////////////
                $("a.dellink").click(function () {

                    var id = $(this).data("val");
                    var claimid = $(this).data("claimid");
                    var amount = $(this).data("amount");

                    var ask = window.confirm("Are you sure you want to Delete?");
                    if (ask == true) {

                        $.ajax({
                            type: "POST",
                            url: "DeleteClaims",
                            data: "id=" + id + "&claimid=" + claimid + "&amount=" + amount,
                            success: function (data) {
                                //alert(data);
                                document.location.href = "home_page_claim_add.jsp";

                            }
                        });
                    } else {
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
            DBCollection notifycoll = dbcon.getData("notifications");

            BasicDBObject notifyFill = new BasicDBObject("receiver", e.getEmail());
            notifyFill.append("read", false);
            DBCursor notifycursor = notifycoll.find(notifyFill);

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
                    <a class="navbar-brand" href="home_page.jsp"><b>PEARSON</b></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav"> 
                        <li><a title="Employee Claim History" href="home_page.jsp"><i class="fa fa-history"></i> &nbsp;My History</a></li>       
                        <li class="active"><a name="claimRequest" title="Create New Claim" href="home_page_claim_add.jsp" onclick="newclaim()"><i class="fa fa-file-text"></i> &nbsp;New Claim  </a></li>
                            <%
                                if (e.getDesignation().equals("2") || e.getDesignation().equals("3")) {
                            %>
                        <li ><a href="claim_request.jsp" title="Received Claim Requests from Employees" ><i class="fa fa-table"></i> &nbsp;View Claim Request</a></li> 
                            <%                             }
                            %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right ">
                        <li class="dropdown messages-dropdown">
                            <a href="#" class="notifylink" title="Notifications" data-email=<%= e.getEmail()%>""  class="dropdown-toggle" data-toggle="dropdown">  <i class="fa fa-bell-o"></i>
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
                                        <button type="submit" class="btn btn-danger" title="Logout">
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
                    <div class="col-lg-12">
                        <h2>New Claim Request</h2>
                        <div class="alert alert-info alert-dismissable"><!-- Alert massage-->
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Welcome <b><%= e.getfName()%> </b> to PEARSON Claim Management System Employee View.You can Send claim requests, View your claim history and the current status of requested claims. 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Claim form Start point-->                   
                    <form  class="form-control-static marginedit" name="myClaimForm" method="post" enctype="multipart/form-data"><!--Start point of form-->
                        <div class="row  margin_form"><!-- radio button for individual or group claim -->
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="claim_group" id="claim_group1" onclick="hideEmployeeDetails()" value="Individual" checked="checked"  >&nbsp;&nbsp;Individual Claim</label>
                                </div>
                                <div class="col-md-3">
                                    <label class="label label_1 " ><input type="radio" name="claim_group" id="claim_group2" onclick="addEmployeDetails()" value="Group">&nbsp;&nbsp;Group Claim</label>

                                </div>
                                <div class="col-md-1">
                                    <label class="label label_1 " ><input type="hidden" name="empid" id="empid" value="<%= e.getEmpId()%>"></label>
                                    <label class="label label_1 " ><input type="hidden" name="docid" id="docid" value=""></label>
                                </div>
                            </div>
                        </div>

                        <div class="row  margin_form"><!-- row number 1 -->
                            <div class="col-md-6">                               
                                <div class="col-md-4">
                                    <label  class="label  label_1  ">Claim ID &nbsp;:</label>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <input name="claimid" id="claimid" class="form-control input-lg" readonly value="<%= c.getClaimId()%>"> </input>
                                    </div>	
                                </div>
                            </div>
                        </div>  <!--end of row number 1-->
                        <div class="row margin_form" ><!-- row number 2 -->
                            <div class="col-md-6">                                
                                <div class="col-md-4">
                                    <label  class="label  label_1">Bill Type &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">
                                    <div id="foodDiv">
                                        <label class="label label_1 " >
                                            <input onclick="showMealsType()" type="radio" checked name="type_of_claim" id="type_of_claim1" value="Food" >&nbsp;&nbsp;Food</label>
                                    </div>
                                    <div id="internetDiv"> 
                                        <label class="label label_1 " id="labelInternet" >
                                            <input onclick="hideMealsType()" type="radio" name="type_of_claim" id="type_of_claim2" value="Internet" >&nbsp;&nbsp;Internet</label>
                                    </div>
                                    <div id="otherDiv"> 
                                        <label class="label label_1 " id="otherlabel" >
                                            <input onclick="otherType()" type="radio" name="type_of_claim" id="type_of_claim3" value="Other"  >&nbsp;&nbsp;Other</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" id="setOptinal" style="display: none;"> <!-- set here the optional div-->
                            </div>
                            <div class="col-md-6" id="mealsType">
                                <div class="col-md-4">
                                    <label  class="label  label_1">Meals Type &nbsp;&nbsp;&nbsp;:</label>
                                </div> 
                                <div class="col-md-7">
                                    <div >
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="food_type" value="Breakfast"  >&nbsp;&nbsp;Breakfast</label>
                                    </div>
                                    <div>
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="lunch"  value="Lunch">&nbsp;&nbsp;Lunch</label>
                                    </div>
                                    <div>
                                        <label class="label label_1 " ><input type="radio" name="food_type" id="dinner"  value="Dinner">&nbsp;&nbsp;Dinner</label>
                                    </div>
                                </div>
                            </div>
                        </div>  <!--end of row number 2-->
                        <div id="optionalClaimType" style="display:none;"><!-- Optional div -->
                            <div class="col-md-4">
                                <label  class="label  label_1">Optional Type &nbsp;:</label>
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
                                    <input required id="bill_date" name="bill_date" class="form-control input-lg"  title="Bill Date On receipt" type="text" placeholder="MM/DD/YY" >
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                        </div>  <!--end of row number 3-->
                        <div class="row margin_form"><!-- row number 4 -->
                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label class="label  label_1">Amount &nbsp;:</label>
                                </div>
                                <div class="col-md-7  ">
                                    <input required name="amount" id="amount" class="form-control input-lg" type="text" placeholder="Amount"   >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label class="label  label_1">Project &nbsp;&nbsp;&nbsp;&nbsp;:</label>
                                </div>
                                <div class="col-md-7">
                                    <select id="project" name="project" class="dropdown_signup form-control"  style="height:37px;">
                                        <option value=""></option>
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
                                    <label  class="label  label_1">Description &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">
                                    <textarea id="description" class="form-control input-lg" name="description" rows="5"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-4">
                                    <label  class="label  label_1">Attachment &nbsp;:</label>
                                </div>
                                <div class="col-md-7 ">
                                    <input id="attachment" value="" class="multi" name="file" type="file" />
                                </div>
                            </div>
                        </div>  <!--end of row number 5-->                       
                        <div class="row margin_form"><!-- additional details of employee group claim-->
                            <div class="col-md-12 ">
                                <div class="row margin_form " ><!-- inside the employee details -->
                                    <div id="setHere" class="col-md-12 " ></div>	
                                </div>  <!--end of inside the employee details-->
                            </div>
                        </div>  <!--end of row number 5-->
                        <div  id="emp_details" style="display:none;">	 <!--Details of employee/run via javascript   start point-->
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
                            <div class="row margin_form" id="employeeDetails" ><!-- row number 3 in group claim form-->
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
                                            <thead align="center" class="text-primary" >
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
                            <div class="col-md-1">
                                <input id="update" title="Update Document" type="submit" value="Update" onclick="form.action = 'UpdateClaim'" class="btn btn-warning active button  " style="margin-top:10px;width:100%; "  /><!--Add button -->
                              <input id="add" type="submit" value="Add" title="Add New Document" onclick="form.action = 'AddClaim'" class="btn btn-info active button  " style="margin-top:10px;width:100%; "  /><!--Add button -->
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </form>
                    <!-- End of the claim add form -->
                </div>
                <div class="col-md-12"> 
                    <hr> <h3 class="text-center">Claim Details</h3> <hr>
                </div>
                <!-- Claim details table when add the claim form details,all data are going here-->   
                <div class="col-md-1"></div>
                <div class="table-responsive margin_form col-md-10 ">
                    <table class="table table-bordered tableStyle" >
                        <thead align="center" >
                            <tr>
                                <td>&nbsp;Bill Date</td>
                                <td>&nbsp;Claim Type</td>
                                <td>&nbsp;Bill Type</td>
                                <td>&nbsp;Meal Type</td>
                                <td>&nbsp;Project</td>
                                <td>&nbsp;Amount</td>
                                <td>&nbsp;Attachment</td>
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
                                        JSONObject json = null;
                                        json = Claims.toJsonObj(cl);

                                        tableInner += "<tr>";

                                        tableInner += "<td>" + cl.getBillDate() + "</td>";
                                        tableInner += "<td>" + cl.getClaimGroup() + "</td>";
                                        tableInner += "<td>" + cl.getBillType() + "</td>";
                                        tableInner += "<td>" + cl.getMealType() + "</td>";
                                        tableInner += "<td>" + cl.getProject() + "</td>";
                                        tableInner += "<td>" + cl.getAmount() + "</td>";
                                        tableInner += "<td>" + "<a href='" + cl.getAttachment() + "' target='_blank'><i class='fa fa-file-image-o'> &nbsp;View</i></a>" + "</td>";
                                        tableInner += "<td>" + "<a style=\"cursor:pointer\" class='editlink'  data-val='" + json + "' ><i class='fa fa-pencil-square-o'></i></a>";
                                        tableInner +=  "<a style=\"cursor:pointer\" class='dellink' data-val='" + cl.getDocId() + "' data-claimid='" + c.getClaimId() + "' data-amount='" + cl.getAmount() + "'>&nbsp;&nbsp;&nbsp;<i class='fa fa-trash-o'></i></a>";
                                        tableInner += "</td>";
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
                        <button id="send" title="Submit to Reporting Manager" class="btn btn-success button pull-right " style="margin-top:10px;width:70%;"  ><!--Add button -->
                            <span class="glyphicon glyphicon-th"></span>&nbsp;Submit
                        </button>
                    </div>
                    <div class="col-md-1"></div>
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
            </div><!--# page wrapper-->
        </div><!--# wrapper-->
    </body>
</html>

