package com.pamf.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.pamf.institute.InstituteModel;
import com.pamf.login.PAMFLoginBean;
import com.pamf.util.PAMFUtilities;

public class PAMFAdminAction extends PAMFAdminActionBean {
	private static final long serialVersionUID = 2281130587890940295L;

	private static final Logger logger = Logger
			.getLogger(PAMFAdminAction.class);

	public String showAdminDashboard() {
		session = ActionContext.getContext().getSession();
		PAMFLoginBean pbean = (PAMFLoginBean) session.get("loginInfo");
		if (pbean == null) {
			return ERROR;
		}
		PAMFAdminModel adminmodel = new PAMFAdminModel();
		adminBean = adminmodel.getAdminBeanByLoginId(pbean);
		if (adminBean.getAdminId() != -1) {
			return SUCCESS;
		} else {
			logger.error("Could not find Administrator using login id");
			return ERROR;
		}
	}

	public String showInstituteDetail() {
		try {
			int instituteId = Integer.parseInt(this.instituteId);
			PAMFAdminModel model = new PAMFAdminModel();
			institute = model.getInstituteByID(instituteId);
			studentsList = new InstituteModel().getStudentBeanListByInstituteId(institute.getUserCrdntId(), null,null);
		} catch (NumberFormatException nfe) {
			logger.error("NumberFormatException while parsing institute id",
					nfe);
			return ERROR;
		}
		if (institute == null) {
			logger.error("Institute object returned null when searching Institute via institute id");
			return ERROR;
		}
		return SUCCESS;
	}

	public String showAddInstitute() {
		Map<String, Object> session = ActionContext.getContext().getSession();

		if (null != session.get("studentIdWithNumber")) {
			session.remove("studentIdWithNumber");
		}
		stateList = new PAMFAdminModel().fetchStates();
		return SUCCESS;
	}

	public String fetchCities() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error("IOException while fetching cities", e);
			// TODO: Remove stack trace
			e.printStackTrace();
		}
		if (selectedState != null) {
			TreeMap<String, Integer> cities = new PAMFAdminModel()
					.fetchCitiesByState(selectedState);
			StringBuilder citiesSelectBox = new StringBuilder();
			Set<String> citySet = cities.keySet();

			Iterator<String> cityIter = citySet.iterator();
			while (cityIter.hasNext()) {
				String city = cityIter.next();
				int regionId = cities.get(city);
				citiesSelectBox.append("<option value=\"").append(regionId)
						.append("\">").append(city).append("</option>");
				citiesSelectBox.append("\n");
			}
			out.print(citiesSelectBox.toString());
			out.flush();
			out.close();
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public String checkUsername() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error("IOException while checking Username", e);
			// TODO: Remove stack trace
			e.printStackTrace();
		}

		int flag = new PAMFAdminModel().checkUsername(username);
		if (flag == 1) {
			out.print("User Exists");
			out.flush();
			out.close();
			return SUCCESS;
		} else {
			out.print("");
			out.flush();
			out.close();
			return SUCCESS;
		}
	}

	public String insertInstitute() {
		String encryptPwd = PAMFUtilities.encrypt(this.password);
		if (encryptPwd != null) {
			this.password = encryptPwd;
		}
		String status = new PAMFAdminModel().insertInstitute(this.institute,
				this.username, this.password);
		return status;
	}

	public String changeInstitutionStatus() {
		int instituteId = getInstitute().getInstituteId();
		int isActive = getInstitute().isActive();
		int flag = new PAMFAdminModel().changeInstitutionStatus(instituteId,
				isActive);

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error("IOException while checking Username", e);
			// TODO: Remove stack trace
			e.printStackTrace();
		}
		if (flag == 1) {
			out.print(isActive);
			out.flush();
			out.close();
			return SUCCESS;
		} else {
			isActive = isActive == 1 ? 0 : 1;
			out.print(isActive);
			out.flush();
			out.close();
			return SUCCESS;
		}
	}

}
