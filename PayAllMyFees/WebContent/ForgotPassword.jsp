<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="header.jsp"%>
<div class="container bodydiv">
	<div class="forgot_password">
		<h2 class="bg_h2">Forgot Password</h2>
		<form class="loginform form-horizontal" data-toggle="validator" action="forgotPassword" method="POST">
		
			<div class="form-group">
				<label class="col-sm-4 control-label" for="username">Username</label>
				<div class="col-sm-4">
					<input class="form-control" type="text" name="loginCredentials.username" placeholder="Username">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<input class="btn btn-primary" type="submit"  value="Submit">
				</div>
			</div>
		</form>
		
	</div>
	<%@include file="footer.jsp"%>
</div>

</body>
</html>