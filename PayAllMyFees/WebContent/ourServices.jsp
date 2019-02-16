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
		<div class="midsection">
			<h2>
				PayAllMyFess - Our Services !		</h2>
		<p></p>
		<h3>Why choose PayAllMyFess as your Partner?</h3>
		<ol>
		<li><strong>For Students </strong>
		
		<ol>
		<li><strong>Pay All your fees. </strong></li>
		<li><strong>Know about courses. </strong></li>
		<li><strong>Know about careers.</strong></li>
		<li><strong>Any education/career related query. </strong></li>
		</ol>
		</li>
		<li><strong>For Institutions </strong>
		
		<ol>
		<li><strong>Collect All your fees. </strong></li>
		<li><strong>Publish results. </strong></li>
		<li><strong>Publish message to Students.</strong></li>
		<li><strong>Database management. </strong></li>
		</ol>
		</li>
		</ol>
		
		
		<p style="font-style: italic;font-weight: bold;float:right; ">"Thanks for your support." - Satya, CEO PayAllMyfees</p>
		<br/>
		<br/>
		<%@include file="footer.jsp" %>
		</div>
	</div>
</body>
</html>