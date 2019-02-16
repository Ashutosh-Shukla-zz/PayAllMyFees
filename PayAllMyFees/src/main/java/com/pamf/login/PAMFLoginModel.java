package com.pamf.login;

import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.pamf.util.PAMFEmailUtility;
import com.pamf.util.PAMFUtilities;

public class PAMFLoginModel {
	private static final String ALPHA_CAPS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private static final String ALPHA = "abcdefghijklmnopqrstuvwxyz";
	private static final String NUM = "0123456789";
	private static final String SPL_CHARS = "!@#$%^&*_=+-/";
	private int noOfCAPSAlpha = 1;
	private int noOfDigits = 1;
	private int noOfSplChars = 0;
	private int minLen = 6;
	private int maxLen = 8;
	PAMFForgotPasswordDAO pdaoPassword = new PAMFForgotPasswordDAO();

	public PAMFLoginBean checkUser(PAMFLoginBean loginbean) {
		PAMFLoginDAO pdao = new PAMFLoginDAO();
		return pdao.validateUser(loginbean);
	}

	public PAMFLoginBean checkUserPasswordRecovery(PAMFLoginBean loginbean) {
		return pdaoPassword.validateUser(loginbean);
	}

	/**
	 * To send Email
	 * 
	 * @param loginCredentials
	 */
	public String sendEmail(PAMFLoginBean loginCredentials) /*
															 * throws
															 * AddressException,
															 * MessagingException
															 */{
		final PAMFLoginBean loginCredentials1 = loginCredentials;
		final char[] pswd = generatePswd(minLen, maxLen, noOfCAPSAlpha,
				noOfDigits, noOfSplChars);
		final String password = new String(pswd);
		String encryptedPwd = password;
		if (PAMFUtilities.encrypt(password) != null) {
			encryptedPwd = PAMFUtilities.encrypt(password);
		}
		loginCredentials.setPassword(encryptedPwd);

		String updateResult = "error";
		updateResult = pdaoPassword.updatePassword(loginCredentials);
		if (updateResult.equalsIgnoreCase("success")) {
			Properties props = PAMFUtilities.getGroupedProperties("forgot");
			String address = props.getProperty("password.link");

			String emailMessage = PAMFUtilities.readHtmlFile("forgot");
			if (emailMessage.contains("%un")) {
				emailMessage = emailMessage.replaceAll("%un",
						loginCredentials.getUsername());
			}
			if (emailMessage.contains("%pw")) {
				emailMessage = emailMessage.replaceAll("%pw", password);
			}
			if (emailMessage.contains("%add")) {
				emailMessage = emailMessage.replaceAll("%add", address);
			}
			final String message = emailMessage;
			new Thread(new Runnable() {
				public void run() {
					try {
						PAMFEmailUtility.sendEmail(
								loginCredentials1.getEmailId(),
								"Password Recovery", message, "forgot");
					} catch (AddressException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {

					}
				}
			}).start();
			return "success";
		}
		return "error";

	}

	/**
	 * To generate random password
	 * 
	 * @param minLen
	 * @param maxLen
	 * @param noOfCAPSAlpha
	 * @param noOfDigits
	 * @param noOfSplChars
	 * @return
	 */
	public static char[] generatePswd(int minLen, int maxLen,
			int noOfCAPSAlpha, int noOfDigits, int noOfSplChars) {
		if (minLen > maxLen)
			throw new IllegalArgumentException("Min. Length > Max. Length!");
		if ((noOfCAPSAlpha + noOfDigits + noOfSplChars) > minLen)
			throw new IllegalArgumentException(
					"Min. Length should be atleast sum of (CAPS, DIGITS, SPL CHARS) Length!");
		Random rnd = new Random();
		int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
		char[] pswd = new char[len];
		int index = 0;
		for (int i = 0; i < noOfCAPSAlpha; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
		}
		for (int i = 0; i < noOfDigits; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
		}
		for (int i = 0; i < noOfSplChars; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
		}
		for (int i = 0; i < len; i++) {
			if (pswd[i] == 0) {
				pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
			}
		}
		return pswd;
	}

	/**
	 * 
	 * @param rnd
	 * @param len
	 * @param pswd
	 * @return
	 */
	private static int getNextIndex(Random rnd, int len, char[] pswd) {
		int index = rnd.nextInt(len);
		while (pswd[index = rnd.nextInt(len)] != 0)
			;
		return index;
	}
}
