package com.pamf.user;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PAMFUserRegisterBean
{
    private String address = null;

    private BigInteger contactNo = null;

    private Date dateOfBirth;

    private String emailID = null;

    private int instituteId = -1;

    private List<Integer> regionId = null;

    private String username = null;

    private String password = null;

    private ArrayList<Integer> studentIdInList = null;

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public BigInteger getContactNo()
    {
        return contactNo;
    }

    public void setContactNo(BigInteger contactNo)
    {
        this.contactNo = contactNo;
    }

    public Date getDateOfBirth()
    {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth)
    {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmailID()
    {
        return emailID;
    }

    public void setEmailID(String emailID)
    {
        this.emailID = emailID;
    }

    public int getInstituteId()
    {
        return instituteId;
    }

    public void setInstituteId(int instituteId)
    {
        this.instituteId = instituteId;
    }

    public List<Integer> getRegionId()
    {
        return regionId;
    }

    public void setSelectedRegionId(int selectedRegionId)
    {
        // convert to list as region is a select box in jsp
        regionId = new ArrayList<Integer>(1);
        regionId.add(selectedRegionId);
    }

    public int getSelectedRegionId()
    {
        if (regionId == null || regionId.isEmpty())
        {
            return -1;
        }
        return regionId.get(0);
    }

    public void setRegionId(List<Integer> regionId)
    {
        this.regionId = regionId;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public ArrayList<Integer> getStudentIdInList()
    {
        return studentIdInList;
    }

    public void setStudentIdInList(ArrayList<Integer> studentIdInList)
    {
        this.studentIdInList = studentIdInList;
    }

}
