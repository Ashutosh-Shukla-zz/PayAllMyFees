<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="admin-header.jsp"%>
<div class="container">
	<div class="midsection" role="main">
<%-- 		<div class="alert alert-success" role="alert">
			<strong>Welcome, <s:property value="adminBean.firstName" />&nbsp;<s:property value="adminBean.lastName" />...!!</strong>
		</div> --%>
		<div class="page-header text-center" style="margin-top: 0px;">
		   <h3>Registered Institutions
		   </h3>
		</div>
		<div class="row">
					<div class="col-sm-12 table-responsive">
						<table id="example"
							class="table table-striped table-bordered dataTable" role="grid">
							<thead>
								<tr role="row">
									<th class="sorting_desc" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Institute Id: activate to sort column descending"
										style="width: 10px" aria-sort="ascending">ID</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Institute Name: activate to sort column ascending"
										style="width: 150px;">Institute Name</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Address: activate to sort column ascending"
										style="width: 200px;">Address</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="City: activate to sort column ascending"
										style="width: 70px;">City</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="State: activate to sort column ascending"
										style="width: 70px;">State</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										style="width: 20px" aria-label="Active: activate to sort column ascending">Active</th>
									<th class="sorting_desc" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Institute Id: activate to sort column descending"
										style="width: 60px;" aria-sort="ascending">Details</th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th class="text-center" rowspan="1" colspan="1">ID</th>
									<th rowspan="1" colspan="1">Institute Name</th>
									<th rowspan="1" colspan="1">Address</th>
									<th rowspan="1" colspan="1">City</th>
									<th rowspan="1" colspan="1">State</th>
									<th rowspan="1" colspan="1" class="text-center">Active</th>
									<th rowspan="1" colspan="1" class="text-center">Details</th>
									<!-- <th rowspan="1" colspan="1">Amount</th> -->
								</tr>
							</tfoot>

							<tbody>
							<s:iterator var="List" value="adminBean.instituteBeanList">
								<tr role="row" class="odd">
									<td class="sorting_1 text-center"><s:property value="instituteId"/></td>
									<td ><s:property value="InstituteName"></s:property></td>
									<td><s:property value="InstituteAddress"></s:property></td>
									<td><s:property value="city"></s:property></td>
									<td><s:property value="state"></s:property></td>
									<td class="text-center"><s:property value="isActive"></s:property></td>
									<td class="sorting_1 hoverchange-color"><a href="institute-detail?instituteId=<s:property value="instituteId" />">More Info&nbsp;<span class="glyphicon glyphicon-info-sign"></span></a></td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
		<%@include file="footer.jsp"%>
	</div>

</div>
<!-- /container -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>

</body>
</html>