<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Administrator Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/admin-login.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand"><!-- Admin Login --></h3>
            </div>
          </div>

          <div class="inner cover">
	      <form class="form-signin" action="loginAdmin" method="POST">
		        <h2 class="form-signin-heading"><!-- Admin Login --></h2>
		        
		        <label for="inputEmail" class="sr-only">Username</label>
		        <input type="text" id="inputEmail" name="loginCredentials.username" class="form-control" placeholder="Username" required="required" autofocus>
		        <br>
		        <label for="inputPassword" class="sr-only">Password</label>
		        <input type="password" name="loginCredentials.password" id="inputPassword" class="form-control" placeholder="Password" required="required">
				<s:set value="%{#parameters.loginFailed}" var="loginFailed"/>
				<s:if test='%{#loginFailed[0]=="0"}'>
					<div class="form-group">
						<div class="col-sm-12">
							<div class="alert alert-danger" role="alert" style="text-shadow: none;">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Please enter valid Username and Password.
							</div>
						</div>
					</div>
				</s:if>
		        <input type="hidden" name="loginCredentials.userType" value="0">
		        
		        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	      </form>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p><a href="http://payallmyfees.com">Payallmyfees.com</a> Administrator</p>
            </div>
          </div>

        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>