<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="user-header.jsp"%>
<div class="container">
<div class="sidebar"></div>
	<!-- Modal T&C agree and disagree -->
	
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Confirm Please</h4>
      </div>
      <div class="modal-body">
        <p>An amount of Rs xxx inclusive of Service Tax @  12.36 % will be deducted in addition to the fees amount as facilitation charges.</p>
        <p>I agree to the <a href="terms-conditions.jsp">terms and conditions</a></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Disagree</button>
        <a href="payment"><button type="button" class="btn btn-success">Agree &amp; Pay</button></a>
      </div>
    </div>
  </div>
</div>
<div class="midcontent clear " role="main" style="margin-top: 10px;">
<div class="page-header text-center" style="margin-top: 0px;">
   <h3>Pay Your fees
   </h3>
</div>
	<div class="row container">
		<div class="panel panel-default">
			<div class="panel-heading">
						<span class="panel-title"> <s:property
						value="selectedStudent.FirstName" />&nbsp;
						<s:property value="selectedStudent.LastName" /></span> 
			</div>
			<div class="panel-body">
				<div class="row">
						<div class="col-sm-6">
							<div class="col-sm-6"><label>Institution Name </label></div>
							<div class="col-sm-6">:&nbsp;<s:property value="selectedStudent.instituteBean.InstituteName" /></div>
						</div>		
						<div class="col-sm-6">
							<div class="col-sm-6"><label>Late Fees</label></div>
							<div class="col-sm-6">:&nbsp;<s:property value="selectedStudent.lateFeeAmount" /></div>
						</div>							
				</div>
				<div class="row">
						 <div class="col-sm-6">
							<div class="col-sm-6"><label>Class </label></div>
							<div class="col-sm-6">:&nbsp;<s:property value="selectedStudent.StudentClass" /></div>
						</div> 	
						<div class="col-sm-6">
							<div class="col-sm-6"><label>Division</label></div>
							<div class="col-sm-6">:&nbsp;<s:property value="selectedStudent.Div" /></div>
						</div>
				</div>
				<div class="row">
							<div class="col-sm-6">
							<div class="col-sm-6"><label>Fees Paid </label></div>
							<div class="col-sm-6">:&nbsp;<s:property value="selectedStudent.FeePaid" /></div>
						</div>
						
						<%-- <div class="col-sm-6">
							<span class="col-sm-6"><label>Late Fees</label></span>
							<span class="col-sm-6">:&nbsp;<s:property value="selectedStudent.lateFeeAmount" /></span>
						</div>	 --%>									
				</div> 
			
			
<%--			
				<label>Date of birth :</label>
				<s:property value="selectedStudent.dateOfBirth" />
				<br>
				
 				
				<br>
				<label>Institution Address :</label>
				<s:property value="selectedStudent.instituteBean.InstituteAddress" />
				<br>
				<label>Institution Contact NO. :</label>
				<s:property value="selectedStudent.instituteBean.contactNo" />
				<br>
				<label>Institution Email :</label>
				<s:property value="selectedStudent.instituteBean.InstituteEmail" />
				<br>
				<label>Fees due :</label>
				<s:property value="selectedStudent.feeAmountDue" />
				<br>
				<label>Due Date :</label>
				<s:property value="selectedStudent.dueDate" />
				<br>
				<label>Fees Paid :</label>
				<s:property value="selectedStudent.FeePaid" />
				<br>
				<label>Late Fees:</label>
				<s:property value="selectedStudent.lateFeeAmount" />
				<br>
				<label>Rule ID :</label>
				<s:property value="instituteFeeStructure.ruleID"></s:property>
				<br>
 				<label>Institution Mapping ID :</label>
				<s:property value="instituteFeeStructure.instClassDivMapId"></s:property>
				--%>
				<script type="text/javascript">
					window.onload = function() {
						var id = "ta";
						var maxHeight = "1024";
						var maxWidth  = "600";
						var text = id && id.style ? id : document
								.getElementById(id);
						if (!text)
							return;

						var adjustedHeight = text.clientHeight;
						if (!maxHeight || maxHeight > adjustedHeight) {
							adjustedHeight = Math.max(text.scrollHeight,
									adjustedHeight);
							if (maxHeight)
								adjustedHeight = Math.min(maxHeight,
										adjustedHeight);
							if (adjustedHeight > text.clientHeight)
								text.style.height = adjustedHeight + "px";
						}
						
						var adjustedWidth = text.clientWidth;
						if (!maxWidth || maxWidth > adjustedWidth) {
							adjustedWidth = Math.max(text.scrollWidth,
									adjustedWidth);
							if (maxWidth)
								adjustedWidth = Math.min(maxWidth,
										adjustedWidth);
							if (adjustedWidth > text.clientWidth)
								text.style.width = adjustedWidth + "px";
						}
					}
				</script>
				<label style="margin-top:30px" >Fee Structure</label>
				<table class="table table-hover" >
  					<tr><th>Admission Fees</th>
  					<th>Tution Fees</th>
  					<th>Term Fees</th>
  					<th>Total Fees</th></tr>
  					<tr>
  					<td>8300</td>
  					<td>1000</td>
  					<td>500</td>
  					<td>9800</td>
  					</tr>
				</table>
			<%-- 	<br> 
				<label for="text">Fee Structure :</label>
				<br>
				<s:textarea name="text" disabled="true" id="ta" value="%{instituteFeeStructure.feeStructure}" cssStyle="background-color:white; border:white; width:100%"></s:textarea>
				<br>
			 --%>	<%-- <form action="request" method="post">
					<s:textfield name="amount" value="100.0" cssStyle="form-control"></s:textfield>
					<s:submit cssClass="btn btn-success" cssStyle="float:right;" value="Go Pay Fees!!"></s:submit>
				</form> --%>
				<button type="button" data-backdrop="static" data-keyboard="false" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="float:right;" value="Go Pay Fees!!">Go Pay Fees!!</button>
			</div>
		</div>
	</div>

</div>
<%@include file="footer.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
</div>
<!-- /container -->


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script>

$(function () {
$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  });
  
  });
</script>

</body>
</html>