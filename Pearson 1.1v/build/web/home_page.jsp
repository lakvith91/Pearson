<!DOCTYPE html>
<html lang="en">

<head>

     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <title>Home Page</title>

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
    window.location.href = "home_page_claim_add.jsp";
}

</script>
</head>

<body>
	

	
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="height:65px;">
        
        <div class="container">
           
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
                     <a href="#"> <h3 class="navigation_heading" > <span class="glyphicon glyphicon-user"></span> &nbsp;Emp Name </h3> </a>
                    </li>     
         
                    <li>
                     <a href="home_page.jsp"> <h3 class="navigation_heading " > <span class="glyphicon glyphicon-home"></span> &nbsp;Home </h3> </a>
                    </li>
       
					<li>
					 <a href="index.jsp"> <h3  class="navigation_heading"> Signout  </h3> </a>
   
					 </li>

                </ul>
            </div>
            <!--navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
    <div class="container" style="margin-top:30px;">

        <div class="row">

            <div class="col-md-3" > <!--news feed column -->
				<div class="thumbnail" > <!--for boader -->

					<p class="lead marginedit">News Feed</p>
					
					<div class="dropdown">
  							<button  class="btn btn-primary button marginedit  "  id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
    							Notification&nbsp;&nbsp;&nbsp;&nbsp;
    		                    <span class="glyphicon glyphicon-envelope" ></span>   <!-- Noticication message icon -->
								<span class="badge" style="margin-left:65px;">2+</span>
							    <span class="caret"></span>
  							</button>
  							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    							<li> Notification 1</li>
    							<li> Notification 2</li>
    							<li> Notification 3</li>
    							<li> Notification 4</li>



 							 </ul>
			</div>
					
					
					
	 <!--					
		                <div class="list-group marginedit">
		                    <a href="home_page_manger_view.html" class="list-group-item active">
		                    	Notification &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-envelope"></span>   <!-- Noticication message icon -->
		 <!--							<span class="badge">2+</span>
							</a>
		                 </div>
 <!--		                 <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Comment &nbsp;&nbsp;&nbsp;

		                    	<span class="glyphicon glyphicon-comment"></span>   <!-- Noticication message icon -->
 <!--									<span class="badge">4+</span>

							</a>
		                 </div>																		 -->

		                <div class="list-group marginedit">
		                    <a href="home_page_edit_profile.jsp" class="list-group-item active">
		                    	Edit Profile &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-cog"></span>   <!-- Noticication message icon -->
							</a>
		                 </div>
				 </div><!-- for thumbnail-->
				 <div class="thumbnail" style="margin-top:100px;">
	                 <div class="btn width-btn">
	                 	<button type="button" class="btn btn-success button width-btn  "   value="Check"  onclick="return btntest_onclick()"><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>
                      </div>
                                       
	                 <div class="btn width-btn" >
	                 	<button type="button" class="btn btn-danger button width-btn  " ><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-th"></span>&nbsp;Claim History</button>
                      </div>
                  </div>    
                      
              </div><!-- for col md 3-->  

			<div class="col-md-9">  <!-- image field column-->

               <!-- <div class="thumbnail">
                    <img class="img-responsive " src="images/service-charge_1921783b.jpg" alt=" home page image">
                   <!-- <div class="caption-full">--> 
               <!--  </div><!-- for thumbnail-->
                 
                 
                 
                 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
							  <!-- Indicators -->
							  <ol class="carousel-indicators">
							    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
							  </ol>
							
							  <!-- Wrapper for slides -->
							  <div class="carousel-inner">
							    <div class="item active">
							      <img src="images/1680x1050_Widescreen_Wallpaper_Strange_World_I.jpg" alt="...">
							      <div class="carousel-caption">
							      	<h3 style="font-size:30px;">Pearson Claim Management System</h3>
							      </div>
							    </div>
							    <div class="item">
							      <img src="images/05.jpg" alt="...">
							      <div class="carousel-caption">
							      	<h3 style="font-size:30px;">Pearson Claim Management System</h3>
							      </div>
							    </div>
							    <div class="item">
							      <img src="images/comic-bridge_wallpapers_7073_1680x1050.jpg" alt="...">
							      <div class="carousel-caption">
							      	<h3 style="font-size:30px;">Pearson Claim Management System</h3>
							      </div>
							    </div>
							  </div>
							
							  <!-- Controls -->
							  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							    <span class="glyphicon glyphicon-chevron-left"></span>
							  </a>
							  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							    <span class="glyphicon glyphicon-chevron-right"></span>
							  </a>
							</div> <!-- Carousel -->
                 
                 
             </div><!-- for col md 9-->  
          </div> <!-- for row-->          
      </div>   <!-- for container-->      
         
     
  
    
    <script src="js/jquery.js" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>