<!DOCTYPE html>
<html lang="en">

<head>

     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <title>Home Page manager View</title>

    <!-- Bootstrap Core CSS -->
             <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
             <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
   <link href="css/homepage.css" rel="stylesheet" type="text/css">
 
 
 
 <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->

<script language="javascript" type="text/javascript">

function btntest_onclick() 
{
    window.location.href = "home_page_claim_add.html";
}

</script>

	
</head>

<body>
	
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="height:85px;">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                </button>
               <img src="images/PEARSON_logo_2.png" alt="Company Logo" >
             </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1" style="margin-top:10px;">
            	
                <ul class="nav navbar-nav">
                     <li>
                     <a href="#"> <h3 style="color:#FFFFFF;font-size:18px;margin-left:5px;margin-top:25px;"> <span class="glyphicon glyphicon-user"></span> &nbsp;Emp Name </h3> </a>
                    </li>     
         
                    <li>
                     <a href="home_page.html"> <h3 style="color:#FFFFFF;font-size:18px;margin-top:25px;"> <span class="glyphicon glyphicon-home"></span> &nbsp;Home </h3> </a>
                    </li>
       
					<li>
					 <a href="index.html"> <h3 style="color:#FFFFFF;font-size:18px;margin-top:27px;"> Sign Out  </h3> </a>
   
					 </li>
              

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
    <div class="container" style="margin-top:60px;" >

        <div class="row">

            <div class="col-md-3" > <!--news feed column -->
				<div class="thumbnail"> <!--for boader -->

					<p class="lead marginedit">News Feed</p>
		                <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Notification &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-envelope"></span>
		                    	<span class="badge">2+</span>   <!-- Noticication message icon -->
							</a>
		                 </div>
		                 <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Comment &nbsp;&nbsp;&nbsp;

		                    	<span class="glyphicon glyphicon-comment"></span> 
		                    	<span class="badge">4+</span>  <!-- Noticication message icon -->
							</a>
		                 </div>
		                <div class="list-group marginedit">
		                    <a href="home_page_edit_profile.html" class="list-group-item active">
		                    	Edit Profile &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-cog"></span>   <!-- Noticication message icon -->
							</a>
		                 </div>
				 </div><!-- for thumbnail-->
				 
	                 <div class="btn" style="width:100%;margin-top:50px;">
	                 	<button type="button" class="btn btn-success button  " style="width:100%;"  value="Check"  onclick="return btntest_onclick()" ><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>
                      </div>
	                 <div class="btn" style="width:100%;">
	                 	<button type="button" class="btn btn-danger button  " style="width:100%;" ><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-th"></span>&nbsp;Claim History</button>
                      </div>
                      
                      
              </div><!-- for col md 3-->  

			<div class="col-md-9">  <!-- form field column-->

                <div class="thumbnail " >
                 <div class="thumbnail marginedit thambaline_inner" style="background-image:url('images/background.png');background-repeat:no-repeat;"> <!--Inside thumbanil-->
                 
                 <div ><!--Start div point of form-->
                 
                 <form  class="form-control-static marginedit" name="myClaimForm" method="get" ><!--Start point of form-->

                 	
                 	<table style="width: 100%;margin-left:75px;"><!--Start point of table 1-->

						<tr>
							<td>&nbsp;
			                	<div style="width:50%;"><!-- row number 1 col 1-->
			                		<label id="emp_id" class="label labelstyle">Employee ID:</label>
			                		<input name="emp_ID" class="form-control input-lg" type="text" placeholder="Employee ID">
								</div>
							</td>
							<td>&nbsp;
								<div style="width:50%;" >	<!-- row number 2 col 2-->
									<label id="emp_name" class="label labelstyle">Employee Name:</label>
									<input name="emp_name" class="form-control input-lg" type="text" placeholder="Employee Name" >
								</div>
							</td>
							<td>&nbsp;
								<div style="width:50%;" >	<!-- row number 2 col 2-->
									<label id="bulk_id" class="label labelstyle">Bulk ID:</label>
									<input name="bulk_id" class="form-control input-lg" type="text" placeholder="Bulk ID" >
								</div>
							</td>

						</tr>
																		
						
					 </table><!--end point of table 1-->
				<div class="table-responsive marginedit layerfeature"><!--Start point of table 1 div-->

					
					
					
						<table class="table table-bordered tableStyle layerfeature" ><!--Start point of table 1-->
						<thead align="center" >
							<tr>
								<td>&nbsp;Claim ID</td>
								<td>&nbsp;Calim Type</td>
								<td>&nbsp;Bill Date</td>
								<td>&nbsp;Event Date</td>
								<td>&nbsp;Project</td>
								<td>&nbsp;Amount</td>
								<td>&nbsp;Attachment</td>
								<td>&nbsp;Status</td>
							</tr>
						</thead>
						<tbody>
						<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>




							</tbody>
						</table><!--end point of table 1-->

					
				</div>	<!--end point of table 1 div-->
				
				<div class="container-fluid"><!-- div for Submit button--> 
					 <div class="row">
					 	<div class="col-md-8"></div>
						<div class="col-md-2" >
							<button type="submit" class="btn  btn-primary active button marginedit" style="width:100%;"  ><!--Add button -->
											<span class="glyphicon glyphicon-th"></span>&nbsp;Approve
							</button>
					 	</div>
					 	<div class="col-md-2" >
							<button type="submit" class="btn btn-danger active button marginedit" style="width:100%;"  ><!--Add button -->
							<span class="glyphicon glyphicon-th"></span>&nbsp;Reject
							</button>
					 	</div>

					</div><!-- for row--> 
				</div><!-- for end of Submit button--> 

                 
                 </form>
                 </div><!--End div point of form-->
			</div><!--Inside thumbanil-->
				
		</div><!-- end of out side thumbnail-->
     </div><!-- for col md 9-->  
   </div> <!-- for row-->          
</div>   <!-- for container-->                  
               					
			
					   
   <script src="js/jquery.js" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>

