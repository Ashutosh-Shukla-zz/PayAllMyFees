<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.pamf.login.PAMFLoginBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>PayallMyfees</title>
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script src="js/transition.js"></script>


<!-- <script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
	});
</script> -->

<!-- Bootstrap core CSS -->
<link href="css/datepicker.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- <link href="navbar.css" rel="stylesheet"> -->
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-right:0px">

	<header>
		<div class="container">
			<div class="header">
				<div class="pmf_header_logo">
					<img src="images/logo.jpg" width="153px" />
				</div>
				<div class="pmf_header_name pmf_txt_center">
					<div>
						pay<span style="color: #089ad5;">all</span>my<span
							style="color: #089ad5;">fees</span>.com
					</div>
					<div class="pmf_header_subtext pmf_txt_center">Easy . Secure
					</div>
				</div>
				<div class="pmf_header_social">
					<ul class="pmf_social_link">
						<li><a class="facebook" href="#"></a></li>
						<li><a class="twitter" href="#"></a></li>
						<li><a class="youtube" href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-default clear" role="navigation">
			<div class="container">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav" style="width: 120%; margin:0px">
							<li><a href="adminDashboard">Home</a></li>
							<li><a href="add-institute">Add Institute</a></li>
							<li><a href="#">System Reports</a></li>
							<li><a href="sign-out">Sign Out</a></li>
							<!-- <li class="dropdown"><a id="user-menu" aria-expanded="false"
								role="button" data-toggle="dropdown" class="dropdown-toggle"
								href="#">^</a>
								<ul role="menu" class="dropdown-menu">
									<li><a href="#">Change Password</a></li>
									<li><a href="#">Sign Out</a></li>
								</ul>
							</li> -->
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
			</div>
		</nav>
	</header>