<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="header.jsp"%>
<script src="js/api.js" async defer></script>
<script type="text/javascript" src="js/countries.js"></script>
<script>
	/* 	$(document).ready(
	

	
	 $(function() {
	 $(document).on(
	 "click",
	 '#pmf_reg_find_std_suggtn1',
	 function() {
	 $("#pamf_reg_added_std1").css('display', 'block');
	 $('#pmf_reg_find_std_suggtn1').attr('id',
	 'pmf_reg_find_std_suggtn2');
	 });
	 $(document).on("click", '#pmf_reg_find_std_suggtn2', function() {
	 $('#noStudentsFoundModal').modal('show')
	 });

	 });
	 */
	$.getScript("js/bootstrap-datepicker.js", function() {
		var startDate = new Date('01/01/1900');
		var FromEndDate = new Date();
		var ToEndDate = new Date();

		ToEndDate.setDate(ToEndDate.getDate() + 365);

		$('.from_date').datepicker({
			weekStart : 1,
			startDate : '01/01/1900',
			endDate : FromEndDate,
			autoclose : true
		}).on(
				'changeDate',
				function(selected) {
					startDate = new Date(selected.date.valueOf());
					startDate.setDate(startDate.getDate(new Date(selected.date
							.valueOf())));
					$('.to_date').datepicker('setStartDate', startDate);
				});
		$('.to_date').datepicker({

			weekStart : 1,
			startDate : startDate,
			endDate : ToEndDate,
			autoclose : true
		}).on(
				'changeDate',
				function(selected) {
					FromEndDate = new Date(selected.date.valueOf());
					FromEndDate.setDate(FromEndDate.getDate(new Date(
							selected.date.valueOf())));
					$('.from_date').datepicker('setEndDate', FromEndDate);
				});
	});
	///registration show hide scipt
</script>


<style>
.pmf_registration_form {
	width: 60%;
	margin: 0 auto;
}

#pamf_reg_added_std, #pamf_reg_added_std1, #add_more_std {
	display: none;
}

