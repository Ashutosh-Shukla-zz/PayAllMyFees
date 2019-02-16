package com.pamf.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.Key;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.log4j.Logger;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class PAMFUtilities {

	private static Logger logger = Logger.getLogger(PAMFUtilities.class);

	private static String hifenDatePattern = "dd-MM-yyyy";

	private static String fileName = "PAMFEmailCredentials.properties";

	private static final String ALGO = "AES";
	// key length should be 16
	private static final String keyValue = "thsathyabent0512";

	public static String convertClobToString(Clob clob) {
		String clobstring = null;
		try {
			clobstring = clob.getSubString(1, (int) clob.length());
		} catch (SQLException sqlE) {
			logger.error("Error while converting Clob to String ", sqlE);
		}
		return clobstring;
	}

	public static Date convertJavaDateToSQLDate(java.util.Date javaDate) {
		long millis = javaDate.getTime();
		Date sqlDate = new Date(millis);
		return sqlDate;
	}

	public static java.util.Date convertSQLDateToJavaDate(Date sqlDate) {
		long millis = sqlDate.getTime();
		java.util.Date javaDate = new java.util.Date(millis);
		return javaDate;
	}

	/**
	 * DateString should be in dd-MM-yyyy format
	 * 
	 * @param dateString
	 * @return
	 */
	public static Date convertStringToJavaDate(String dateString) {
		SimpleDateFormat formatter = new SimpleDateFormat(hifenDatePattern);
		java.util.Date javaDate = null;
		try {
			javaDate = formatter.parse(dateString);
		} catch (ParseException pE) {
			logger.error("Error parsing String value to java.util.Date", pE);
		}
		return convertJavaDateToSQLDate(javaDate);
	}

	/**
	 * DateString returned will be in dd-MM-yyyy format
	 * 
	 * @param javaDate
	 * @return
	 */
	public static String convertDateToString(java.util.Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat(hifenDatePattern);
		String dateString = formatter.format(date);
		return dateString;
	}

	public static Properties readPropertyFile() {
		Properties prop = new Properties();
		try {
			InputStream in = Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("/" + fileName);

			if (in != null) {
				prop.load(in);
			}
		} catch (IOException ioE) {
			logger.error(
					"Error reading "
							+ fileName
							+ ". Please check if the file exists and it is loaded correctly in classpath.",
					ioE);
		}
		return prop;
	}

	public static Properties getGroupedProperties(String groupConstant) {
		Properties props = readPropertyFile();
		Set<Object> keys = props.keySet();
		ArrayList<String> groupConstantKeys = new ArrayList<String>();
		if (!keys.isEmpty()) {
			Iterator<Object> keyIterator = keys.iterator();
			while (keyIterator.hasNext()) {
				String key = (String) keyIterator.next();
				if (key.startsWith(groupConstant)) {
					groupConstantKeys.add(key);
				}
			}
		}
		Properties properties = new Properties();
		for (String key : groupConstantKeys) {
			properties.setProperty(key.replaceFirst(groupConstant + ".", ""),
					props.getProperty(key));
		}
		return properties;
	}

	public static String readHtmlFile(String groupConstant) {
		Properties props = PAMFUtilities.getGroupedProperties(groupConstant);
		String file = props.getProperty("email.body");
		String emailMessage = "";
		StringBuilder contentBuilder = new StringBuilder();
		try {
			InputStream in = (Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("/" + file));
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(in));
			String str;
			while ((str = reader.readLine()) != null) {
				contentBuilder.append(str);
			}
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		emailMessage = contentBuilder.toString();
		return emailMessage;
	}

	public static String encrypt(String Data) {
		Key key = null;
		try {
			key = generateKey();

			Cipher c = Cipher.getInstance(ALGO);
			c.init(Cipher.ENCRYPT_MODE, key);
			byte[] encVal = c.doFinal(Data.getBytes());
			String encryptedValue = new BASE64Encoder().encode(encVal);
			return encryptedValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static String decrypt(String encryptedData) {
		Key key;
		try {
			key = generateKey();

			Cipher c = Cipher.getInstance(ALGO);
			c.init(Cipher.DECRYPT_MODE, key);
			byte[] decordedValue = new BASE64Decoder()
					.decodeBuffer(encryptedData);
			byte[] decValue = c.doFinal(decordedValue);
			String decryptedValue = new String(decValue);
			return decryptedValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	private static Key generateKey() throws Exception {
		Key key1 = new SecretKeySpec(keyValue.getBytes(), ALGO);
		return key1;
	}
}
