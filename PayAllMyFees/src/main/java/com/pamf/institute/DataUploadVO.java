package com.pamf.institute;

import java.util.Date;

public class DataUploadVO {
	
	private int instituteID;
	private int studentID;
	private int instituteClassDivisionMapID;
	private String className;
	private String div;
	private String guardianName;
	private int guardianPhoneNumber;
	private String firstName;
	private String lastName;
	private String generalRegisterNumber;
	private Date dateOfBirth;
	private String studentEmail;
	private Double feesAmountDue;
	private String feesPaid;
	private Double lateFeesAmount;
	private Date dateDue;
	public int getInstituteID() {
		return instituteID;
	}
	public void setInstituteID(int instituteID) {
		this.instituteID = instituteID;
	}
	
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public int getInstituteClassDivisionMapID() {
		return instituteClassDivisionMapID;
	}
	public void setInstituteClassDivisionMapID(int instituteClassDivisionMapID) {
		this.instituteClassDivisionMapID = instituteClassDivisionMapID;
	}
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
	public String getGuardianName() {
		return guardianName;
	}
	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}
	public int getGuardianPhoneNumber() {
		return guardianPhoneNumber;
	}
	public void setGuardianPhoneNumber(int guardianPhoneNumber) {
		this.guardianPhoneNumber = guardianPhoneNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGeneralRegisterNumber() {
		return generalRegisterNumber;
	}
	public void setGeneralRegisterNumber(String generalRegisterNumber) {
		this.generalRegisterNumber = generalRegisterNumber;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public Double getFeesAmountDue() {
		return feesAmountDue;
	}
	public void setFeesAmountDue(Double feesAmountDue) {
		this.feesAmountDue = feesAmountDue;
	}
	public String getFeesPaid() {
		return feesPaid;
	}
	public void setFeesPaid(String feesPaid) {
		this.feesPaid = feesPaid;
	}
	public Double getLateFeesAmount() {
		return lateFeesAmount;
	}
	public void setLateFeesAmount(Double lateFeesAmount) {
		this.lateFeesAmount = lateFeesAmount;
	}
	public Date getDateDue() {
		return dateDue;
	}
	public void setDateDue(Date dateDue) {
		this.dateDue = dateDue;
	}
	
	
}

