<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%@include file="header.jsp"%>
<script src="js/api.js" async defer></script>
<script type="text/javascript" src="js/register.js"></script>
<div class="container">
	<div class="page_header">
		<label>User Registration</label>
		<hr>
	</div>
	<div class="midsection bg-grey-effect">
		<s:hidden id="regionId" name="regionIdName" />
		<s:hidden id="instituteId" name="instituteIdName" />
		<s:hidden id="pageRefresh" name="pageRefresh" value="1" />

		<div class="pmf_registration_form">
			<form class="form-horizontal pmf_registration" id="pmf_registration" action="registerUser" method="POST">
				<div id="studentList">

				</div>
				<div id="findStudent">
					<div class="form-group" style="z-index: 999;">
						<label class="col-sm-6 control-label">Select State</label>
						<div class="col-sm-6">
							<select class="stateselectbox col-sm-6" data-placeholder="Select Your Options" onchange="fetchCities(this.value)">
								<option></option>
								<s:iterator value="stateList" var="state">
									<option value="<s:property value="state"/>"><s:property value="state" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="form-group" id="cityholder">
						<label class="col-sm-6 control-label">Select City</label>
						<div id="cityselect"></div>
					</div>
					<div class="form-group" id="instituteholder">
						<label class="col-sm-6 control-label">Select Institute</label>
						<div id="instituteselect" class="col-sm-6"></div>
						<span class="errorCustom col-sm-6" id="instituteRequired" style="display: none">* Institute is required </span>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Phone No</label>
						<div class="col-sm-6">
							<input type="text" maxlength="10" class="form-control bfh-phone" data-country="india" name="registration.contactNo" id="contactNo">
							<span class="errorCustom" id="PhoneRequired" style="display: none">* Phone No is required </span>
							<span class="errorCustom" id="PhoneFormat" style="display: none">* Please enter valid Phone No </span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Date of Birth</label>
						<div class="col-sm-6">
							<input type="text" class="from_date form-control " name="registration.dateOfBirth" id="dateOfBirth" placeholder="Date of Birth" contenteditable="false"> 
							<span class="errorCustom" id="DOBRequired" style="display: none">* Date of Birth is required </span>
						</div>
					</div>
					<div class="form-group" id="AddStudent">
						<div class="col-sm-12" style="text-align: center;" id="formsubmitbutton">
							<a href="#" type="" class="btn btn-primary" onclick="showMatchingStudents(this)">Add Students</a>
						</div>
						<div id="buttonreplacement"  class="col-sm-12" style="text-align: center;display:none;">
							<img src="images/loading.gif" alt="loading...">
						</div>
					</div>
					<hr>
				</div>
				<div class="form-group" id="addMoreStudents">
					<div class="col-sm-12" style="text-align: center;">
						<a href="#" type="" class="btn btn-primary" id="pmf_add_more">Add More Students</a>
					</div>
				</div>
				<div id="sign_up_registrtion">
					<div class="form-group">
						<label class="col-sm-6 control-label">Your Email</label>
						<div class="col-sm-6">
							<input type="email" id="emailAdress" class="form-control bfh-phone" name="registration.emailID" data-country="india">
							<span class="errorCustom" id="emailRequired" style="display: none">* Email is required</span>
							<span class="errorCustom" id="emailInvalid" style="display: none">* Invalid Email format</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Your Address</label>
						<div class="col-sm-6">
							<textarea class="form-control bfh-phone" data-country="india" name="registration.address"></textarea>
						</div>
					</div>
					<div class="form-group">
						<s:hidden name="hdnUserName" value="false" />
						<label class="col-sm-6 control-label">Desired Username</label>
						<div class="col-sm-6">
							<input type="text" maxlength="30" class="form-control bfh-phone" data-country="india" name="registration.username" autocomplete="off" id="user_id" class="user_name">
							<span class="check"></span>
							<span class="errorCustom" id="userNameRequired" style="display: none">* UserName is required </span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Choose Passsword</label>
						<div class="col-sm-6">
							<input type="password" id="password" maxlength="10" class="form-control bfh-phone" data-country="india" name="registration.password">
							<span class="errorCustom" id="passwordRequired" style="display: none">* Password is required </span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Confirm Passsword</label>
						<div class="col-sm-6">
							<input type="password" id="confirmPassword" maxlength="10" class="form-control bfh-phone" data-country="india"> 
							<span class="errorCustom" id="confirmPasswordRequired" style="display: none">* Password is required </span>
							<span class="errorCustom" id="passWordDoNotMatch" style="display: none">* Password do not match </span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-6 control-label">Captcha</label>
						<div class="col-sm-6 captchaContainer">
							<div class="g-recaptcha" data-sitekey="6Ldu-P8SAAAAAO--LauhB7S3JX0lgZwsDjrFp0Kw"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3"></div>
						<label for="agreement" class="col-sm-7 control-label">
							<input type="checkbox" id="agreement" class="col-sm-2">I Agree the terms and conditions
						</label>
						<br>
						<div class="col-sm-4"></div>
						<span class="errorCustom col-sm-7" id="confirmCheckBox" style="display: none">* Please Confirm before Sign Up </span>
					</div>
					<div class="form-group">
						<div class=" col-sm-12" style="text-align: center" id="formsubmitbutton2">
							<button type="submit" id="submitUser" class="btn btn-primary">Sign Up</button>
						</div>
						<div id="buttonreplacement2"  class="col-sm-12" style="text-align: center;display:none;">
							<img src="images/loading.gif" alt="loading...">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" id="noStudentsFoundModal" tabindex="-1" role="dialog"
		aria-labelledby="noStudentsFoundModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="noStudentsFoundModalLabel">Message</h4>
				</div>
				<div class="modal-body">No Matching Students Found. Please try again.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="DuplicateModel" tabindex="-1" role="dialog"
		aria-labelledby="noStudentsFoundModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="noStudentsFoundModalLabel">Message</h4>
				</div>
				<div class="modal-body">Duplicate students can not be added.
					please refine your search.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="userNameDuplicateModel" tabindex="-1"
		role="dialog" aria-labelledby="noStudentsFoundModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="noStudentsFoundModalLabel">Message</h4>
				</div>
				<div class="modal-body">This Username Is Already Taken. Please
					try with different User.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
	
	<!-- Main component for a primary marketing message or call to action -->
	<!-- /container -->
