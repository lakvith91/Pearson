<!DOCTYPE html>
<html lang="en">

<head>

     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <title>Home Page Edit Profile</title>

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
<script type="text/javascript"><!-- for add a image -->

            var xx = 0;
            function show_pic(input) {
                //alert(input.files[0]);
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    //alert(xx);
                    reader.onload = function (e) {
                        xx++;
                        $('#reg_pro_pic'+xx).attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
                // alert(input.files[0]);
            }
                    </script>  

	
</head>

<body>
	
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="height:65px;">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                </button>
               <img src="images/PEARSON_logo_1.png" alt="Company Logo" >
             </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1" style="margin-top:8px;">
            	
                <ul class="nav navbar-nav">
                     <li>
                     <a href="#"> <h3 class="navigation_heading"> <span class="glyphicon glyphicon-user"></span> &nbsp;Emp Name </h3> </a>
                    </li>     
         
                    <li>
                     <a href="home_page.html"> <h3 class="navigation_heading"> <span class="glyphicon glyphicon-home"></span> &nbsp;Home </h3> </a>
                    </li>
       
					<li>
					 <a href="index.html"> <h3 class="navigation_heading"> Sign Out  </h3> </a>
   
					 </li>
              

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
    <div class="container" style="margin-top:30px;" >

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
		  <!--                <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Comment &nbsp;&nbsp;&nbsp;

		                    	<span class="glyphicon glyphicon-comment"></span> 
		                    	<span class="badge">4+</span>  <!-- Noticication message icon -->
			<!--  				</a>
		                 </div>											 -->

		                <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Edit Profile &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-cog"></span>   <!-- Noticication message icon -->
							</a>
		                 </div>
				 </div><!-- for thumbnail-->
				 
				 <div class="thumbnail" style="margin-top:100px;">
				 
	                 <div class="btn width-btn">
	                 	<button type="button" class="btn btn-success button width-btn  "  value="Check"  onclick="return btntest_onclick()"><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>
                      </div>
	                 <div class="btn width-btn">
	                 	<button type="button" class="btn btn-danger button width-btn"  ><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-th"></span>&nbsp;Claim History</button>
                      </div>
                      
                 </div>
      
              </div><!-- for col md 3-->  

			<div class="col-md-9">  <!-- form field column-->

               
     <!--
                      <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1"><!--statrt of div form layer-->
            <div class="thumbnail thambaline_inner" > <!--Inside thumbanil-->
	                  <form  class="form-control-static marginedit" name="myClaimForm" method="post" ><!--Start point of form-->
	
		                 <div class="row marginedit mar-top"><!-- row number 1-->
		                 	<div class="col-md-1"></div>
			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">First Name &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="text" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			            </div>  <!--end of row number 1-->
		                 
		                 <div class="row marginedit mar-top"><!-- row number 2-->
		                 	<div class="col-md-1"></div>
		                 
			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Last Name &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="text" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 2-->
			 			
		                 <div class="row marginedit mar-top"><!-- row number 3-->
		                 	<div class="col-md-1"></div>

			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Email &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="text" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 3-->
		                
						 <div class="row marginedit mar-top"><!-- row number 4-->
			                <div class="col-md-1"></div>
							<div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Mobile Number &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="text" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 4-->

						 <div class="row marginedit mar-top"><!-- row number 5-->
		                 	<div class="col-md-1"></div>

			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Birth Date &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="text" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 5-->
               
 <!--						 <div class="row marginedit"><!-- row number 6-->
	 <!--		                 <div class="col-md-3">
				                 <label id="first_name" class="label labelstyle">Profile Picture &nbsp;:</label>
					          </div>
					          <div class="col-md-8">
									 <div class="input-group">
				                  	 	<input name="Bulk_ID" class="form-control input-lg" type="file" onchange="show_pic(this)">
				                  	  <!-- <img style="width: 200px; height: auto;margin-left:20px" id="reg_pro_pic1">-->
		 <!--     					  </div>
			 			</div>  <!--end of row number 6-->
	                 
						 <div class="row marginedit mar-top"><!-- row number 6-->
						 	<div class="col-md-1"></div>

			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Password &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="password" >
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 6-->
	                 
						 <div class="row marginedit mar-top"><!-- row number 7-->
						 	<div class="col-md-1"></div>

			                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Work Since &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
	   							 <div class="input-group">
					                  	 <input name="Bulk_ID" class="form-control input-lg" type="date">
			      						 <span class="input-group-btn">
			       						 <button class="btn btn-group btn-default active input-lg" type="button">Edit
			       						 <span class="glyphicon glyphicon-pencil"></span>
			       						 </button>
			       						 </span>
			       					</div>	
			     				</div>
			 			</div>  <!--end of row number 7-->
	                 
						 <div class="row marginedit mar-top"><!-- row number 8-->
						 		    <div class="col-md-1"></div>

                   					<div class="col-md-2 ">
				                 				<label id="first_name" class="label labelstyle">Reporting AGM &nbsp;:</label>
	                    		 		</div>
	                    		 		<div class="col-md-6">
	                    		 			<div class="input-group" style="width:100%;">
				                                 <select class="dropdown_signup form-control">
				  											<option value="-1">Reporting AGM</option>
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
			 			</div>  <!--end of row number 8-->
						 <div class="row marginedit mar-top"><!-- row number 9-->
						 		    <div class="col-md-1"></div>

                  					<div class="col-md-2 ">
				                 				<label id="first_name" class="label labelstyle">Reporting PM &nbsp;:</label>
	                    		 		</div>
	                    		 		<div class="col-md-6">
	                    		 			<div class="input-group" style="width:100%;">
				                                 <select class="dropdown_signup form-control" >
				  											<option value="-1">Reporting PM </option>
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
			 			</div>  <!--end of row number 9-->
	                 	

 						<div class="row marginedit mar-top"><!-- row number 10-->
 							<div class="col-md-1"></div>

	 		                 <div class="col-md-2">
				                 <label id="first_name" class="label labelstyle">Profile Picture &nbsp;:</label>
					          </div>
					          <div class="col-md-6">
									 <div class="input-group" style="width:100%;">
				                  	 	<input name="Bulk_ID"  type="file" onchange="show_pic(this)">
				                  	   <img style="width: 150px; height: auto;" id="reg_pro_pic1">
	   					  </div>
			 			</div>  <!--end of row number 10-->





	                 	<div class="col-md-6"></div>
		                 	<div class="col-md-6 mar-top">
		                 		<div class="row" ><!-- row number 10 inside row-->
									<div class="col-md-6">
										<button type="submit" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
										<span class="glyphicon glyphicon-ok"></span>&nbsp;Save Changes</button>
									</div>
		                 			<div class="col-md-6 ">
										<button type="reset" class="btn btn-primary button  " style="width:100%;" ><!-- login button of login popup window -->
										<span class="glyphicon glyphicon-remove"></span>&nbsp;Clear</button>
									</div>


		                 			
		               		 </div> <!--end of row number 10 inside row-->
		                 	</div>
	                 	</div> <!--end of row number 10-->

	                 </form><!--end point of form-->
	                 </div>
				</div><!--end of div form layer-->

 			
		    </div><!-- for col md 9-->  
   
         
 </div>   <!-- for container-->                  
               					                
                 
                 
                 
                 
                 
        <!--         <div ><!--Start div point of form-->
                 
          <!--          <form  class="form-control-static marginedit" name="myClaimForm1" method="post" ><!--Start point of form-->

                 	
               <!--     	<table style="width: 100%;margin-left:100px;"><!--Start point of table-->

				 <!--  		<tr>
							<td>&nbsp;
			                	<div style="width:50%;"><!-- row number 1 col 1-->
			      <!--             		<span><label id="bulk_id" class="label labelstyle">Bulk ID:</label></span>
			                		<span><input name="Bulk_ID" class="form-control input-lg" type="text" placeholder="Bulk ID"></span>

								</div>
							</td>
							<td>&nbsp;
								<div style="width:50%;" >	<!-- row number 2 col 2-->
				 <!--  					<label id="project" class="label labelstyle">Project:</label>
									<input name="project" class="form-control input-lg" type="text" placeholder="Project" >
								</div>
							</td>
						</tr>
						<tr>
						<tr>
						<td>
						
						
						</td>
						
						</tr>

						<tr>
							<td>&nbsp;
			                	<div style="width:50%;"><!-- row number 2 col 1-->
			     <!--              		<label id="claim_no" class="label labelstyle">Claim No:</label>
			                		<input name="claim_no" class="form-control input-lg" type="text" placeholder="Claim No" >
								</div>
							</td>
							<td>&nbsp;
								<div style="width:50%;" >	<!-- row number 2 col 2-->
					 <!--  				<label id="type_of_bill" class="label labelstyle">Type of Bill:</label>
									<select name="Select1" class="form-control input-lg" placeholder="Claim Type" style="height:37px;">
										<option> Food Bills</option>
										<option> Internet Bills</option>
		
									</select>
								</div>
							</td>
						</tr>
						<tr>

						<tr>
							<td>&nbsp;
			                	<div style="width:50%;"><!-- row number 3 col 1-->
			    <!--               		<label id="bulk_id" class="label labelstyle">Bill Date:</label>
			                		<input name="Bill_date" class="form-control input-lg" type="text" placeholder="Bill Date">
								</div>
							</td>
							<td>&nbsp;
								<div style="width:50%;" >	<!-- row number 3 col 2-->
				 <!--  					<label id="project" class="label labelstyle">Amount:</label>
									<input name="amount" class="form-control input-lg" type="text" placeholder="Amount" >
								</div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;
			                	<div style="width:50%;"><!-- row number 4 col 1-->
			   <!--                		<label id="bulk_id" class="label labelstyle">Event Date:</label>
			                		<input name="event_date" class="form-control input-lg" type="text" placeholder="Event Date">
								</div>
							</td>
							<td>&nbsp;
							<div style="width:50%;">	<!-- row number 4 col 2-->
							
					 <!--  				<label id="bulk_id" class="label labelstyle">Attachment:</label>

									<input name="attachment" class="form-control input-lg" type="text" placeholder="Attachment" >
								
								
							</div>
							</td>
						</tr>
						<tr >
						<td>&nbsp;</td>
						<td>&nbsp;
							<div style="width:50%;"><!-- row number 5 col 2-->
 <!--  
									<button type="button" class="btn btn-success active button pull-right " style="width:50%;margin-top:10px;" ><!-- Browse button -->
				 <!--  					<span class="glyphicon glyphicon-th"></span>&nbsp;Browse</button>						
							
							</div>
						</td>
						</tr>
						<tr >
						<td>&nbsp;
							<div style="width:100%;">
								<label id="descrption" class="label labelstyle">Description:</label>
								<textarea class="form-control input-lg" name="TextArea1" cols="20" rows="5" placeholder="Description"></textarea>				
							
							</div>
						</td>
						<td>&nbsp;
							<div style="width:50%;">
								<button type="button" class="btn  btn-primary active button pull-right " style="width:50%;margin-top:10px;"  ><!--Add button -->
			 <!--  						<span class="glyphicon glyphicon-th"></span>&nbsp;Add
								</button>
							</div>
						</td>

						</tr>
						
						
						
					 </table>
                 
                 </form>
      <!--              </div><!--End div point of form-->
	 <!--  		</div><!--Inside thumbanil-->
		 <!--  		<div class="table-responsive marginedit">
					
					
					
						<table class="table table-bordered tableStyle" >
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
							</tbody>
						</table>
					
		-->		
			
					   
   <script src="js/jquery.js" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>

