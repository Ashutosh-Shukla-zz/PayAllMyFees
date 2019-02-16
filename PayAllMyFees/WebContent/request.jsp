<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.Calendar" %>


<html>
<head>
<title>Elavon Payment Gateway redirect test</title>

<%!

/*

Pay and Shop Limited (www.realexpayments.com) - License Agreement.

© Copyright and zero Warranty Notice.
Merchants and their internet, call centre, and wireless application
developers (either in-house or externally appointed partners and
commercial organisations) may access Elavon Payment Gateway technical
references, application programming interfaces (APIs) and other sample
code and software ("Programs") either free of charge from
https://resourcecentre.elavonpaymentgateway.com
or by emailing support@elavonpaymentgateway.com. 

Pay and Shop Limited provides the programs "as is" without any warranty
of any kind, either expressed or implied, including, but not limited to,
the implied warranties of merchantability and fitness for a particular
purpose. The entire risk as to the quality and performance of the
programs is with the merchant and/or the application development company
involved. Should the programs prove defective, the merchant and/or the
application development company assumes the cost of all necessary
servicing, repair or correction.

Copyright remains with Pay and Shop Limited, and as such any copyright
notices in the code are not to be removed. The software is provided as
sample code to assist internet, wireless and call center application
development companies integrate with the Elavon Payment Gateway service.

Any Programs licensed by Pay and Shop Limited to merchants or developers
are licensed on a non-exclusive basis solely for the purpose of availing
of the Elavon Payment Gateway payment solution service in accordance with the
written instructions of an authorised representative of Pay and Shop Limited. 
Any other use is strictly prohibited.

Dated May 2013.



*/
    
public String getTimestamp() {
	String timestamp;
	Calendar now = Calendar.getInstance();
		
	timestamp = "" + now.get(Calendar.YEAR);

	if ((now.get(Calendar.MONTH) + 1) < 10) {
		timestamp += "0" + (now.get(Calendar.MONTH) + 1);
	} else {
		timestamp += "" + (now.get(Calendar.MONTH) + 1);
	}

	if (now.get(Calendar.DAY_OF_MONTH) < 10) {
		timestamp += "0" + now.get(Calendar.DAY_OF_MONTH);
	} else {
		timestamp += "" + now.get(Calendar.DAY_OF_MONTH);
	}

	if (now.get(Calendar.HOUR_OF_DAY) < 10) {
		timestamp += "0" + now.get(Calendar.HOUR_OF_DAY);
	} else {
		timestamp += "" + now.get(Calendar.HOUR_OF_DAY);
	}

	if (now.get(Calendar.MINUTE) < 10) {
		timestamp += "0" + now.get(Calendar.MINUTE);
	} else {
		timestamp += "" + now.get(Calendar.MINUTE);
	}

	if (now.get(Calendar.SECOND) < 10) {
		timestamp += "0" + now.get(Calendar.SECOND);
	} else {
		timestamp += "" + now.get(Calendar.SECOND);
	}
		
	return timestamp;
}


public String calcSHA1(String toBeHashed) {
	byte[] digestValue = new byte[0];	
   	StringBuffer sb = new StringBuffer();
	MessageDigest md;

	try {
		md = MessageDigest.getInstance("SHA");
		md.update(toBeHashed.getBytes());
		digestValue = md.digest();

   		for (int i = 0; i < digestValue.length; i++) {
       		String c = Integer.toHexString(digestValue[i]);
       		if (digestValue[i] < 0) c = c.substring(6);
       		if (c.length() < 2) c = "0" + c;
       		sb.append(c);
    	}

	} catch (Exception e) { e.printStackTrace(); }
	
	return sb.toString();
}

%>
<%

// -------------------------------------------------------------
// Replace these with the values you receive from Elavon Payment Gateway support
String merchantid = "yourMerchantId";
String secret = "your shared secret";
String timestamp = getTimestamp();
// ---------------------------------------------
// Replace these with the values you want to use
String orderid = "Order" + timestamp;
String curr = "EUR";
String amount = "3000";

// --------------------------------------------------------------

String testString = timestamp + "." + merchantid + "." + orderid + "." + 
	amount + "." + curr;
String testStringHashed = calcSHA1(testString);
testString = testStringHashed + "." + secret;
testStringHashed = calcSHA1(testString);

String sha1hash = testStringHashed;

%>
	
</head>

<body bgcolor="#FFFFFF">

<form action="https://redirect.elavonpaymentgateway.com/epage.cgi" method=post>

<input type=hidden name="MERCHANT_ID" value="<%=merchantid%>">
<input type=hidden name="ORDER_ID" value="<%=orderid%>">
<input type=hidden name="CURRENCY" value="<%=curr%>">
<input type=hidden name="AMOUNT" value="<%=amount%>">
<input type=hidden name="TIMESTAMP" value="<%=timestamp%>">
<input type=hidden name="SHA1HASH" value="<%=sha1hash%>">
<input type=hidden name="AUTO_SETTLE_FLAG" value="1">

<input type=submit value="Proceed to secure server">
</form>

<font face=verdana>
<font size=3><b>JSP Sample - Elavon Payment Gateway epage redirect</b></font>
<p>
<font size=2>Select View/Source to see the output
<ul>
<li>In the example I use the date/time as the order id - you may have your own scheme.
<li>You should replace <code>merchantid</code> and <code>secret</code> with the values provided by Elavon Payment Gateway support.
</ul>
</font>

</body>
</html>



