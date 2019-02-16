<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<s:set var="userType" value="%{#session.loginInfo.userType}" />
<s:if test="%{#userType == 1}">
	<%@include file="institute-header.jsp"%>
</s:if>
<s:elseif test="%{#userType == 2}">
	<%@include file="user-header.jsp"%>
</s:elseif>
<s:else>
	<%@include file="header.jsp"%>
</s:else>

<div class="container">
	<div class="midsection">
		<s:set value="%{#parameters.status}" var="status"/>
		<s:if test='%{#status[0]=="error"}'>
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
				<span class="sr-only">Error:</span>
				An error occurred while updating password. Please contact the customer support for further help.
			</div>
		</s:if>
		<s:elseif test='%{#status[0]=="failure"}'>
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 
				<span class="sr-only">Error:</span>
				Incorrect Current Password. Please try again.
			</div>
		</s:elseif>
		<s:elseif test='%{#status[0]=="success"}'>
			<div class="alert alert-success" role="alert">
				Password changed successfully.
			</div>
		</s:elseif>
		<div class="pmf_registration_form">
		<form action="changePassword" method="POST" class="form-horizontal pmf_registration">
			<div class="form-group">
				<s:hidden name="loginCredentials.username" value="%{#parameters.username}" ></s:hidden>
			</div>
			<div class="form-group">
				<label class="col-sm-6 control-label" for="currentPassword">Current Password</label>
				<div class="col-sm-6">
					<input class="col-sm-6 form-control" type="password" name="loginCredentials.password" placeholder="Current Password" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-6 control-label" for="newPassword">New Password</label>
				<div class="col-sm-6">
					<input class="form-control" type="password" id="newPassword" name="newPassword" placeholder="New Password" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-6 control-label" for="confirmPassword">Confirm New Password</label>
				<div class="col-sm-6">
					<input class="col-sm-6 form-control" type="password" onblur="return checkPass();" id="confirmNewPassword" name="confirmPassword" placeholder="Confirm New Password" required="required">
					<span id="confirmMessage" class="confirmMessage"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<input class="btn btn-primary" type="submit" onclick="return checkPass();" value="Update Password">
				</div>
			</div>
		</form>
		</div>
		<script>
		function checkPass()
		{
		    //Store the password field objects into variables ...
		    var pass1 = document.getElementById('newPassword');
		    var pass2 = document.getElementById('confirmNewPassword');
		    //Store the Confimation Message Object ...
		    var message = document.getElementById('confirmMessage');
		    //Set the colors we will be using ...
		    var goodColor = "#66cc66";
		    var badColor = "#ff6666";
		    //Compare the values in the password field 
		    //and the confirmation field
		    if(pass1.value == pass2.value){
		        //The passwords match. 
		        //Set the color to the good color and inform
		        //the user that they have entered the correct password 
		        pass2.style.backgroundColor = goodColor;
		        message.style.color = goodColor;
		        message.innerHTML = "Passwords Match!"
				return true;
		    }else{
		        //The passwords do not match.
		        //Set the color to the bad color and
		        //notify the user.
		        pass2.style.backgroundColor = badColor;
		        message.style.color = badColor;
		        message.innerHTML = "Passwords Do Not Match!"
				return false;
		    }
		}  
		</script>
		<%@include file="footer.jsp"%>
	</div>
</div>
</body>
</html>