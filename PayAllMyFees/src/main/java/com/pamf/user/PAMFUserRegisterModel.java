package com.pamf.user;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeMap;

import com.pamf.student.PAMFStudentDAO;

public class PAMFUserRegisterModel
{
    public TreeMap<String, Integer> fetchInstitutesByRegion(int region)
    {
        return new PAMFUserRegisterDAO().fetchInstitutesByRegion(region);
    }

    public List<PAMFStudentBean> searchStudentsByParams(BigInteger contact, int instituteId, Date dateOfBirth)
    {
        return new PAMFStudentDAO().searchStudentsByParams(contact, instituteId, dateOfBirth);
    }

    public ArrayList<PAMFStudentBean> showMatchingStudents(long contactPhone, int instituteId, String DOB)
    {
        return new PAMFUserRegisterDAO().showMatchingStudents(contactPhone, instituteId, DOB);
    }

    public String fetchRegionNameByRegionId(int regionId)
    {
        return new PAMFUserRegisterDAO().fetchRegionNameByRegionId(regionId);
    }

    public String fetchInstNameByInstId(int instituteId)
    {
        return new PAMFUserRegisterDAO().fetchinstNameByinstId(instituteId);
    }

    public void completeRegistration(PAMFUserRegisterBean registerBean, int usertype)
    {
        PAMFUserRegisterDAO regDAO = new PAMFUserRegisterDAO();

        // Insert User Credentials
        int userCredId = regDAO.insertUserCredentials(registerBean.getUsername(), registerBean.getPassword(), usertype);

        // Insert User Info
        regDAO.insertUserInfo(registerBean, userCredId);

    }

}
