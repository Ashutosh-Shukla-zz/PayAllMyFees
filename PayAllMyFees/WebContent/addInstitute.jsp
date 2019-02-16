<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="admin-header.jsp"%>

<div class="container">
<div class="page_header">
		<label>Add Institution</label>
		<hr>
	</div>
<div class="form midsection" style="margin-bottom: 200px;">
<s:form cssClass="form-horizontal pmf_registration" action="insert-institute" method="POST">
					<div class="form-group">
						<label class="col-sm-6 control-label">Institution Name</label>
						<div class="col-sm-6">
							<input type="text" maxlength="500" class="form-control" name="institute.InstituteName">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Institution Address</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" placeholder="Institution Address" name="institute.InstituteAddress">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Phone No</label>
						<div class="col-sm-6">
							<input type="number" max="9999999999" maxlength="10" class="form-control bfh-phone"
								data-country="india"  name="institute.contactNo">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Institution Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control"  name="institute.InstituteEmail">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Desired Username</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  autocomplete="off" name="username" id="user_id" class="user_name" >
							<span class="check" ></span> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 control-label">Desired Password</label>
						<div class="col-sm-6">
							<input type="text" maxlength="10" class="form-control" name="password">
						</div>
					</div>
					<div class="form-group" style="z-index: 999;">
					<label class="col-sm-6 control-label">Select State</label>
					<div class="col-sm-6">
					<select class="my_select_box1 col-sm-6" data-placeholder="Select Your Options" onchange="fetchCities(this.value)">
					  	<option></option>
					  	<s:iterator value="stateList" var="state">
					  		<option value="<s:property value="state"/>"><s:property value="state"/></option>
						</s:iterator>
					</select>
					</div>
					</div>
					<div id="cityholder" class="form-group">
					<label class="col-sm-6 control-label">Select City</label>
						<div id="cityselect">
						</div>
					</div>
					<div class="form-group">
						<div class=" col-sm-12" style="text-align: center">
							<button type="submit" class="btn btn-primary">Add Institution</button>
						</div>
					</div>
		</s:form>
		<div class="clear" style="height: 200px;">&nbsp;</div>
	</div>

<%@include file="footer.jsp"%>
</div>

<!-- /container -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script src="js/chosen.jquery.js"></script>
<link href="css/chosen.css" rel="stylesheet">
<script>

	$(".my_select_box1").chosen({
		disable_search_threshold : 0,
		no_results_text : "Oops, nothing found!",
		width : "95%"
	});

	function fetchCities(id) {
		$('#cityselect').remove();

		var url = "fetchCities?selectedState=" + id;
		ajaxRequest = new XMLHttpRequest();
		ajaxRequest.open("POST", url, true);
		ajaxRequest.send();
		ajaxRequest.onreadystatechange = setActionCounter;
	}

	function setActionCounter(response) {
		if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			var res = ajaxRequest.responseText;
			if (res > 0)
				res = ("+" + res);
			var cityselectdiv = document.createElement("div");
			cityselectdiv.id = "cityselect";
			cityselectdiv.setAttribute("class","col-sm-6");
			var cityholder = document.getElementById("cityholder");
			cityholder.appendChild(cityselectdiv);

			var select = document.createElement("select");
			select.class = "my_select_box2";
			select.id = "cities";
			select.setAttribute("name", "institute.regionId");
			var cityselect = document.getElementById("cityselect");
			cityselect.appendChild(select);

			var element = document.getElementById("cities");
			document.getElementById("cities").setAttribute("class","my_select_box2");
			element.innerHTML = res;
			$(".my_select_box2").chosen({
				disable_search_threshold : 0,
				no_results_text : "Oops, nothing found!",
				width : "95%"
			});
		}
	}
	
	
	$(function()
			{
			$('#user_id').on("blur",function()
			{
			var checkname=$(this).val();
			var availname=remove_whitespaces(checkname);
			if(availname!=''){
			$('.check').show();
			$('.check').fadeIn(400).html('<img src="images/ajax-loading.gif" />	');
			var String = 'username='+ availname;
			$.ajax({
			type: "POST",
			url: "checkUsername",
			data: String,
			cache: false,
			success: function(result){
			var result=remove_whitespaces(result);
			if(result==''){
			$('.check').html('<img src="images/accept.png" /> This Username Is Avaliable');
			$(".check").removeClass("red");
			$('.check').addClass("green");
			$(".user_name").removeClass("yellow");
			$(".user_name").addClass("white");
			}else{
			$('.check').html('<img src="images/error.png" /> This Username Is Already Taken');
			$(".check").removeClass("green");
			$('.check').addClass("red")
			$(".user_name").removeClass("white");
			$(".user_name").addClass("yellow");
			}
			}
			});
			}else{
			$('.check').html('');

			}
			});
			});

	function remove_whitespaces(str){
	     var str=str.replace(/^\s+|\s+$/,'');
	     return str;
		 


	}

</script>
</body>
</html>