.errorCustom {
	color: #FF0000;
}
</style>
<div class="container">
	<div class="page_header">
		<label>User Registration</label>
		<hr>
	</div>
	<div class="midsection bg-grey-effect">
		<s:hidden id="regionId" name="regionIdName" />
		<s:hidden id="instituteId" name="instituteIdName" />
		<div id="studentList"></div>

		<div class="pmf_registration_form">
			<form class="form-horizontal pmf_registration" id="pmf_registration" action="registerUser" method="POST">
				<div id="find_student">
					<div class="form-group" style="z-index: 999;">
						<label class="col-sm-6 control-label">Select State</label>
						<div class="col-sm-6">
							<select class="my_select_box1 col-sm-6" data-placeholder="Select Your Options" onchange="fetchCities(this.value)">
								<option></option>
								<s:iterator value="stateList" var="state">
									<option value="<s:property value="state"/>"><s:property
											value="state" /></option>
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
				<div class="form-group" id="add_more_std">
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
							<input type="text" id="password" maxlength="10" class="form-control bfh-phone" data-country="india" name="registration.password">
							<span class="errorCustom" id="passwordRequired" style="display: none">* Password is required </span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Confirm Passsword</label>
						<div class="col-sm-6">
							<input type="text" id="confirmPassword" maxlength="10" class="form-control bfh-phone" data-country="india"> 
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
	<div class="clear"></div>
	<div class="footer pmf_txt_center">
		<ul class="footer_info_nav">
			<li>Home</li>
			<li>Partner With Us</li>
			<li>Careers</li>
			<li>About Us</li>

		</ul>
		<div class="pmf_footer_copyright pmf_txt_center">Copyright Â©
			2014 Samay Macro Solutions Pvt Ltd</div>
	</div>
	
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
	$(document).ready(function() {
		setBlankCities();
		setBlankinstitutes();
	});

	$(".my_select_box1").chosen({
		disable_search_threshold : 0,
		no_results_text : "Oops, nothing found!",
		width : "95%"
	});

	function fetchCities(id) {

		setInstituteId("");
		
		var url = "fetchCities?selectedState=" + id;
		ajaxRequest = new XMLHttpRequest()

		ajaxRequest.open("POST", url, true);
		ajaxRequest.send();
		ajaxRequest.onreadystatechange = setActionCounter;
	}
	function showHide() {
		$("#find_student, #AddStudent").css('display', 'none');
		$("#add_more_std").css('display', 'block');
	}
	$("#add_more_std").bind("click", function() {
		$("#contactNo.form-control.bfh-phone").val("");
		$('#dateOfBirth.from_date.form-control').val("");
		$("#find_student").css('display', 'block');
		$("#add_more_std").css('display', 'none');
		$('#pmf_reg_find_std_suggtn').attr('id', 'pmf_reg_find_std_suggtn1');
		$("#AddStudent").css('display', 'block');
	});
	
	function isValidPhonenumber(inputtxt)  
	{
		var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  
		if(phoneno.test(inputtxt))  
		{
			return true;  
		}
		else  
		{
			return false;  
		}  
	}

	function showMatchingStudents(obj)
	{
		var regionId = $('#regionId').val();
		var contactNo = $("#contactNo.form-control.bfh-phone").val();
		var dateOfBirth = $('#dateOfBirth.from_date.form-control').val();
		var instituteId = $('#instituteId').val();

		contactNo = remove_whitespaces(contactNo);
		dateOfBirth = remove_whitespaces(dateOfBirth);

		if (instituteId == '' || instituteId == -1) 
		{
			$('#instituteRequired').css('display', 'inline');
			return;
		} else
		{
			$('#instituteRequired').css('display', 'none');
		}

		if (contactNo == '') 
		{
			$('#PhoneRequired').css('display', 'inline');
			return;
		} else
		{
			$('#PhoneRequired').css('display', 'none');
		}

		if (!isValidPhonenumber(contactNo)) 
		{
			$('#PhoneFormat').css('display', 'inline');
			return;
		} else
		{
			$('#PhoneFormat').css('display', 'none');
		}

		if (dateOfBirth == '') 
		{
			$('#DOBRequired').css('display', 'inline');
			return;
		} else
		{
			$('#DOBRequired').css('display', 'none');
		}

		document.getElementById("formsubmitbutton").style.display = "none"; // to undisplay
		document.getElementById("buttonreplacement").style.display = ""; // to display
		
		var url = "showMatchingStudents?selectedRegionID=" + regionId
				+ "&contactNo=" + contactNo + "&selectedDOB=" + dateOfBirth
				+ "&selectedInstitute=" + instituteId;
		ajaxRequest = new XMLHttpRequest();

		ajaxRequest.open("POST", url, true);
		ajaxRequest.send();
		ajaxRequest.onreadystatechange = setMatchingStudentsActionCounter;
	}

	function setMatchingStudentsActionCounter(response) {

		if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {

			var res = ajaxRequest.responseText;
			/*if(res="empty"){				
				$('#noStudentsFoundModal').modal('show');
				return;
				
			}*/
			document.getElementById("formsubmitbutton").style.display = ""; // to display
			document.getElementById("buttonreplacement").style.display = "none"; // to undisplay
			if (res.indexOf("empty") > -1) 
			{
				$('#DuplicateModel').modal('show');
				return;
			} else if (res.indexOf("notfound") > -1) 
			{
				$('#noStudentsFoundModal').modal('show');
				return;
			} else 
			{
				$("#studentList").append(res);
				showHide();
			}
		}
	}

	function Processing(obj) {
		obj.value = "Processing...";
		setTimeout(function() {
			disable(obj)
		}, 10);
	}

	function disable(obj) {
		obj.disabled = true;
	}
	function setActionCounter(response) {
		setBlankinstitutes();
		if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			var res = ajaxRequest.responseText;
			$('#cityselect').remove();
			if (res > 0)
				res = ("+" + res);

			var cityselectdiv = document.createElement("div");
			cityselectdiv.id = "cityselect";
			cityselectdiv.setAttribute("class", "col-sm-6");
			var cityholder = document.getElementById("cityholder");
			cityholder.appendChild(cityselectdiv);

			var select = document.createElement("select");
			select.class = "my_select_box2";
			select.id = "cities";
			select.setAttribute("name", "registerBean.regionId");
			select.setAttribute("onchange", "fetchInstitutes(this.value)")
			var cityselect = document.getElementById("cityselect");
			cityselect.appendChild(select);

			var element = document.getElementById("cities");
			document.getElementById("cities").setAttribute("class",
					"my_select_box2");
			element.innerHTML = res;
			$(".my_select_box2").chosen({
				disable_search_threshold : 0,
				no_results_text : "Oops, nothing found!",
				width : "95%"
			});
		}
	}

	function setBlankCities() {
		$('#cityselect').remove();

		var res = "";

		if (res > 0)
			res = ("+" + res);

		var cityselectdiv = document.createElement("div");
		cityselectdiv.id = "cityselect";
		cityselectdiv.setAttribute("class", "col-sm-6");
		var cityholder = document.getElementById("cityholder");
		cityholder.appendChild(cityselectdiv);

		var select = document.createElement("select");
		select.class = "my_select_box2";
		select.id = "cities";
		select.setAttribute("name", "registerBean.regionId");
		select.setAttribute("onchange", "fetchInstitutes(this.value)")
		var cityselect = document.getElementById("cityselect");
		cityselect.appendChild(select);

		var element = document.getElementById("cities");
		document.getElementById("cities").setAttribute("class",
				"my_select_box2");
		element.innerHTML = res;
		$(".my_select_box2").chosen({
			disable_search_threshold : 0,
			no_results_text : "Oops, nothing found!",
			width : "95%"
		});

	}

	function setBlankinstitutes() {
		setInstituteId("");
		$('#instituteselect').remove();
		var res = "";
		if (res > 0)
			res = ("+" + res);
		var instituteselectdiv = document.createElement("div");
		instituteselectdiv.id = "instituteselect";
		instituteselectdiv.setAttribute("class", "col-sm-6");
		var instituteholder = document.getElementById("instituteholder");
		instituteholder.appendChild(instituteselectdiv);

		var select = document.createElement("select");
		select.class = "my_select_box3";
		select.id = "institutes";
		select.setAttribute("name", "registerBean.instituteId");
		select.setAttribute("onchange", "setInstituteId(this.value)");
		var instituteselect = document.getElementById("instituteselect");
		instituteselect.appendChild(select);

		var element = document.getElementById("institutes");
		document.getElementById("institutes").setAttribute("class",
				"my_select_box3");
		element.innerHTML = res;
		$(".my_select_box3").chosen({
			disable_search_threshold : 0,
			no_results_text : "Oops, nothing found!",
			width : "95%"
		});
	}
	function fetchInstitutes(id) {

		setInstituteId("");
		$('#regionId').val(id);

		var url = "fetchInstitutes?selectedRegionID=" + id;
		ajaxRequest = new XMLHttpRequest()
		ajaxRequest.open("POST", url, true);
		ajaxRequest.send();
		ajaxRequest.onreadystatechange = setInstituteActionCounter;
	}

	function setInstituteId(id) {
		$('#instituteId').val(id);
	}

	function setInstituteActionCounter(response) {
		if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			$('#instituteselect').remove();
			var res = ajaxRequest.responseText;
			if (res > 0)
				res = ("+" + res);
			var instituteselectdiv = document.createElement("div");
			instituteselectdiv.id = "instituteselect";
			instituteselectdiv.setAttribute("class", "col-sm-6");
			var instituteholder = document.getElementById("instituteholder");
			instituteholder.appendChild(instituteselectdiv);

			var select = document.createElement("select");
			select.class = "my_select_box3";
			select.id = "institutes";
			select.setAttribute("name", "registration.instituteId");
			select.setAttribute("onchange", "setInstituteId(this.value)");
			var instituteselect = document.getElementById("instituteselect");
			instituteselect.appendChild(select);

			var element = document.getElementById("institutes");
			document.getElementById("institutes").setAttribute("class",
					"my_select_box3");
			element.innerHTML = res;
			$(".my_select_box3").chosen({
				disable_search_threshold : 0,
				no_results_text : "Oops, nothing found!",
				width : "95%"
			});
		}
	}
	function isValidEmailAddress(emailAddress) {
		var pattern = new RegExp(
				/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
		return pattern.test(emailAddress);
	};

	function isPasswordequal() {
		var password = remove_whitespaces($('#password').val());
		var confirmPassword = remove_whitespaces($('#confirmPassword').val());

		if (password == confirmPassword)
			return true
		else
			return false
	};

	function isPasswordEmpty() {
		var password = remove_whitespaces($('#password').val());
		var confirmPassword = remove_whitespaces($('#confirmPassword').val());

		if (password == '' || confirmPassword == '')
			return true
		else
			return false
	};
	$(function() {
		$('#user_id')
				.on(
						"blur",
						function() {
							var checkname = $(this).val();
							var availname = remove_whitespaces(checkname);

							if (availname == '') {
								$('#userNameRequired').css('display', 'inline');
								//alert("User Name is required");
								return false;
							} else {
								$('#userNameRequired').css('display', 'none');
							}
							if (availname != '') {
								$('.check').show();
								$('.check')
										.fadeIn(400)
										.html(
												'<img src="images/ajax-loading.gif" />	');
								var String = 'username=' + availname;
								$
										.ajax({
											type : "POST",
											url : "checkUserExistence",
											data : String,
											cache : false,
											success : function(result) {
												var result = remove_whitespaces(result);
												if (result == '') {
													$('#hdnUserName').val(
															"false");
													$('.check')
															.html(
																	'<img src="images/accept.png" /> This Username Is Avaliable');
													$(".check").removeClass(
															"red");
													$('.check').addClass(
															"green");
													$(".user_name")
															.removeClass(
																	"yellow");
													$(".user_name").addClass(
															"white");
												} else {
													$('#hdnUserName').val(
															"true");
													$('.check')
															.html(
																	'<img src="images/error.png" /> This Username Is Already Taken');
													$(".check").removeClass(
															"green");
													$('.check').addClass("red")
													$(".user_name")
															.removeClass(
																	"white");
													$(".user_name").addClass(
															"yellow");
												}
											}
										});
							} else {
								$('.check').html('');

							}
						});
	});

	function remove_whitespaces(str) {
		var str = str.replace(/^\s+|\s+$/, '');
		return str;
	}

	function remove_whitespaces(str) {
		var str = str.replace(/^\s+|\s+$/, '');
		return str;
	}
	$("#submitUser")
			.click(
					function() {
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
						var emailAdress = remove_whitespaces($('#emailAdress')
								.val());

						if (emailAdress == '') {
							$('#emailRequired').css('display', 'inline');
							$('#emailInvalid').css('display', 'none');
							counter++;
						} else {
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
						if (userId == '') {
							$('#userNameRequired').css('display', 'inline');
							//alert("User Name is required");
							counter++;
						} else {
							$('#userNameRequired').css('display', 'none');

							var isFound = $('#hdnUserName').val();
							if (isFound == "true") {
								$('#userNameDuplicateModel').modal('show');
								counter++;
							}
						}

						var password = remove_whitespaces($('#password').val());
						var confirmPassword = remove_whitespaces($(
								'#confirmPassword').val());

						if (password == '') {
							$('#passwordRequired').css('display', 'inline');
							counter++;
						} else
							$('#passwordRequired').css('display', 'none');

						if (confirmPassword == '') {
							$('#confirmPasswordRequired').css('display',
									'inline');
							counter++;
						} else
							$('#confirmPasswordRequired')
									.css('display', 'none');

						if (password != '' && confirmPassword != ''
								&& !isPasswordequal()) {
							$('#passWordDoNotMatch').css('display', 'inline');

							//alert("Password do not match");
							counter++;
						} else
							$('#passWordDoNotMatch').css('display', 'none');

						if (counter > 0)
							return false;
						else {
							document.getElementById("formsubmitbutton2").style.display = "none"; // to display
							document.getElementById("buttonreplacement2").style.display = ""; // to undisplay
						}

					});
</script>
</body>
</html>