</div>


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script src="js/chosen.jquery.js"></script>
<link href="css/chosen.css" rel="stylesheet">

<script>
// Onload functions are called from in-page scripts

$(document).ready(function() {
	setBlankCities();
	setBlankinstitutes();
});

$(".stateselectbox").chosen({
	disable_search_threshold : 0,
	no_results_text : "Oops, nothing found!",
	width : "95%"
});

$("#addMoreStudents").bind("click", function() {
	$("#contactNo.form-control.bfh-phone").val("");
	$('#dateOfBirth.from_date.form-control').val("");
	$("#findStudent").css('display', 'block');
	$("#addMoreStudents").css('display', 'none');
	$("#AddStudent").css('display', 'block');
});

// ---------------------------------------------	/
//	Function to check if user name Exists or not	/
//----------------------------------------------	/
	
$(function() {
	$('#user_id').on("blur", function() {
		var checkname = $(this).val();
		var availname = remove_whitespaces(checkname);
		if (availname == '')
		{
			$('#userNameRequired').css('display', 'inline');
			//alert("User Name is required");
			return false;
		} else 
		{
			$('#userNameRequired').css('display', 'none');
		}
							if (availname != '') 
							{
								$('.check').show();
								$('.check').fadeIn(400).html('<img src="images/ajax-loading.gif" />	');
								var String = 'username=' + availname;
								$.ajax(
										{
											type : "POST",
											url : "checkUserExistence",
											data : String,
											cache : false,
											success : function(result) 
											{
												var result = remove_whitespaces(result);
												if (result == '') 
												{
													$('#hdnUserName').val("false");
													$('.check').html('<img src="images/accept.png" /> This Username Is Avaliable');
													$(".check").removeClass("red");
													$('.check').addClass("green");
													$(".user_name").removeClass("yellow");
													$(".user_name").addClass("white");
												} 
												else 
												{
													$('#hdnUserName').val("true");
													$('.check').html('<img src="images/error.png" /> This Username Is Already Taken');
													$(".check").removeClass("green");
													$('.check').addClass("red")
													$(".user_name").removeClass("white");
													$(".user_name").addClass("yellow");
												}
											}
										});
							} else {
								$('.check').html('');

							}
						});
	});
	
	
/* ======================================================= */
//Form Validations										//
/* ======================================================= */

$("#submitUser").click(function() {
	// var formData = $("#myForm").serialize(); //get all data from form
	var counter = 0;

	if (document.getElementById("studentList").children.length === 0) {
		counter++;
	}
	if (document.getElementById("agreement").checked == false) {
		$('#confirmCheckBox').css('display', 'inline');
		// alert("Please Confirm before Sign Up");
		counter++;
	} else {
		$('#confirmCheckBox').css('display', 'none');
	}
	var emailAdress = remove_whitespaces($('#emailAdress').val());

	if (emailAdress == '')
	{
		$('#emailRequired').css('display', 'inline');
		$('#emailInvalid').css('display', 'none');
		counter++;
	}
	else 
	{
		$('#emailRequired').css('display', 'none');
		if (!isValidEmailAddress(emailAdress)) {
			$('#emailInvalid').css('display', 'inline');
			//alert("Email address is not valid");
			counter++;
		} else {
			$('#emailInvalid').css('display', 'none');
		}

	}

	var userId = remove_whitespaces($('#user_id').val());
	if (userId == '') 
	{
		$('#userNameRequired').css('display', 'inline');
		//alert("User Name is required");
		counter++;
	}
	else 
	{
		$('#userNameRequired').css('display', 'none');

		var isFound = $('#hdnUserName').val();
		if (isFound == "true") 
		{
			$('#userNameDuplicateModel').modal('show');
			counter++;
		}
	}

	var password = remove_whitespaces($('#password').val());
	var confirmPassword = remove_whitespaces($('#confirmPassword').val());

	if (password == '') 
	{
		$('#passwordRequired').css('display', 'inline');
		counter++;
	} 
	else 
	{
		$('#passwordRequired').css('display', 'none');
	}

	if (confirmPassword == '')
	{
		$('#confirmPasswordRequired').css('display','inline');
		counter++;
	} else
	{
		$('#confirmPasswordRequired').css('display', 'none');
	}

	if (password != '' && confirmPassword != '' && !isPasswordEqual())
	{
		$('#passWordDoNotMatch').css('display', 'inline');
		counter++;
	}
	else
	{
		$('#passWordDoNotMatch').css('display', 'none');
	}

	if (counter > 0)
	{
		return false;
	}
	else
	{
		document.getElementById("formsubmitbutton2").style.display = "none"; // to display
		document.getElementById("buttonreplacement2").style.display = ""; // to undisplay
	}

});
</script>
</body>
</html>