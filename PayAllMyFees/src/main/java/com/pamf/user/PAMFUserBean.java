package com.pamf.user;

import java.util.ArrayList;
import java.util.Map;

public class PAMFUserBean
{
    private int userId = -1;

    private int userCredntialId = -1;

    private int contactNo1 = -1;

    private int contactNo2 = -1;

    private int contactNo3 = -1;

    private int contactNo4 = -1;

    private String Address = null;

    private String EmailId = null;
    private String GuardianName = null;

    private ArrayList<PAMFStudentBean> mappedStudentList = null;

    private Map<Integer, ArrayList<PAMFStudentBean>> instituteSortedStudentList = null;

    public PAMFUserBean()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PAMFUserBean(int userId, int userCredntialId, int contactNo1, int contactNo2, int contactNo3,
            int contactNo4, String address, String emailId, ArrayList<PAMFStudentBean> sbean,
            Map<Integer, ArrayList<PAMFStudentBean>> instituteSortedStudentList)
    {
        super();
        this.userId = userId;
        this.userCredntialId = userCredntialId;
        this.contactNo1 = contactNo1;
        this.contactNo2 = contactNo2;
        this.contactNo3 = contactNo3;
        this.contactNo4 = contactNo4;
        Address = address;
        EmailId = emailId;
        this.mappedStudentList = sbean;
        this.instituteSortedStudentList = instituteSortedStudentList;
    }

    public ArrayList<PAMFStudentBean> getMappedStudentList()
    {
        return mappedStudentList;
    }

    public void setMappedStudentList(ArrayList<PAMFStudentBean> mappedStudentList)
    {
        this.mappedStudentList = mappedStudentList;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public int getUserCredntialId()
    {
        return userCredntialId;
    }

    public void setUserCredntialId(int userCredntialId)
    {
        this.userCredntialId = userCredntialId;
    }

    public int getContactNo1()
    {
        return contactNo1;
    }

    public void setContactNo1(int contactNo1)
    {
        this.contactNo1 = contactNo1;
    }

    public int getContactNo2()
    {
        return contactNo2;
    }

    public void setContactNo2(int contactNo2)
    {
        this.contactNo2 = contactNo2;
    }

    public int getContactNo3()
    {
        return contactNo3;
    }

    public void setContactNo3(int contactNo3)
    {
        this.contactNo3 = contactNo3;
    }

    public int getContactNo4()
    {
        return contactNo4;
    }

    public void setContactNo4(int contactNo4)
    {
        this.contactNo4 = contactNo4;
    }

    public String getAddress()
    {
        return Address;
    }

    public void setAddress(String address)
    {
        Address = address;
    }

    public String getEmailId()
    {
        return EmailId;
    }

    public void setEmailId(String emailId)
    {
        EmailId = emailId;
    }

    public Map<Integer, ArrayList<PAMFStudentBean>> getInstituteSortedStudentList()
    {
        return instituteSortedStudentList;
    }

    public void setInstituteSortedStudentList(Map<Integer, ArrayList<PAMFStudentBean>> instituteSortedStudentList)
    {
        this.instituteSortedStudentList = instituteSortedStudentList;
    }

    public String getGuardianName()
    {
        return GuardianName;
    }

    public void setGuardianName(String GuardianName)
    {
        this.GuardianName = GuardianName;
    }

}
