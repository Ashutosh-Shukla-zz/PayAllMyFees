<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="admin-header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#studentTable').dataTable({
			"language" : {
				"emptyTable" : "No students found for this institution"
			}
		});
	});
</script>
<div class="container">
	<div class="midsection" role="main">
		<input type="hidden" id="hiddenInstituteId" value="<s:property value="institute.instituteId"/>"/>
		<div id="notify-status-change"></div>
		<div class="page-header text-center" style="margin-top: 0px;">
		   <div class="h3">
		   		<s:set var="instituteStatus" value="institute.isActive"/>
		   		<div id="block-status-info">
			   		<s:if test="%{#instituteStatus==0}">
			   				<div class="alert alert-warning" role="alert">
								<h4 class="h4 small">*** Blocked Institute ***</h4>
							</div>
			   		</s:if>
		   		</div>
		   		<s:property value="institute.InstituteName" />
		   		<div id="status-button" style="display: inline;">
			   		<s:set var="instituteStatus" value="institute.isActive"/>
					<s:if test="%{#instituteStatus==0}">
						<button type="button" class="btn btn-success" data-toggle="modal" data-backdrop="static" data-whatever="Activate" data-target="#myModal" style="width:74px; float:right; margin-right: 10px; margin-bottom: 10px;">Activate</button>
					</s:if>
					<s:else>
						<button type="button" class="btn btn-danger" data-toggle="modal" data-backdrop="static" data-whatever="Block" data-target="#myModal" style="width:74px; float:right; margin-right: 10px; margin-bottom: 10px;">Block</button>
					</s:else>
				</div>
		   </div>
		</div>
		<div class="row">
			<div class="col-sm-12 table-responsive">
				<table id="studentTable"
					class="table table-striped table-bordered dataTable" role="grid">
					<thead>
						<tr role="row">
							<th class="sorting_desc" tabindex="0" aria-controls="example"
								rowspan="1" colspan="1"
								aria-label="Student Id: activate to sort column descending"
								style="width: 70px;" aria-sort="ascending">Student ID</th>
							<th class="sorting" tabindex="0" aria-controls="example"
								rowspan="1" colspan="1"
								aria-label="Name: activate to sort column ascending"
								style="width: 150px;">Name</th>
							<th class="sorting" tabindex="0" aria-controls="example"
								rowspan="1" colspan="1"
								aria-label="Guardian: activate to sort column ascending"
								style="width: 150px;">Guardian</th>
							<th class="sorting" tabindex="0" aria-controls="example"
								rowspan="1" colspan="1"
								aria-label="Date of Birth: activate to sort column ascending"
								style="width: 80px;">Date of Birth</th>
							<th class="sorting" tabindex="0" aria-controls="example"
								rowspan="1" colspan="1"
								aria-label="Email: activate to sort column ascending"
								style="width: 100px;">Email</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th rowspan="1" colspan="1">
								Student ID
							</th>
							<th rowspan="1" colspan="1">
								Name
							</th>
							<th rowspan="1" colspan="1">
								Guardian
							</th>
							<th rowspan="1" colspan="1">
								Date of Birth
							</th>
							<th rowspan="1" colspan="1">
								Email
							</th>
						</tr>
					</tfoot>
					<tbody>
						<s:iterator var="student" value="studentsList">
							<tr role="row" class="odd">
								<td class="sorting_1 hoverchange-color">
									<s:property value="studentId" />
								</td>
								<td>
									<s:property value="FirstName"></s:property>&nbsp;<s:property value="LastName"></s:property>
								</td>
								<td>
									<s:property value="GaurdianName"></s:property>
								</td>
								<td>
									<s:property value="dateOfBirth"></s:property>
								</td>
								<td>
									<s:property value="Email"></s:property>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Modal -->
		<div style="width:300px">
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Confirm</h4>
		      </div>
		      <div class="modal-body">
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="confirm-modal-primary-btn"></button>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		<%@include file="footer.jsp"%>
	</div>

</div>
<!-- /container -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/dataTables.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script>
$.noConflict();
$('#myModal').on('shown.bs.modal', function (e) {
	var body = document.getElementsByTagName("body")[0];
	body.setAttribute("style","padding-right: 0px;");
});

