<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PayAllMyFees</title>
	<link rel="stylesheet" href="css/pure-min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:200">
	<link rel="stylesheet" href="css/main-grid.css">
	<link rel="stylesheet" href="css/baby-blue.css">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div id="main">
		<div class="header">
			<h1>Welcome to PayAllMyFees !</h1>
		</div>
		<div class="pure-g">
			<div class="pure-u-1-4"></div>
			<div class="pure-u-1-4">
				<div class="header">
					<h2>Institution Login</h2>
				</div>
				<s:form action="loginInstitute" name="institute-login" method="POST" cssClass="pure-form pure-form-aligned">
					<fieldset class="pure-group">
						<s:textfield name="loginCredentials.username" label="Username" id="institute.username"></s:textfield>
					</fieldset>
					<fieldset class="pure-group">
						<s:password name="loginCredentials.password" label="Password" id="institute.password"></s:password>
					</fieldset>
					<fieldset class="pure-group">
						<s:textfield name="loginCredentials.userType" type="hidden" value="1"></s:textfield>
					</fieldset>
					<s:submit value="Sign in" cssClass="pure-button pure-button-primary"></s:submit>
				</s:form>
			</div>
			<div class="pure-u-1-4">
				<div class="header">
					<h2>User Login</h2>
				</div>
				<s:form action="loginUser" name="user-login" method="POST" cssClass="pure-form pure-form-aligned" onsubmit="return validate(this.form)">
					<fieldset class="pure-group">
						<s:textfield name="loginCredentials.username" label="Username" id="user.username"></s:textfield>
					</fieldset>
					<fieldset class="pure-group">
						<s:password name="loginCredentials.password" label="Password" id="user.password"></s:password>
					</fieldset>
					<fieldset class="pure-group">
						<s:textfield name="loginCredentials.userType" type="hidden" value="2"></s:textfield>
					</fieldset>
					<s:submit value="Sign in" cssClass="pure-button pure-button-primary"></s:submit>
				</s:form>
			</div>
			<div class="pure-u-1-4"></div>
			<div class="header">
				<h1>Site is currently under construction !!!</h1>
			</div>
		</div>
	</div>
</body>
</html>