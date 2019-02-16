<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="header.jsp"%>

<div class="container bodydiv">
	  <div class="Login_tab">
		<s:set value="%{#parameters.loginFailed}" var="loginFailed"/>
		<div class="student_login">
			<h2 class="bg_h2">Student Login</h2>
			<form class="loginform form-horizontal" data-toggle="validator" action="loginUser"	method="POST">
				<div class="form-group">
					<label for="inputUser3" class="col-sm-4 control-label">Username</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="loginCredentials.username"
							id="inputUser3" placeholder="Username" required>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-4 control-label" >Password</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="loginCredentials.password"
							id="inputPassword3" placeholder="Password" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<a href="forgot">Forgot Password?</a>
					</div>
				</div>
				<s:if test='%{#loginFailed[0]=="2"}'>
					<div class="form-group">
						<div class="col-sm-12">
							<div class="alert alert-danger alert-sm" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Please enter valid Username and Password.
							</div>
						</div>
					</div>
				</s:if>
				<input type="hidden" name="loginCredentials.userType" value="2">
				<div class="reg-button form-group">
					<div class="col-sm-offset-1 col-sm-12">
						<a class="btn btn-sm btn-primary" href="register-user">New User</a>						
						<button type="submit" class="btn btn-sm btn-primary col-sm-offset-1">Log in</button>
					</div>
				</div>
			</form>
	</div>
		
		<div class="institute_login">
			<h2 class="bg_h2">Institution Login</h2>
			<form class="loginform form-horizontal" data-toggle="validator" action="loginInstitute" name="institute-login" method="POST">
				<div class="form-group">
					<label for="inputUser3" class="col-sm-4 control-label">Username</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="loginCredentials.username" id="inputUser3" placeholder="Username" required>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-4 control-label">Password</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="loginCredentials.password" id="inputPassword3" placeholder="Password" required>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<a href="forgot">Forgot Password?</a>
					</div>
				</div>
				
				<s:if test='%{#loginFailed[0]=="1"}'>
					<div class="form-group">
						<div class="col-sm-12">
							<div class="alert alert-danger alert-sm" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Please enter valid Username and Password.
							</div>
						</div>
					</div>
				</s:if>
				<input type="hidden" name="loginCredentials.userType" value="1">
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-sm btn-primary">Log in</button>
					</div>
				</div>
			</form>
		</div>
		
	  </div>
	  <div class="midcontent clear">
	  	<div class="ann_notices">
	  	<div class="row "> 
	  		<div class="col-sm-6 ann_notices_content" style="text-align:center;">
	  			<a href="#" class="btn btn-primary" style="width:200px;">Founder's Message</a>
	  		</div>
	  		<div class="col-sm-6 ann_notices_content" style="text-align:center;">
	  			<a href="#" class="btn btn-primary" style="width:200px;">Testimonials</a>
	  		</div>
	  		</div>
	  			<div class="row "> 
	  			<div class="col-sm-6 ann_notices_content" style="text-align:center;">
	  			<a href="#" class="btn btn-primary" style="width:200px;">Newsroom</a>
	  		</div>
	  		<div class="col-sm-6 ann_notices_content" style="text-align:center;">
	  			<a href="#" class="btn btn-primary">Notices And Announcements</a>
	  		</div>
	  			</div>
	  	</div>
	  	<div class="main_results">
	  		<h2 class="bg_h2" style="width:80px; margin-top: 0px; margin-left: 37px;">
	  			Result
	  		</h2>
	  		<ul class="pmf_acad_list">
	  			<li style="font-weight: bold;">
	  				Academics
	  			</li>
	  			<li>
	  				Boards
	  			</li>
	  			<li>
	  				Universities
	  			</li>
	  			<li>
	  				Schools
	  			</li>
	  			<li>
	  				Colleges
	  			</li>
	  		</ul>
	  		<ul class="pmf_cmp_list">
	  			<li style="font-weight: bold;">
	  				Competitive
	  			</li>
	  			<li>
	  				IIT-JEE
	  			</li>
	  			<li>
	  				PET-MET
	  			</li>
	  			
	  		</ul>
	  	</div>
	  	<div class="clear"></div>
	  		
	  </div>
	<%@include file="footer.jsp" %>
      <!-- Main component for a primary marketing message or call to action -->
      

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>