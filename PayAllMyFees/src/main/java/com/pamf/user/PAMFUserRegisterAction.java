package com.pamf.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.pamf.util.PAMFBaseAction;
import com.pamf.util.PAMFUtilities;

public class PAMFUserRegisterAction extends PAMFBaseAction {
	private static final long serialVersionUID = -8306050764144489102L;

	private static final Logger logger = Logger
			.getLogger(PAMFUserRegisterAction.class);

	public PAMFUserRegisterBean registration = new PAMFUserRegisterBean();

	public int selectedRegionID = -1;

	public BigInteger contactNo = null;

	public Date selectedDOB = null;

	public int selectedInstitute = -1;

	public int pageRefresh = 0;

	public int clearStudent = -1;

	public List<PAMFStudentBean> studentBeans = null;

	public List<PAMFStudentBean> getStudentBeans() {
		return studentBeans;
	}

	public void setStudentBeans(List<PAMFStudentBean> studentBeans) {
		this.studentBeans = studentBeans;
	}

	public int getSelectedRegionID() {
		return selectedRegionID;
	}

	public void setSelectedRegionID(int selectedRegionID) {
		this.selectedRegionID = selectedRegionID;
	}

	public BigInteger getContactNo() {
		return contactNo;
	}

	public void setContactNo(BigInteger contactNo) {
		this.contactNo = contactNo;
	}

	public Date getSelectedDOB() {
		return selectedDOB;
	}

	public void setSelectedDOB(Date selectedDOB) {
		this.selectedDOB = selectedDOB;
	}

	public int getSelectedInstitute() {
		return selectedInstitute;
	}

	public void setSelectedInstitute(int selectedInstitute) {
		this.selectedInstitute = selectedInstitute;
	}

	public PAMFUserRegisterBean getRegistration() {
		return registration;
	}

	public void setRegistration(PAMFUserRegisterBean registration) {
		this.registration = registration;
	}

	public int getPageRefresh() {
		return pageRefresh;
	}

	public void setPageRefresh(int pageRefresh) {
		this.pageRefresh = pageRefresh;
	}

	public int getClearStudent() {
		return clearStudent;
	}

	public void setClearStudent(int clearStudent) {
		this.clearStudent = clearStudent;
	}

