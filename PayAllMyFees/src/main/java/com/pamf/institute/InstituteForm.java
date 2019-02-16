package com.pamf.institute;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class InstituteForm  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private File file;
	private String fileName;
	private HashMap<String, List<String>>  classDivCombo;
	private String className;
	private String div;
	private ArrayList<String> classList;
	private ArrayList<String>  divList = new ArrayList<String>();
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public HashMap getClassDivCombo() {
		return classDivCombo;
	}
	public void setClassDivCombo(HashMap classDivCombo) {
		this.classDivCombo = classDivCombo;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public ArrayList<String> getClassList() {
		return classList;
	}
	public void setClassList(ArrayList<String> classList) {
		this.classList = classList;
	}
	public ArrayList<String>  getDivList() {
		return divList;
	}
	public void setDivList(ArrayList<String>  divList) {
		this.divList = divList;
	}
	
	
	
	
	

}
