<%@ page import="java.security.MessageDigest" %>
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
of the Elavon Payment Gateway solution service in accordance with the
written instructions of an authorised representative of Pay and Shop Limited. 
Any other use is strictly prohibited.

Dated May 2013.


*/


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

// Get form fields passed in from the form submission 
String timestamp = request.getParameter("TIMESTAMP"); 
String merchantid = request.getParameter("MERCHANT_ID"); 
String result = request.getParameter("RESULT"); 
String order_id = request.getParameter("ORDER_ID"); 
String message = request.getParameter("MESSAGE"); 
String authcode = request.getParameter("AUTHCODE"); 
String pasref = request.getParameter("PASREF"); 
String sha1hash = request.getParameter("SHA1HASH"); 

// everything else  you sent through us (like the customer's email and address
// etc is also available here - so you can do something like this:
//
// String email = request.getParameter("cust-email"); 
// String address1 = request.getParameter("cust-address1"); 
//
// or whatever....

// Now update your database or send an email or whatever you need to do....
// .....


// check the hash is ok - this ensures that the reply came from Elavon Payment Gateway
String secret = "secret";

String testString = timestamp + "." + merchantid + "." + order_id + "." + 
	result + "." + message + "." + pasref + "." + authcode;
String testStringHashed = calcSHA1(testString);
testString = testStringHashed + "." + secret;
testStringHashed = calcSHA1(testString);



if (sha1hash.compareTo(testStringHashed) != 0) {
// the hashes don't match. Bad thing.
%>
There has been an error validating the response from our payment provider. 
Please contact us on 01 xxxxxx to obtain the status of your order.
<%
// you should probably send an email to a technical person here. Or an admin 
// type person. Then check with us.

} else {
// the hashes were ok - the response came from Elavon Payment Gateway
	


if (result.compareTo("00") == 0) {
// the payment succeeded.
%> 

Thank You - Your payment has been accepted. If you have any enquiries 
about the order please use this order number: <br>
<%=order_id %>
<br><br>
To continue please <a href="http://yourdomain.com">click here</a>






<%
} else {
// there was a problem processing the payment. Generally it's not 
// recommended that you say what the problem was - just say there's
// been a problem and give them a customer services number or email to contact.

%>
We're sorry - there has been a problem processing your order. Please call
01 xxxxxx and quote your order number as: <%=order_id %>
<br>
Your credit card has not been charged. To continue browsing please 
<a href="http://yourdomain.com">click here</a>





<%
} // end of the result if-else

} // end of the hashes if-else

%>


