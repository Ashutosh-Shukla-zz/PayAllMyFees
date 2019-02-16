<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<s:set var="userType" value="%{#session.loginInfo.userType}" />
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
	<div class="midcontent row clear container" role="main"
		style="margin-top: 10px;">

		<div class="page-header text-center" style="margin-top: 0px;">
			<h3>Invite a Friend</h3>
		</div>
		
		<form style="margin:0px auto;" role="search" action="invite-friend-action">
			<div class="form-group col-sm-4">
				<input type="email" class="form-control" name="inviteEmail" placeholder="Enter friends email-id ">
			</div>
			<button type="submit" class="btn btn-default">Invite</button>
		</form>
		<%@include file="footer.jsp"%>
	</div>
</div>
</body>
</html>