<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="institute-header.jsp" %>
	<div class="container">
	      <div class="midsection" role="main">
	      	<div class="jumbotron">
			  	<h2>Welcome, <s:property value="studentList[0].instituteBean.InstituteName"/>!</h2>
			  	<p><s:property value="studentList[0].instituteBean.InstituteAddress"/></p>
			</div>
		<div class="accordion panel-group" id="accordion2">
	 			<div class="accordion-group">
	 			<div class="row text-center">
	 				<a class="accordion-toggle" data-toggle="collapse"  href="#collapse">
	 					<button class="btn btn-lg btn-primary">Our Students</button>
	 				</a>
	 			</div>
			<!-- Data Table Start -->
			<div id="collapse" class="accordion-body collapse in" style="margin-top: 15px;">
      			<div class="accordion-inner">
	 			<div class="clear"></div> 
					<div class="row text-center">
					<table style="border: 0px ;margin:0px auto;">
						<tbody>
							<tr id="filter_col1" class="col-sm-6" data-column="0">
								<td>
									Class &nbsp;
								</td>
								<td>
									<input type="text"  class="column_filter form-control column_filter" id="col0_filter">
								</td>
								<td>
									<input hidden="hidden" type="checkbox" class="column_filter form-control column_filter" id="col0_smart" checked="checked">
								</td>
							</tr>
							<tr id="filter_col2" data-column="1" class="col-sm-6">
								<td>
									Div  &nbsp;
								</td>
								<td align="center">
									<input type="text" class="column_filter form-control column_filter" id="col1_filter">
								</td>
								<td align="center">
									<input hidden="hidden" type="checkbox" class="column_filter" id="col1_smart" checked="checked">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="clear" style="border-bottom: 1px solid #eee; margin-top: 13px; margin-bottom: 13px;"></div>
				
				<div class="col-sm-12 table-responsive">
					<table id="example" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="example_info" style="width: 100%;">
						<thead>
							<tr role="row">
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending">
									Class
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Division: activate to sort column ascending">
									Division
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending">
									Name
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Date of Birth: activate to sort column ascending">
									Date of Birth
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Fees Amount Due: activate to sort column ascending">
									Fees Amount Due
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Due Date: activate to sort column ascending">
									Due Date
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Late fee amount: activate to sort column ascending">
									Late fee amount
								</th>
								<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Paid (Y/N): activate to sort column ascending">
									Paid (Y/N)
								</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">Class</th>
								<th rowspan="1" colspan="1">Division</th>
								<th rowspan="1" colspan="1">Name</th>
								<th rowspan="1" colspan="1">Date of Birth</th>
								<th rowspan="1" colspan="1">Fees Amount Due</th>
								<th rowspan="1" colspan="1">Due Date</th>
								<th rowspan="1" colspan="1">Late fee amount</th>
								<th rowspan="1" colspan="1">Paid (Y/N)</th>
							</tr>
						</tfoot>
						<tbody>
							<s:iterator value="studentList">
								<tr role="row" class="odd">
									<td><s:property value="StudentClass"/></td>
									<td><s:property value="Div"/></td>
									<td><s:property value="FirstName"/> <s:property value="LastName"/></td>
									<td><s:property value="dateOfBirth"/></td>
									<td><s:property value="feeAmountDue"/></td>
									<td><s:property value="dueDate"/></td>
									<td><s:property value="lateFeeAmount"/></td>
									<td><s:property value="FeePaid"/></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<a href="institute_exportData"><button class="btn btn-lg btn-primary" style="float: right;">Export Data</button></a>
				</div>
				</div>
				
				</div>
				<script>
					$('#collapse').collapse({
						  toggle: true
					});
				</script>
				</div>
				<div class="clear"></div>
				<div class="row text-center"  style="margin-bottom: 10px;">
					<a href="notification"><button class="btn btn-lg btn-primary">Send Notification</button></a>
	 				<div class="clear" style="margin-bottom: 10px;"></div>
	 			</div>
	 			<div class="clear"></div>
				<div class="row text-center">
	 				<a href="paymenthistory"><button class="btn btn-lg btn-primary" >Payment History</button></a>
	 				<div class="clear" style="margin-bottom: 10px;"></div>
	 			</div>
	 			<div class="clear" style="margin-bottom: 10px;" ></div>
				<div class="row row text-center">
					<a href="institute_UploadData"><button class="btn btn-lg btn-info" >Upload Students Data</button></a>
					<div class="clear"  style="margin-bottom: 30px;"></div>
		</div>
		<!-- Data Table End--> 
		</div>
		<%@include file="footer.jsp" %>
	</div>
	
	<!-- Modal Window for notification Start -->
	
	<div class="modal fade" id="send-notification">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<!-- Modal Window for notification Start -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    
    <script type="text/javascript">
    function filterColumn ( i ) {
        $('#example').DataTable().column( i ).search(
            $('#col'+i+'_filter').val(),
            $('#col'+i+'_regex').prop('checked'),
            $('#col'+i+'_smart').prop('checked')
        ).draw();
    }
     
    $(document).ready(function() {
        $('#example').dataTable();
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        } );
    } );
    
    $(function () {
    	$('#accordion2').on('show.bs.collapse', function () {
    		if(active)
    		{
    			$('#accordion2 .in').collapse('hide');
    		}
    	});
    });

    </script>
  </body>
</html>