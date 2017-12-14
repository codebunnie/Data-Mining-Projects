<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>WAMP Storedemo</title>

    <!-- Bootstrap -->
    <link href="js/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/vendors/bootstrap/css/font-awesome.css" rel="stylesheet">
    <link href="style/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="hidden-print fa5 collapse in" id="banner" aria-expanded="true">
  		<div class="container">
  			<div class="message-container">
  				<div class="tagline">
  					<span id="rotating-message"><strong>WAMP Storedemo</strong></span>
  				</div>
  			</div>
  		</div>
  	</div>
  	<hr>

  <div class="container"> 	

  		<div class="row">
	  		<div class="col-md-2">
	  			<ul class="nav nav-pills nav-stacked">
	  				<li class="active"><a data-toggle="pill" href="#" id="rules_id">
	  				<i class="fa fa-bars fa-fw" aria-hidden="true"></i>&nbsp;Rules
	  				</a></li>
	  				<li><a data-toggle="pill" href="#" id="users_id">
	  				<i class="fa fa-user fa-fw" aria-hidden="true"></i>&nbsp;Users
	  				</a></li>
	  				<li><a data-toggle="pill" href="#" id="items_id">
	  				<i class="fa fa-bar-chart fa-fw" aria-hidden="true"></i>&nbsp;Items
	  				</a></li>
	  				<li><a data-toggle="pill" href="#" id="deps_id">
	  				<i class="fa fa-sitemap fa-fw" aria-hidden="true"></i>&nbsp;Departments
	  				</a></li>
	  				<li><a data-toggle="pill" href="#" id="orders_id">
	  				<i class="fa fa-cart-plus fa-fw" aria-hidden="true"></i>&nbsp;Orders
	  				</a></li>
	  				<li><a data-toggle="pill" href="#" id="orders_rep_id">
	  				<i class="fa fa-shopping-cart fa-fw" aria-hidden="true"></i>&nbsp;Order Report
	  				</a></li>	  				
	  				<li><a data-toggle="pill" href="#" id="trans_id">
	  				<i class="fa fa-calculator fa-fw" aria-hidden="true"></i>&nbsp;Transactions
	  				</a></li>
	  			</ul>
	  		</div>
	  		<div class="col-md-10">
	  			<div class="data-view">
	  				
	  			</div>
	  			<div class="tab-content">
	  				  				
	  			</div>
	  		</div>
	  	</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/vendors/jquery/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/vendors/bootstrap/js/bootstrap.min.js"></script>    
    <script src="js/vendors/tablesorter/jquery.tablesorter.min.js"></script>
    <script src="js/vendors/tablesorter/parser-input-select.js"></script>
    <script src="js/index.js"></script>
  </body>
</html>