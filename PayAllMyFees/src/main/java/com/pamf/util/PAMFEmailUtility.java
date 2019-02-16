package com.pamf.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class PAMFEmailUtility {

	public static Properties prop = new Properties();

	static String host = prop.getProperty("mail.smtp.host");

	static String port = prop.getProperty("mail.smtp.port");;

	static String userName = prop.getProperty("mail.smtp.user");;

	static String password = prop.getProperty("mail.smtp.password");

	public static void sendEmail(String toAddress, String subject,
			String message, String credConstant) throws AddressException,
			MessagingException {

		prop = PAMFUtilities.getGroupedProperties(credConstant);
		String host = prop.getProperty("mail.smtp.host");
		String port = prop.getProperty("mail.smtp.port");
		final String userName = prop.getProperty("mail.smtp.user");
		final String password = prop.getProperty("mail.smtp.password");

		// sets SMTP server properties
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "false");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);

		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setContent(message, "text/html");
		MimeMultipart multipart = new MimeMultipart();
		multipart.addBodyPart(mbp);

		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());

		msg.setContent(multipart);

		// sends the e-mail
		Transport.send(msg);

	}
}
