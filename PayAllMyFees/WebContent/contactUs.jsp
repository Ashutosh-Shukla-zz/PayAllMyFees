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
			<table style="width: 100%; margin: 10px;">
				<tr>
					<td style="height: 34px">
						<div></div>
						<span style="font-size: 14pt"><strong>Get in touch with us</strong></span>
						<br>
						<ol>
							<li>
								<span>
									For any kind of assistance, you can
									contact at our centre.
								</span>
							</li>
							<li>
								<span>
									For any queries mail to 
								</span>
								<a href="help@payallmyfees.com">help@payallmyfees.com.</a>
							</li>
						</ol>
						<p></p>
					</td>
		
		
				</tr>
				<tr style="height: 40px"></tr>
				<tr>
					<td style="margin: 0in 0in 0pt">
						<p>
							<span><strong>PayAllMyFees Head Office</strong>:<br>
								PayAllMyFees Ltd,<br>Plot No. 85, Sector-1,<br>Ghansoli,
								Maharashtra - 400701,<br>India<br>Tel: 91-889-7889- 3000</span><span
								style="font-size: 12pt"></span>
						</p>
						<p>
							<span style="font-size: 12pt">www.payallmyfees.com</span>
						</p>
					</td>
				</tr>
			</table>
			<%@include file="footer.jsp" %>
		</div>
	</div>
</body>
</html>