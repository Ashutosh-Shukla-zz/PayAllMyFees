package com.pamf.institute;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pamf.user.PAMFStudentBean;

public class InstituteModel {
	
	public HashMap<String, List<String>> getDashboardCombo(int instituteCredentialId){
		InstituteDAO dao = new InstituteDAO();
		return dao.getDashboardCombo(instituteCredentialId);
		
	} 
 
	public ArrayList<PAMFStudentBean> getStudentBeanListByInstituteId(int instituteCredentialId, String className, String division){
	    InstituteDAO dao = new InstituteDAO();
        return dao.getStudentBeanListByInstituteId(instituteCredentialId, className, division);
	}
	
	public void insertData(ArrayList<DataUploadVO > al){
		InstituteDAO dao = new InstituteDAO();
		 dao.uploadData(al);
		
	} 
	
	public ArrayList<String> fetchClasses(int instituteID){
		InstituteDAO dao = new InstituteDAO();
		return dao.fetchClasses(instituteID);
	}
	
	public ArrayList<String>  fetchDivisions(int instituteID, String className){
		InstituteDAO dao = new InstituteDAO();
		return dao.fetchDivisions(instituteID, className);
	}
}
