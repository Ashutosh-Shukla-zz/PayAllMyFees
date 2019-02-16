<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<s:set var="userType" value="%{#session.loginInfo.userType}"/>
<s:if test="%{#userType == 1}">
	<%@include file="institute-header.jsp"%>
</s:if>
<s:elseif test="%{#userType == 2}">
	<%@include file="user-header.jsp"%>
</s:elseif>
<s:else>
	<%@include file="header.jsp"%>
</s:else>

<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="css/datepicker.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- <link href="navbar.css" rel="stylesheet"> -->
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    
<script>
	$(document).ready(function() {
		$('#example').dataTable();
	});
	$
			.getScript(
					"js/bootstrap-datepicker.js",
					function() {

						var startDate = new Date('01/01/2012');
						var FromEndDate = new Date();
						var ToEndDate = new Date();

						ToEndDate.setDate(ToEndDate.getDate() + 365);

						$('.from_date').datepicker({

							weekStart : 1,
							startDate : '01/01/2012',
							endDate : FromEndDate,
							autoclose : true
						}).on(
								'changeDate',
								function(selected) {
									startDate = new Date(selected.date
											.valueOf());
									startDate.setDate(startDate
											.getDate(new Date(selected.date
													.valueOf())));
									$('.to_date').datepicker('setStartDate',
											startDate);
								});
						$('.to_date').datepicker({

							weekStart : 1,
							startDate : startDate,
							endDate : ToEndDate,
							autoclose : true
						}).on(
								'changeDate',
								function(selected) {
									FromEndDate = new Date(selected.date
											.valueOf());
									FromEndDate.setDate(FromEndDate
											.getDate(new Date(selected.date
													.valueOf())));
									$('.from_date').datepicker('setEndDate',
											FromEndDate);
								});
					});
</script>
	<div class="container">


		<div class="midsection">
			<div class="page-header text-center" style="margin-top: 0px;">
			   <h3>My Payment History
			   </h3>
			</div>
		
<!-- 		<div style="float:right">
			<div class="col-sm-6">
			<label>Start Date : <input type="text" class="from_date form-control " placeholder="Select start date"
				contenteditable="false"></label>
				</div>
			<div class="col-sm-6">
			 <label>End Date: <input type="text" class="to_date form-control "
				placeholder="Select end date" contenteditable="false">
			 </label>
			</div>
		</div> -->
			
			<div id="example_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
						<div class="col-sm-3">
							<label>Start Date : <input type="text"
								class="from_date form-control " placeholder="Select start date"
								contenteditable="false"></label>
						</div>
						<div class="col-sm-3">
							<label>End Date: <input type="text"
								class="to_date form-control " placeholder="Select end date"
								contenteditable="false">
							</label>
						</div>
					</div>
					<div class="row">
					<div class="col-sm-12 table-responsive">
						<table id="example"
							class="table table-striped table-bordered dataTable"
							cellspacing="0" width="100%" role="grid"
							aria-describedby="example_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Sr No: activate to sort column descending"
										style="width: 136px;" aria-sort="ascending">Sr No</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="PaymentID: activate to sort column ascending"
										style="width: 215px;">PaymentID</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending"
										style="width: 215px;">Name</th>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<th class="sorting" tabindex="0" aria-controls="example"
											rowspan="1" colspan="1"
											aria-label="Name: activate to sort column ascending"
											style="width: 215px;">Class</th>
											<th class="sorting" tabindex="0" aria-controls="example"
											rowspan="1" colspan="1"
											aria-label="Name: activate to sort column ascending"
											style="width: 215px;">Division</th>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<th class="sorting" tabindex="0" aria-controls="example"
											rowspan="1" colspan="1"
											aria-label="School: activate to sort column ascending"
											style="width: 98px;">School</th>
									</s:elseif>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Bank: activate to sort column ascending"
										style="width: 43px;">Bank</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Date: activate to sort column ascending"
										style="width: 93px;">Date</th>
									<th class="sorting" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Amount: activate to sort column ascending"
										style="width: 76px;">Amount</th>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">

									</s:if>
									<s:elseif test="%{#userType == 2}">
										<th class="sorting" tabindex="0" aria-controls="example"
											rowspan="1" colspan="1"
											aria-label="Amount: activate to sort column ascending"
											style="width: 76px;">Receipt</th>
									</s:elseif>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th rowspan="1" colspan="1">Sr No</th>
									<th rowspan="1" colspan="1">PaymentID</th>
									<th rowspan="1" colspan="1">Name</th>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<th rowspan="1" colspan="1">Class</th>
										<th rowspan="1" colspan="1">Division</th>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<th rowspan="1" colspan="1">School</th>
									</s:elseif>
									<th rowspan="1" colspan="1">Bank</th>
									<th rowspan="1" colspan="1">Date</th>
									<th rowspan="1" colspan="1">Amount</th>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
									
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<th rowspan="1" colspan="1">Receipt</th>
									</s:elseif>
								</tr>
							</tfoot>

							<tbody>
								<tr role="row" class="odd">
									<td class="sorting_1">1</td>
									<td>345D34</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>10</td>
										<td>A</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$16</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">2</td>
									<td>356dddD34</td>
									<td>Mark</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>3</td>
										<td>B</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Mary</td>
									</s:elseif>
									<td>HDFC</td>
									<td>2009/11/31</td>
									<td>$150</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">3</td>
									<td>4577ds56D</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>3</td>
										<td>F</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>HSBC</td>
									<td>2009/11/28</td>
									<td>$168</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd center-text">
									<td class="sorting_1">4</td>
									<td>345Drtg34</td>
									<td>Mark</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>3</td>
										<td>C</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Mary</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$144</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
									
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">5</td>
									<td>345Ddd34</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>8</td>
										<td>B</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$155</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">6</td>
									<td>345awwD34</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>10</td>
										<td>A</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$165</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
									
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">7</td>
									<td>345Ddad34</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>5</td>
										<td>D</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$160</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
									
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">8</td>
									<td>345Dddad34</td>
									<td>Steve</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
										<td>8</td>
										<td>A</td>
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td>St.Laurance</td>
									</s:elseif>
									<td>Citi</td>
									<td>2008/11/28</td>
									<td>$160</td>
									<s:set var="userType" value="%{#session.loginInfo.userType}"/>
									<s:if test="%{#userType == 1}">
									
									</s:if>
									<s:elseif test="%{#userType == 2}">
										<td><a href="#"><span class="glyphicon glyphicon-download-alt"></span>Download</a></td>
									</s:elseif>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					<a href="#" class="btn btn-primary" style="float:right">Export</a>
			</div>

			<%@include file="footer.jsp" %>
			<!-- Main component for a primary marketing message or call to action -->
			<!-- /container -->
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>