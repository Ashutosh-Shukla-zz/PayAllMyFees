/* ======================================================= */
// Create State/City/Institute select boxes and populate   //
// them with correct values                                //
/* ======================================================= */

function setBlankCities() {
	$('#cityselect').remove();

	var cityselectdiv = document.createElement("div");
	cityselectdiv.id = "cityselect";
	cityselectdiv.setAttribute("class", "col-sm-6");
	var cityholder = document.getElementById("cityholder");
	cityholder.appendChild(cityselectdiv);

	var select = document.createElement("select");
	select.setAttribute("class", "cityselectbox");
	select.setAttribute("id", "cities");
	select.setAttribute("name", "registerBean.regionId");
	select.setAttribute("onchange", "fetchInstitutes(this.value)")
	var cityselect = document.getElementById("cityselect");
	cityselect.appendChild(select);

	var element = document.getElementById("cities");
	document.getElementById("cities").setAttribute("class",
			"cityselectbox");

	$(".cityselectbox").chosen({
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
	select.setAttribute("class", "instituteselectbox");
	select.setAttribute("id", "institutes");
	select.setAttribute("name", "registerBean.instituteId");
	select.setAttribute("onchange", "setInstituteId(this.value)");
	var instituteselect = document.getElementById("instituteselect");
	instituteselect.appendChild(select);

	var element = document.getElementById("institutes");
	document.getElementById("institutes").setAttribute("class", "instituteselectbox");
	element.innerHTML = res;
	$(".instituteselectbox").chosen({
		disable_search_threshold : 0,
		no_results_text : "Oops, nothing found!",
		width : "95%"
	});
}

function setInstituteId(id) {
	$('#instituteId').val(id);
}

function fetchCities(id) {
	setInstituteId("");
	var url = "fetchCities?selectedState=" + id;
	ajaxRequest = new XMLHttpRequest()
	ajaxRequest.open("POST", url, true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setFetchCityActionCounter;
}

function setFetchCityActionCounter(response) {
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
		select.setAttribute("class", "cityselectbox");
		select.setAttribute("id", "cities");
		select.setAttribute("name", "registerBean.regionId");
		select.setAttribute("onchange", "fetchInstitutes(this.value)")
		var cityselect = document.getElementById("cityselect");
		cityselect.appendChild(select);

		var element = document.getElementById("cities");
		document.getElementById("cities").setAttribute("class",
				"cityselectbox");
		element.innerHTML = res;
		$(".cityselectbox").chosen({
			disable_search_threshold : 0,
			no_results_text : "Oops, nothing found!",
			width : "95%"
		});
	}
}

function fetchInstitutes(id) {
	setInstituteId("");
	$('#regionId').val(id);
	var url = "fetchInstitutes?selectedRegionID=" + id;
	ajaxRequest = new XMLHttpRequest()
	ajaxRequest.open("POST", url, true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setFetchInstituteActionCounter;
}

function setFetchInstituteActionCounter(response) {
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
		select.setAttribute("class", "instituteselectbox");
		select.setAttribute("id", "institutes");
		select.setAttribute("name", "registration.instituteId");
		select.setAttribute("onchange", "setInstituteId(this.value)");
		var instituteselect = document.getElementById("instituteselect");
		instituteselect.appendChild(select);

		var element = document.getElementById("institutes");
		document.getElementById("institutes").setAttribute("class",
				"instituteselectbox");
		element.innerHTML = res;
		$(".instituteselectbox").chosen({
			disable_search_threshold : 0,
			no_results_text : "Oops, nothing found!",
			width : "95%"
		});
	}
}
/* ------------------------------------------------------- */

/* ======================================================= */
//					   DATE PICKER JS					   //
/* ======================================================= */
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
	}).on('changeDate', function(selected) {
		startDate = new Date(selected.date.valueOf());
		startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
		$('.to_date').datepicker('setStartDate', startDate);
	});
	$('.to_date').datepicker({
		weekStart : 1,
		startDate : startDate,
		endDate : ToEndDate,
		autoclose : true
	}).on('changeDate', function(selected) {
		FromEndDate = new Date(selected.date.valueOf());
		FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
		$('.from_date').datepicker('setEndDate', FromEndDate);
	});
});
/* ------------------------------------------------------- */


function remove_whitespaces(str) {
	var str = str.replace(/^\s+|\s+$/, '');
	return str;
}


function showAddMoreStudentBtn() {
	$("#findStudent, #AddStudent").css('display', 'none');
	$("#addMoreStudents").css('display', 'block');
}

/* -------------------------------------------------------- */

/* ======================================================= */
//                   FIELD VALIDATIONS					   //
/* ======================================================= */
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

function isValidEmailAddress(emailAddress)
{
	var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailAddress);
};

function isPasswordEqual()
{
	var password = remove_whitespaces($('#password').val());
	var confirmPassword = remove_whitespaces($('#confirmPassword').val());

	if (password == confirmPassword)
		return true
	else
		return false
};

function isPasswordEmpty()
{
	var password = remove_whitespaces($('#password').val());
	var confirmPassword = remove_whitespaces($('#confirmPassword').val());

	if (password == '' || confirmPassword == '')
		return true
	else
		return false
};

/* -------------------------------------------------------- */

/* ======================================================= */
//                     STUDENT SEARCH					   //
/* ======================================================= */

function showMatchingStudents(obj)
{
	var regionId    = $('#regionId').val();
	var contactNo   = $("#contactNo.form-control.bfh-phone").val();
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
	var pageRefresh = document.getElementById("pageRefresh").value;
	
	var url = "showMatchingStudents?selectedRegionID=" + regionId
			+ "&contactNo=" + contactNo + "&selectedDOB=" + dateOfBirth
			+ "&selectedInstitute=" + instituteId + "&pageRefresh=" + pageRefresh;
	ajaxRequest = new XMLHttpRequest();

	ajaxRequest.open("POST", url, true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setMatchingStudentsActionCounter;
}

function setMatchingStudentsActionCounter(response) {

	if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {

		var res = ajaxRequest.responseText;

		document.getElementById("formsubmitbutton").style.display = ""; // to display
		document.getElementById("buttonreplacement").style.display = "none"; // to undisplay
		document.getElementById("pageRefresh").value = 0;

		if(res.match("NOTFOUND"))
		{
			$('#noStudentsFoundModal').modal('show');
			return;
		}
		else if(res.indexOf("DUPLICATE") > -1)
		{
			$('#DuplicateModel').modal('show');
			return;			
		}
		else 
		{
			$("#studentList").append(res);
			showAddMoreStudentBtn();
			return;
		}
	}
}

function closeAlert(clearStudentId)
{
	// silent request to clear
	var url = "clearStudent?clearStudent=" + clearStudentId
	ajaxRequest = new XMLHttpRequest();

	ajaxRequest.open("POST", url, true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = closeAlertResult;
}

function closeAlertResult(response)
{
	if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200)
	{
		// ignore response
		var res = ajaxRequest.responseText;
	}
}