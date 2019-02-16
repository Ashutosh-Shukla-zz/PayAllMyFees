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

<div class="container">
	<div class="midsection">
		<h2>
			PayAllMyFess - That ease your fees management !		</h2>
	<p></p>
	<h3>What we do?</h3>
	<ol>
	<li><strong>Manage student careers. </strong> - We manage student careers on our portal.</li>
	<li><strong>Manage student courses </strong> - We manage student courses on our portal.</li>
	<li><strong>Management of All your fees  </strong> - We manage student fees on our portal.</li>
	<li><strong>Management of results </strong> - We allow institutions to publish results.</li>
	</ol>
	
	
	<p style="font-style: italic;font-weight: bold;float:right; ">"Thanks for your support." - Satya, CEO PayAllMyfees</p>
	<br/>
	<br/>
	<%@include file="footer.jsp" %>
	</div>
</div>
</body>
</html>