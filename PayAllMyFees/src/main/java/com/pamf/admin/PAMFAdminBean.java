package com.pamf.admin;

import java.util.ArrayList;

import com.pamf.user.PAMFInstituteBean;

public class PAMFAdminBean
{
    private int adminId = -1;

    private int userCredntialId = -1;

    private String firstName = null;

    private String lastName = null;

    private int contactNo = -1;

    private int contactNo1 = -1;

    private String email = null;

    private ArrayList<PAMFInstituteBean> instituteBeanList = new ArrayList<PAMFInstituteBean>();

    public PAMFAdminBean()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PAMFAdminBean(int adminId, int userCredntialId, String firstName, String lastName, int contactNo,
            int contactNo1, String email, ArrayList<PAMFInstituteBean> instituteBeanList)
    {
        super();
        this.adminId = adminId;
        this.userCredntialId = userCredntialId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contactNo = contactNo;
        this.contactNo1 = contactNo1;
        this.email = email;
        this.instituteBeanList = instituteBeanList;
    }

    public int getAdminId()
    {
        return adminId;
    }

    public void setAdminId(int adminId)
    {
        this.adminId = adminId;
    }

    public int getUserCredntialId()
    {
        return userCredntialId;
    }

    public void setUserCredntialId(int userCredntialId)
    {
        this.userCredntialId = userCredntialId;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public int getContactNo()
    {
        return contactNo;
    }

    public int getContactNo1()
    {
        return contactNo1;
    }

    public void setContactNo1(int contactNo1)
    {
        this.contactNo1 = contactNo1;
    }

    public void setContactNo(int contactNo)
    {
        this.contactNo = contactNo;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public ArrayList<PAMFInstituteBean> getInstituteBeanList()
    {
        return instituteBeanList;
    }

    public void setInstituteBeanList(ArrayList<PAMFInstituteBean> instituteBeanList)
    {
        this.instituteBeanList = instituteBeanList;
    }

}
