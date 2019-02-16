<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="institute-header.jsp"%>
<div class="container">
	<script type="text/javascript">
		function check_extension(filename) {
			var hash = {
				'.xls' : 1,
				'.xlsx' : 2

			};
			var re = /\..+$/;
			var ext = filename.match(re);

			if (hash[ext]) {
				return true;
			} else {
				alert("Invalid filename, please select '.xls'/'.xlsx' file");
				return false;
			}
		}
		function clickedUpload() {

			var value = document.getElementById("file").value;
			alert(value);
			if (document.getElementById("file").value == "") {
				alert("Please select file to upload");
				return false;
			} else if (!check_extension(value)) {
				return false;
			} else {

				var str = document.forms[0].file.value;
				var lastIndex = str.lastIndexOf('\\');
				var exactFileName = str.substring(lastIndex + 1);
				document.forms[0].action = "institute_UploadData";
				document.forms[0].fileName.value = exactFileName;
				return true;
			}
		}
		
		function exportData(){
			document.forms[0].action = "institute_exportData";
			document.forms[0].submit();
		}
	</script>
	<script>

	function fetchDivisions(className) {
		var url = "institute_fetchDivisions?className=" + className;
		ajaxRequest = new XMLHttpRequest()
		ajaxRequest.open("POST", url, true);
		ajaxRequest.send();
		ajaxRequest.onreadystatechange = setFetchDivisonsActionCounter;
	}

	function setFetchDivisonsActionCounter(response) {
		
		if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			var res = ajaxRequest.responseText;
			$('#divselect').remove();
			if (res > 0)
				res = ("+" + res);

			var divselectdiv = document.createElement("div");
			divselectdiv.id = "divselect";
			divselectdiv.setAttribute("class", "col-sm-2");
			var divholder = document.getElementById("divholder");
			divholder.appendChild(divselectdiv);
			divholder.setAttribute("class", "col-sm-5");
			
			var select = document.createElement("select");
			select.setAttribute("class", "divselectbox");
			select.setAttribute("id", "div");
			select.setAttribute("name", "div");			
			var divselect = document.getElementById("divselect");
			divselect.appendChild(select);

			var element = document.getElementById("div");
			document.getElementById("div").setAttribute("class",
					"divselectbox");
			element.innerHTML = res;
			
		}
	}

	</script>

	<div style="min-height: 300px;">
		<div style="margin-top: 30px; margin-bottom: 30px;">
			<s:form method="post" action="institute_UploadData" theme='simple'
				enctype="MULTIPART/FORM-DATA">
				<div class="col-sm-12">
					<div class="form-group col-sm-5" >
						<label class="col-sm-3">Class </label>
						<div class="col-sm-2">
							<s:select list="classList" name="className" id="className" headerKey="" onchange="fetchDivisions(this.value)" headerValue="Select Class" />
						</div>
					</div>
					<div class="form-group col-sm-5" id="divholder" >
						<label class="col-sm-3 control-label">Division</label>
						<div class="col-sm-2" id="divselect">
							<s:select list="divList" headerKey="" headerValue=" -- Select --" />
						</div>
					</div>
					
					<div class="col-sm-2">
							<a class="btn btn-primary "
							href="#" onclick="exportData()">Export Data</a>
					</div>
				</div>
				<div class="col-sm-12">&nbsp;</div>
				
				<div class="col-sm-12">
					<div class="col-sm-10">
						<s:file name="file" id="file" size="60"
							accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
					</div>
	
					<div class="col-sm-2">
						<button class="btn btn-primary btn-md" onclick="return clickedUpload()">Upload Students Data</button>
						<s:hidden name="fileName" property="fileName" />
					</div>
				</div>
			</s:form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<!-- Main component for a primary marketing message or call to action -->


</div>
<!-- /container -->


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>