	public String fetchInstitutes() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException ioE) {
			logger.error(
					"Fetching Institutes : error while getting Writer object from response",
					ioE);
		}
		if (selectedRegionID != -1) {
			TreeMap<String, Integer> institutes = new PAMFUserRegisterModel()
					.fetchInstitutesByRegion(selectedRegionID);

			StringBuilder instituteSelectBox = new StringBuilder();
			instituteSelectBox.append("<option value=\"-1\">Select</option>");

			Iterator<String> instNameIter = institutes.keySet().iterator();
			while (instNameIter.hasNext()) {
				String instName = instNameIter.next();
				int instituteId = institutes.get(instName);
				instituteSelectBox.append("<option value=\"")
						.append(instituteId).append("\">").append(instName)
						.append("</option>");
				instituteSelectBox.append("\n");
			}
			out.print(instituteSelectBox.toString());
			out.flush();
			out.close();
			return SUCCESS;
		} else {
			logger.error("com.pamf.user.PAMFUserRegisterAction.fetchInstitutes() : Error fetching Institutes for SelectedRegion = "
					+ selectedRegionID);
			return ERROR;
		}
	}

	public String searchStudentsByParams() {
		Map<String, Object> session = ActionContext.getContext().getSession();

		if (getPageRefresh() == 1) {
			session.put("studentList", null);
		}
		@SuppressWarnings("unchecked")
		Set<Integer> studentList = (Set<Integer>) session.get("studentList");

		if (studentList == null) {
			studentList = new HashSet<Integer>();
		}

		HttpServletResponse response = ServletActionContext.getResponse();
		PAMFUserRegisterModel userRegModel = new PAMFUserRegisterModel();

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException ioE) {
			logger.error(
					"Fetching Institutes : error while getting Writer object from response",
					ioE);
		}

		BigInteger contactNo = getContactNo();
		int instituteId = getSelectedInstitute();
		Date dateOfBirth = getSelectedDOB();

		String stateName = "";

		studentBeans = userRegModel.searchStudentsByParams(contactNo,
				instituteId, dateOfBirth);

		if (!studentBeans.isEmpty()) {
			stateName = userRegModel
					.fetchRegionNameByRegionId(selectedRegionID);
		} else {
			// Student Not Found
			String ajaxResp = "NOTFOUND";
			out.print(ajaxResp);
			out.flush();
			out.close();
			return SUCCESS;
		}

		StringBuilder ajaxResponse = new StringBuilder();

		for (PAMFStudentBean student : studentBeans) {
			if (!studentList.contains(student.getStudentId())) {
				studentList.add(student.getStudentId());

				int studentId = student.getStudentId();
				String studentName = student.getFirstName() + "&nbsp;"
						+ student.getLastName();
				String dob = PAMFUtilities.convertDateToString(student
						.getDateOfBirth());
				String guardianNo = student.getContactNo().toString();
				String institutionName = student.getInstituteBean()
						.getInstituteName();

				ajaxResponse.append(getSearchAJAXStudentDiv(studentId,
						studentName, dob, guardianNo, institutionName,
						stateName));
			} else {
				ajaxResponse.append("DUPLICATE");
			}
		}
		session.put("studentList", studentList);

		out.print(ajaxResponse.toString());
		out.flush();
		out.close();

		return SUCCESS;
	}

	public String clearStudent() {
		Map<String, Object> session = ActionContext.getContext().getSession();

		@SuppressWarnings("unchecked")
		Set<Integer> studentList = (Set<Integer>) session.get("studentList");

		if (studentList != null) {
			studentList.remove(getClearStudent());
		}
		return SUCCESS;
	}

	public String completeRegistration() {
		PAMFUserRegisterModel regModel = new PAMFUserRegisterModel();

		String encryptPwd = PAMFUtilities.encrypt(registration.getPassword());
		if (encryptPwd != null) {
			registration.setPassword(encryptPwd);
		}

		// userType = 2 for normal user
		regModel.completeRegistration(registration, 2);

		// clear studentList
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("studentList", null);

		return SUCCESS;
	}

	public String getSearchAJAXStudentDiv(int studentId, String name,
			String dob, String guardianNo, String institutionName, String state) {
		StringBuilder buildResp = new StringBuilder();
		buildResp
				.append("<div class='alert alert-info alert-dismissible pmf_student_add_reg row' role='alert'>");
		buildResp
				.append("    <a href='#' class='close' data-dismiss='alert' aria-label='Close' onclick='closeAlert(");
		buildResp.append(studentId + ")'>");
		buildResp.append("        <span aria-hidden='true'>&times;</span>");
		buildResp.append("    </a>");
		buildResp
				.append("    <input type='hidden' name='registration.studentIdInList' value='"
						+ studentId + "'/>");
		buildResp.append("    <div class='col-xs-6'>");
		buildResp.append("        <div>");
		buildResp.append("            <span class='col-xs-12 control-label'>");
		buildResp.append("                <strong>" + name + "</strong>");
		buildResp.append("            </span>");
		buildResp.append("        </div>");
		buildResp.append("        <div>");
		buildResp
				.append("            <span class='col-md-6 control-label'>Date Of Birth:</span>");
		buildResp.append("            <span class='col-md-6 control-label'>"
				+ dob + "</span>");
		buildResp.append("        </div>");
		buildResp.append("        <div>");
		buildResp
				.append("            <span class='col-md-6 control-label'>Guardian No.:</span>");
		buildResp.append("            <span class='col-md-6 control-label'>"
				+ guardianNo + "</span>");
		buildResp.append("        </div>");
		buildResp.append("    </div>");
		buildResp.append("    <div class='col-xs-6'>");
		buildResp.append("        <div>");
		buildResp.append("            <span class='col-xs-12 control-label'>");
		buildResp.append("            </span>");
		buildResp.append("        </div>");
		buildResp.append("        <div>");
		buildResp
				.append("            <span class='col-md-6 control-label'>Institution:</span>");
		buildResp.append("            <span class='col-md-6 control-label'>"
				+ institutionName + "</span>");
		buildResp.append("        </div>");
		buildResp.append("        <div>");
		buildResp
				.append("            <span class='col-md-6 control-label'>State:</span>");
		buildResp.append("            <span class='col-md-6 control-label'>"
				+ state + "</span>");
		buildResp.append("        </div>");
		buildResp.append("    </div>");
		buildResp.append("</div>");

		String ajaxResponse = buildResp.toString();

		return ajaxResponse;
	}

}
