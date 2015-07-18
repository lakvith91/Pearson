<%-- 
    Document   : home_page
    Created on : Nov 11, 2014, 8:15:28 PM
    Author     : Lakshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                     <a href="home_page.jsp"> <h3 style="color:#FFFFFF;font-size:18px;margin-top:25px;"> <span class="glyphicon glyphicon-home"></span> &nbsp;Home </h3> </a>
                    </li>
       
					<li>
					 <a href="index.jsp"> <h3 style="color:#FFFFFF;font-size:18px;margin-top:27px;"> Sign Out  </h3> </a>
   
					 </li>
                  <!--  <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>-->

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
    <div class="container" style="margin-top:60px;">

        <div class="row">

            <div class="col-md-3" > <!--news feed column -->
				<div class="thumbnail"> <!--for boader -->

					<p class="lead marginedit">News Feed</p>
		                <div class="list-group marginedit">
		                    <a href="home_page_manger_view.jsp" class="list-group-item active">
		                    	Notification &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-envelope"></span>   <!-- Noticication message icon -->
								<span class="badge">2+</span>
							</a>
		                 </div>
		                 <div class="list-group marginedit">
		                    <a href="#" class="list-group-item active">
		                    	Comment &nbsp;&nbsp;&nbsp;

		                    	<span class="glyphicon glyphicon-comment"></span>   <!-- Noticication message icon -->
								<span class="badge">4+</span>

							</a>
		                 </div>
		                <div class="list-group marginedit">
		                    <a href="home_page_edit_profile.jsp" class="list-group-item active">
		                    	Edit Profile &nbsp;&nbsp;
		                    	<span class="glyphicon glyphicon-cog"></span>   <!-- Noticication message icon -->
							</a>
		                 </div>
				 </div><!-- for thumbnail-->
				 
	                 <div class="btn" style="width:100%;margin-top:50px;">
	                 	<button type="button" class="btn btn-success button  " style="width:100%;"  value="Check"  onclick="return btntest_onclick()"><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>
                      </div>
                                       
	                 <div class="btn" style="width:100%;">
	                 	<button type="button" class="btn btn-danger button  " style="width:100%;" ><!-- login button of login popup window -->
						<span class="glyphicon glyphicon-th"></span>&nbsp;Claim History</button>
                      </div>
                      
                      
              </div><!-- for col md 3-->  

			<div class="col-md-9">  <!-- image field column-->

                <div class="thumbnail">
                    <img class="img-responsive " src="images/service-charge_1921783b.jpg" alt=" home page image">
                   <!-- <div class="caption-full">--> 
                 </div><!-- for thumbnail-->
                 
             </div><!-- for col md 9-->  
          </div> <!-- for row-->          
      </div>   <!-- for container-->      
         
 <!--                       <h4 class="pull-right">$24.99</h4>
                        <h4><a href="#">Product Name</a>
                        </h4>
                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                        <p>Want to make these reviews work? Check out
                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
                            </strong>over at maxoffsky.com!</p>
                          </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>
<!--
                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This product was great in terms of quality. I would definitely buy another!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've alredy ordered another one!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.container -->

  
    

   <!-- <div class="container">

        <hr>

        <!-- Footer -->
       <!--   <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p class="pull-right">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    
  
    
    <script src="js/jquery.js" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>
