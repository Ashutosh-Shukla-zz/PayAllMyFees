package com.pamf.user;

import java.math.BigInteger;

public class PAMFInstituteBean
{

    private int instituteId = -1;

    private int userCrdntId = -1;

    private String InstituteName = null;

    private String InstituteAddress = null;

    private BigInteger contactNo = null;

    private String InstituteEmail = null;

    private int isActive = -1;

    private int regionId = -1;

    private String city = null;

    private String state = null;

    public PAMFInstituteBean()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PAMFInstituteBean(int instituteId, int userCrdntId, String instituteName, String instituteAddress,
            BigInteger contactNo, String instituteEmail, int isActive, int regionId, String city, String state)
    {
        super();
        this.instituteId = instituteId;
        this.userCrdntId = userCrdntId;
        InstituteName = instituteName;
        InstituteAddress = instituteAddress;
        this.contactNo = contactNo;
        InstituteEmail = instituteEmail;
        this.isActive = isActive;
        this.regionId = regionId;
        this.city = city;
        this.state = state;
    }

    public int getInstituteId()
    {
        return instituteId;
    }

    public void setInstituteId(int instituteId)
    {
        this.instituteId = instituteId;
    }

    public int getUserCrdntId()
    {
        return userCrdntId;
    }

    public void setUserCrdntId(int userCrdntId)
    {
        this.userCrdntId = userCrdntId;
    }

    public String getInstituteName()
    {
        return InstituteName;
    }

    public void setInstituteName(String instituteName)
    {
        InstituteName = instituteName;
    }

    public String getInstituteAddress()
    {
        return InstituteAddress;
    }

    public void setInstituteAddress(String instituteAddress)
    {
        InstituteAddress = instituteAddress;
    }

    public BigInteger getContactNo()
    {
        return contactNo;
    }

    public void setContactNo(BigInteger contactNo)
    {
        this.contactNo = contactNo;
    }

    public String getInstituteEmail()
    {
        return InstituteEmail;
    }

    public void setInstituteEmail(String instituteEmail)
    {
        InstituteEmail = instituteEmail;
    }

    public int isActive()
    {
        return isActive;
    }

    public int getIsActive()
    {
        return isActive;
    }

    public void setIsActive(int isActive)
    {
        this.isActive = isActive;
    }

    public int getRegionId()
    {
        return regionId;
    }

    public void setRegionId(int regionId)
    {
        this.regionId = regionId;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

}
