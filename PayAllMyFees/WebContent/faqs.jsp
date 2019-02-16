<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
	
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

	<div class="container">
		<script src="js/jquery-1.11.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap.js"></script>

		<div class="midsection" style="margin-top: 0px;">
		<div class="col-lg-12" >
                <div class="page-header text-center" style="margin-top: 0px;">
				   <h3>On Line Fees Payment Steps
				   </h3>
				</div>
	<div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         You need  to register yourself as an User with payallmyfees.com by clicking on the New User Tab on the Home page of the Website.
    </div>
    <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           While registering please ensure you have provided the correct Institution Name, Date of Birth and Mobile number registered with the institution.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            You will be registered as an user only after matching the data provided with the data in our database, In case of mismatch of data registration will not be allowed.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Post registration and userid, password generation, you will be taken to the login page. After logging in you will be shown the student details.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           You can have multiple students in one institution, One student in Multiple Institutions and multiple students in Multiple Institutions under a single Login ID.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            Post Logging in you will be shown the details of all the students and Institutions under your id.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Select the student or Institution for which you have to make the Payment and click Pay Fees.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           You will be redirected to a secure payment page wherein you can fill in the amount/ check prefilled amount  and make payment through your debit card/credit card, Net Banking etc.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Select the mode of payment, Credit Card, Debit Card,Internet Banking etc.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Fill in the requisite card/Banking details. All details filled in here are encrypted and  secured.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Once all details of card, banking etc are filled,  click pay, your payment advise is received subject to your Card issuer/Bank approving the transaction.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            You will receive an SMS from payallmyfees Conforming receipt of payment with a unique Transaction Id.
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            Your School Fee Account  will be updated within the next 48 hours
    </div>
     <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           Your Transaction details are stored with a unique Transaction  Id
    </div>
    <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           You can revist your transaction details in history column in  your Account.
    </div>
    <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
           In Case of any queries you can call our dedicated Helpline 022 ____________or <a href="mailto:rcare@payallmyfees.com">rcare@payallmyfees.com</a>  with the unique id and your query.
    </div>
    <div class="clearfix pb-callout" style="margin-top:20px; margin-bottom:20px;"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            You will receive a revert  within 24 Hours.
    </div>
		
		<div class="alert alert-warning">
                                 <i>Note : Please ensure that you pay your fees atleast three days before the last date to avoid delay and
                           late payment charges.</i>
                            </div>
		
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