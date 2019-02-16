package com.pamf.notifications;

import java.util.ArrayList;

public class PAMFClass {

	private ArrayList<String> Division=null;
	private String classId =null;
	public ArrayList<String> getDivision() {
		return Division;
	}

	public void setDivision(ArrayList<String> division) {
		Division = division;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
}
