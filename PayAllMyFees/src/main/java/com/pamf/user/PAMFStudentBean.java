package com.pamf.user;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

public class PAMFStudentBean implements Serializable
{

    private static final long serialVersionUID = 4225386073955654324L;

    private int studentId = -1;

    private int instId = -1;

    private int instClassDivMapId = -1;

    private String StudentClass = null;

    private String Div = null;

    private String GaurdianName = null;

    private BigInteger contactNo = null;

    private String FirstName = null;

    private String LastName = null;

    private int generalRegNo = -1;

    private Date dateOfBirth = null;

    private String Email = null;

    private float feeAmountDue = -1;

    private String FeePaid = null;

    private float lateFeeAmount = -1;

    private Date dueDate = null;

    private PAMFInstituteBean instituteBean = null;

    public PAMFStudentBean()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PAMFInstituteBean getInstituteBean()
    {
        return instituteBean;
    }

    public void setInstituteBean(PAMFInstituteBean instituteBean)
    {
        this.instituteBean = instituteBean;
    }

    public String getStudentClass()
    {
        return StudentClass;
    }

    public void setStudentClass(String class1)
    {
        StudentClass = class1;
    }

    public String getDiv()
    {
        return Div;
    }

    public void setDiv(String div)
    {
        Div = div;
    }

    public PAMFStudentBean(int studentId, int instId, int instClassDivMapId, String class1, String div,
            String gaurdianName, BigInteger contactNo, String firstName, String lastName, int generalRegNo,
            Date dateOfBirth, String email, float feeAmountDue, String feePaid, float lateFeeAmount, Date dueDate,
            PAMFInstituteBean instituteBean)
    {
        super();
        this.studentId = studentId;
        this.instId = instId;
        this.instClassDivMapId = instClassDivMapId;
        StudentClass = class1;
        Div = div;
        GaurdianName = gaurdianName;
        this.contactNo = contactNo;
        FirstName = firstName;
        LastName = lastName;
        this.generalRegNo = generalRegNo;
        this.dateOfBirth = dateOfBirth;
        Email = email;
        this.feeAmountDue = feeAmountDue;
        FeePaid = feePaid;
        this.lateFeeAmount = lateFeeAmount;
        this.dueDate = dueDate;
        this.instituteBean = instituteBean;
    }

    public int getStudentId()
    {
        return studentId;
    }

    public void setStudentId(int studentId)
    {
        this.studentId = studentId;
    }

    public int getInstId()
    {
        return instId;
    }

    public void setInstId(int instId)
    {
        this.instId = instId;
    }

    public int getInstClassDivMapId()
    {
        return instClassDivMapId;
    }

    public void setInstClassDivMapId(int instClassDivMapId)
    {
        this.instClassDivMapId = instClassDivMapId;
    }

    public String getGaurdianName()
    {
        return GaurdianName;
    }

    public void setGaurdianName(String gaurdianName)
    {
        GaurdianName = gaurdianName;
    }

    public BigInteger getContactNo()
    {
        return contactNo;
    }

    public void setContactNo(BigInteger contactNo)
    {
        this.contactNo = contactNo;
    }

    public String getFirstName()
    {
        return FirstName;
    }

    public void setFirstName(String firstName)
    {
        FirstName = firstName;
    }

    public String getLastName()
    {
        return LastName;
    }

    public void setLastName(String lastName)
    {
        LastName = lastName;
    }

    public int getGeneralRegNo()
    {
        return generalRegNo;
    }

    public void setGeneralRegNo(int generalRegNo)
    {
        this.generalRegNo = generalRegNo;
    }

    public Date getDateOfBirth()
    {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth)
    {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail()
    {
        return Email;
    }

    public void setEmail(String email)
    {
        Email = email;
    }

    public float getFeeAmountDue()
    {
        return feeAmountDue;
    }

    public void setFeeAmountDue(float feeAmountDue)
    {
        this.feeAmountDue = feeAmountDue;
    }

    public String getFeePaid()
    {
        return FeePaid;
    }

    public void setFeePaid(String feePaid)
    {
        FeePaid = feePaid;
    }

    public float getLateFeeAmount()
    {
        return lateFeeAmount;
    }

    public void setLateFeeAmount(float lateFeeAmount)
    {
        this.lateFeeAmount = lateFeeAmount;
    }

    public Date getDueDate()
    {
        return dueDate;
    }

    public void setDueDate(Date dueDate)
    {
        this.dueDate = dueDate;
    }

    @Override
    public String toString()
    {
        return "PAMFStudentBean [studentId=" + studentId + ", instId=" + instId + ", instClassDivMapId="
                + instClassDivMapId + ", GaurdianName=" + GaurdianName + ", contactNo=" + contactNo + ", FirstName="
                + FirstName + ", LastName=" + LastName + ", generalRegNo=" + generalRegNo + ", dateOfBirth="
                + dateOfBirth + ", Email=" + Email + ", feeAmountDue=" + feeAmountDue + ", FeePaid=" + FeePaid
                + ", lateFeeAmount=" + lateFeeAmount + ", dueDate=" + dueDate + ", instituteBean=" + instituteBean
                + "]";
    }

}