$('#myModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modalPrimaryButtonClass = "btn btn-danger";
	  var modalPrimaryButton = document.getElementById("confirm-modal-primary-btn");
	  if(recipient=='Block')
	  {
		  modalPrimaryButtonClass = "btn btn-danger";
		  modalPrimaryButton.setAttribute("onclick", "changeInstituteStatus(0)");
	  }
	  else
	  {
		  modalPrimaryButtonClass = "btn btn-success";
		  modalPrimaryButton.setAttribute("onclick", "changeInstituteStatus(1)");
	  }
	  document.getElementById("confirm-modal-primary-btn").setAttribute("class", modalPrimaryButtonClass);
	  document.getElementById("confirm-modal-primary-btn").innerHTML = recipient;
	  // show message in modal window
	  var modal = $(this)
	  modal.find('.modal-body').text('Please confirm to ' + recipient + ' this institution')
	})

function changeInstituteStatus(isActive) {
	var instituteId = document.getElementById('hiddenInstituteId').value;
	var url = "changeInstitutionStatus?institute.instituteId=" + instituteId + "&institute.isActive=" + isActive;
	ajaxRequest = new XMLHttpRequest();
	ajaxRequest.open("POST", url, true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setActionCounter;
	$('#myModal').modal('hide')
}

function setActionCounter(response) {
	if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
		var isActive = ajaxRequest.responseText;
		
		// empty all divs
		$('#block-status-info').empty();
		$('#status-button').empty();
		$('#notify-status-change').empty();
		
		// start creating elements accord. to satisfied conditions
		var alertDiv = document.createElement("div");
		alertDiv.setAttribute("class","alert alert-success alert-dismissible");
		alertDiv.setAttribute("role", "alert");

		var alertCloseButton = document.createElement("button");
		alertCloseButton.setAttribute("class", "close");
		alertCloseButton.setAttribute("data-dismiss", "alert");
		alertCloseButton.setAttribute("aria-label", "Close");

		var alertCloseButtonSpan = document.createElement("span");
		alertCloseButtonSpan.setAttribute("aria-hidden", "true");

		var contentSpan = document.createElement("span");

		alertDiv.appendChild(alertCloseButton);
		alertCloseButton.appendChild(alertCloseButtonSpan);
		alertCloseButtonSpan.innerHTML = "&times;";
		alertDiv.appendChild(contentSpan);
		contentSpan.innerHTML = "Status of this institution has updated successfully";

		var changeStatusButton = document.createElement("button");
		changeStatusButton.setAttribute("type", "button");
		changeStatusButton.setAttribute("style", "width:74px; float:right; margin-right: 10px; margin-bottom: 10px;");
		if(isActive == "0")
		{
			changeStatusButton.setAttribute("class", "btn btn-success");
			changeStatusButton.setAttribute("data-toggle", "modal");
			changeStatusButton.setAttribute("data-backdrop", "static");
			changeStatusButton.setAttribute("data-whatever", "Activate");
			changeStatusButton.setAttribute("data-target", "#myModal");
			changeStatusButton.innerHTML = "Activate";

			// create permanent warning div to notify user if institute is blocked
			var blockAlertDiv = document.createElement("div");
			blockAlertDiv.setAttribute("class", "alert alert-warning");
			blockAlertDiv.setAttribute("role", "alert");
			
			var header4 = document.createElement("h4");
			header4.setAttribute("class", "h4 small");
			header4.innerHTML = "*** Blocked Institute ***";
			blockAlertDiv.appendChild(header4);
			
			document.getElementById("block-status-info").appendChild(blockAlertDiv);

		}
		else
		{
			changeStatusButton.setAttribute("class", "btn btn-danger");
			changeStatusButton.setAttribute("data-toggle", "modal");
			changeStatusButton.setAttribute("data-backdrop", "static");
			changeStatusButton.setAttribute("data-whatever", "Block");
			changeStatusButton.setAttribute("data-target", "#myModal");
			changeStatusButton.innerHTML = "Block";
		}
		
		document.getElementById("status-button").appendChild(changeStatusButton);
		document.getElementById("notify-status-change").appendChild(alertDiv);
	}
}
</script>
</body>
</html>