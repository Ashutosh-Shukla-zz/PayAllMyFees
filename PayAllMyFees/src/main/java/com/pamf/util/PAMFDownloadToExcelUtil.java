package com.pamf.util;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.pamf.institute.InstituteAction;
import com.pamf.user.PAMFStudentBean;

public class PAMFDownloadToExcelUtil {

	static Map<String, XSSFCellStyle> styleMap;

	public void downloadExcel(ArrayList<PAMFStudentBean> studentList,
			int instituteID) {
		XSSFWorkbook wb;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();

			XSSFWorkbook workbook = new XSSFWorkbook();
			styleMap = createStyles(workbook);
			XSSFSheet sheet = workbook.createSheet("PAMF Student Data");
			XSSFRow row = null;
			XSSFCell cell = null;
			PAMFStudentBean student = null;

			row = sheet.createRow(0);
			cell = createCell(row, 13, false);
			cell.setCellValue("PAMF Institute ID");
			cell = createCell(row, 14, false);
			cell.setCellValue("Student ID");
			cell = createCell(row, 15, false);
			cell.setCellValue("Institute Class Division Map ID	");
			cell = createCell(row, 0, false);
			cell.setCellValue("Class");
			cell = createCell(row, 1, false);
			cell.setCellValue("Div");
			cell = createCell(row, 2, false);
			cell.setCellValue("Guardian Name");
			cell = createCell(row, 3, false);
			cell.setCellValue("Guardian Phone Number");
			cell = createCell(row, 4, false);
			cell.setCellValue("First Name");
			cell = createCell(row, 5, false);
			cell.setCellValue("Last Name");
			cell = createCell(row, 6, false);
			cell.setCellValue("General Register Number");
			cell = createCell(row, 7, false);
			cell.setCellValue("Date Of Birth");
			cell = createCell(row, 8, false);
			cell.setCellValue("Student Email");
			cell = createCell(row, 9, false);
			cell.setCellValue("Fees Amount Due");
			cell = createCell(row, 10, false);
			cell.setCellValue("Fees Paid");
			cell = createCell(row, 11, false);
			cell.setCellValue("Late Fees Amount");
			cell = createCell(row, 12, false);
			cell.setCellValue("Date Due");

			for (int index = 0; index < studentList.size(); index++) {

				student = studentList.get(index);
				row = sheet.createRow(index + 1);

				cell = createCell(row, 13, true); // PAMF Institute ID
				cell.setCellValue(student.getInstituteBean().getInstituteId());

				cell = createCell(row, 14, true); // Student ID
				cell.setCellValue(student.getStudentId());

				cell = createCell(row, 15, true);// Institute Class Division Map ID
				cell.setCellValue(student.getInstClassDivMapId());

				cell = createCell(row, 0, true);// Class
				cell.setCellValue(student.getStudentClass());

				cell = createCell(row, 1, true);// Div
				cell.setCellValue(student.getDiv());

				cell = createCell(row, 2, true);// Guardian Name
				cell.setCellValue(student.getGaurdianName());

				cell = createCell(row, 3, true);// Guardian Phone Number
				cell.setCellValue(1234556789);

				cell = createCell(row, 4, true);// First Name
				cell.setCellValue(student.getFirstName());

				cell = createCell(row, 5, true);// Last Name
				cell.setCellValue(student.getLastName());

				cell = createCell(row, 6, true);// General Register Number
				cell.setCellValue(student.getGeneralRegNo());

				cell = createCell(row, 7, true);// Date Of Birth
				cell.setCellValue(InstituteAction.formatter.format(student
						.getDateOfBirth()));

				cell = createCell(row, 8, true);// Student Email
				cell.setCellValue(student.getEmail());

				cell = createCell(row, 9, true);// Fees Amount Due
				cell.setCellValue(student.getFeeAmountDue());

				cell = createCell(row, 10, true);// Fees Paid
				cell.setCellValue(student.getFeePaid());

				cell = createCell(row, 11, true);// Late Fees Amount
				cell.setCellValue(student.getLateFeeAmount());

				cell = createCell(row, 12, true);// Date Due
				cell.setCellValue(student.getDueDate()!=null ? InstituteAction.formatter.format(student.getDueDate()): null);
			}
			
			sheet.setColumnHidden(13, true);
			sheet.setColumnHidden(14, true);
			sheet.setColumnHidden(15, true);
			
			for(int i= 2; i<=12; i++)
			sheet.autoSizeColumn(i);
			
			response.setHeader("Content-Disposition",
					"attachment; filename=Studernt Data.xlsx");
			ServletOutputStream out = response.getOutputStream();
			workbook.write(out);
			out.flush();
			out.close();

		} catch (Exception e) {
			System.err.println("Exception Download excel " + e);
		}
	}

	private static ArrayList getDataGrid(ArrayList dataKeys, HashMap rowData,
			int serialNo) {

		ArrayList datalist = new ArrayList();

		datalist.add(0, (new Integer(serialNo)).toString());

		Iterator headerListitr = dataKeys.iterator();
		String headerKey = null;
		int index = 1;
		while (headerListitr.hasNext()) {

			headerKey = (String) headerListitr.next();
			if (rowData.get(headerKey) != null) {
				String dataValue = replaceSpecialCharectarXML(rowData.get(
						headerKey).toString());
				String targetValue = dataValue.replaceAll(
						"&#60;[^&#62;]*&#62;", "");
				datalist.add(index, targetValue);
			} else {
				datalist.add(index, "");
			}
			index++;
		}

		return datalist;
	}

	private static Map<String, XSSFCellStyle> createStyles(XSSFWorkbook workbook) {
		Map<String, XSSFCellStyle> styleMap = new HashMap<String, XSSFCellStyle>();

		XSSFCellStyle headerStyle = workbook.createCellStyle();
		XSSFFont headerFont = workbook.createFont();
		// headerFont.setBold(true);
		// headerFont.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		headerFont.setFontName("CALIBRI");
		headerFont.setFontHeight(12);
		headerFont.setColor(new XSSFColor(new byte[] { (byte) -1, (byte) 255,
				(byte) 255, (byte) 255 }));
		headerStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		headerStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_BOTTOM);
		headerStyle.setFillForegroundColor(IndexedColors.GREY_40_PERCENT
				.getIndex());
		headerStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
		headerStyle.setFont(headerFont);
		headerStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		headerStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		headerStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		headerStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
		styleMap.put("headerStyle", headerStyle);

		XSSFCellStyle dataStyle = workbook.createCellStyle();
		XSSFFont dataFont = workbook.createFont();
		dataFont.setBold(false);
		dataFont.setFontName("CALIBRI");
		dataFont.setFontHeight(11);
		dataStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);
		dataStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_BOTTOM);
		dataStyle.setFont(dataFont);
		dataStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
		styleMap.put("dataStyle", dataStyle);

		XSSFCellStyle dataStyleGrey = workbook.createCellStyle();
		XSSFFont dataFontGrey = workbook.createFont();
		dataFontGrey.setBold(false);
		dataFontGrey.setFontName("ARIAL");
		dataFontGrey.setFontHeight(8);
		dataStyleGrey.setAlignment(XSSFCellStyle.ALIGN_LEFT);
		dataStyleGrey.setVerticalAlignment(XSSFCellStyle.VERTICAL_BOTTOM);
		dataStyleGrey.setFillForegroundColor(IndexedColors.GREY_25_PERCENT
				.getIndex());
		dataStyleGrey.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
		dataStyleGrey.setFont(dataFontGrey);
		dataStyleGrey.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		dataStyleGrey.setBorderTop(XSSFCellStyle.BORDER_THIN);
		dataStyleGrey.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		dataStyleGrey.setBorderRight(XSSFCellStyle.BORDER_THIN);
		styleMap.put("dataStyleGrey", dataStyleGrey);

		return styleMap;
	}

	public static class SpreadsheetWriter {
		private final Writer _out;
		private int _rownum;

		public SpreadsheetWriter(Writer out) {
			_out = out;
		}

		public void beginSheet() throws IOException {
			_out.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
					+ "<worksheet xmlns=\"http://schemas.openxmlformats.org/spreadsheetml/2006/main\">");
			_out.write("<sheetData>\n");
		}

		public void endSheet() throws IOException {
			_out.write("</sheetData>");
			_out.write("</worksheet>");
		}

		public void insertRow(int rownum) throws IOException {
			_out.write("<row r=\"" + (rownum + 1) + "\">\n");
			this._rownum = rownum;
		}

		public void endRow() throws IOException {
			_out.write("</row>\n");
		}

		public void createCell(int columnIndex, String value, int styleIndex)
				throws IOException {
			String ref = new CellReference(_rownum, columnIndex)
					.formatAsString();
			_out.write("<c r=\"" + ref + "\" t=\"inlineStr\"");
			if (styleIndex != -1) {
				_out.write(" s=\"" + styleIndex + "\"");
			}
			_out.write(">");
			_out.write("<is><t>" + value + "</t></is>");
			_out.write("</c>");
		}

		public void createCell(int columnIndex, String value)
				throws IOException {
			createCell(columnIndex, value, -1);
		}

		public void createCell(int columnIndex, double value, int styleIndex)
				throws IOException {
			String ref = new CellReference(_rownum, columnIndex)
					.formatAsString();
			_out.write("<c r=\"" + ref + "\" t=\"n\"");
			if (styleIndex != -1) {
				_out.write(" s=\"" + styleIndex + "\"");
			}
			_out.write(">");
			_out.write("<v>" + value + "</v>");
			_out.write("</c>");
		}

		public void createCell(int columnIndex, double value)
				throws IOException {
			createCell(columnIndex, value, -1);
		}

		public void createCell(int columnIndex, Calendar value, int styleIndex)
				throws IOException {
			createCell(columnIndex, DateUtil.getExcelDate(value, false),
					styleIndex);
		}
	}

	public static String replaceSpecialCharectarXML(String str) {

		str = str.replaceAll("<br>", "");

		/*
		 * str=FormatLib.replaceString(str,"&","&#38;");
		 * str=FormatLib.replaceString(str,">","&#62;");
		 * str=FormatLib.replaceString(str,"<","&#60;");
		 * str=FormatLib.replaceString(str,"'","&#39;");
		 * str=FormatLib.replaceString(str,"’","&#39;");
		 * str=FormatLib.replaceString(str,"–","&#38;");
		 * str=FormatLib.replaceString(str,"|","&#38;");
		 */

		/*
		 * str=stripNonValidXMLCharacters1(str);
		 * 
		 * String xml11pattern = "[^" + "\u0001-\uD7FF" + "\uE000-\uFFFD" +
		 * "\ud800\udc00-\udbff\udfff" + "]+";
		 * 
		 * String xml10pattern = "[^" + "\u0009\r\n" + "\u0020-\uD7FF" +
		 * "\uE000-\uFFFD" + "\ud800\udc00-\udbff\udfff" + "]";
		 * 
		 * str = str.replaceAll(xml10pattern, ""); str =
		 * str.replaceAll(xml11pattern, "");
		 */

		return str;

	}

	public static String stripNonValidXMLCharacters(String in) {
		StringBuffer out = new StringBuffer(); // Used to hold the output.
		char current; // Used to reference the current character.

		if (in == null || ("".equals(in)))
			return ""; // vacancy test.
		for (int i = 0; i < in.length(); i++) {
			current = in.charAt(i); // NOTE: No IndexOutOfBoundsException caught
									// here; it should not happen.
			if ((current == 0x9) || (current == 0xA) || (current == 0xD)
					|| ((current >= 0x20) && (current <= 0xD7FF))
					|| ((current >= 0xE000) && (current <= 0xFFFD))
					|| ((current >= 0x10000) && (current <= 0x10FFFF)))
				out.append(current);
		}
		return out.toString();
	}

	public static String stripNonValidXMLCharacters1(String text) {
		StringBuffer out = new StringBuffer(); // Used to hold the output.
		char current; // Used to reference the current character.

		if (null == text) {
			return text;
		}
		final int len = text.length();
		current = 0;
		int codePoint = 0;
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < len; i++) {
			current = text.charAt(i);
			boolean surrogate = false;
			if (Character.isHighSurrogate(current) && i + 1 < len
					&& Character.isLowSurrogate(text.charAt(i + 1))) {
				surrogate = true;
				codePoint = text.codePointAt(i++);
			} else {
				codePoint = current;
			}
			if ((codePoint == 0x9) || (codePoint == 0xA) || (codePoint == 0xD)
					|| ((codePoint >= 0x20) && (codePoint <= 0xD7FF))
					|| ((codePoint >= 0xE000) && (codePoint <= 0xFFFD))
					|| ((codePoint >= 0x10000) && (codePoint <= 0x10FFFF))) {
				sb.append(current);
				if (surrogate) {
					sb.append(text.charAt(i));
				}
			}
		}
		return out.toString();
	}

	private XSSFCell createCell(XSSFRow row, int x, boolean isDataGrid) {
		XSSFCell cell = row.createCell(x);
		if (isDataGrid)
			cell.setCellStyle(styleMap.get("dataStyle"));
		else
			cell.setCellStyle(styleMap.get("headerStyle"));
		return cell;
	}

}
