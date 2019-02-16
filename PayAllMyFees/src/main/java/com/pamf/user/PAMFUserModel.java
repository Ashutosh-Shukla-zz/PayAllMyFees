package com.pamf.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.pamf.institute.PAMFInstituteFeeStructure;
import com.pamf.login.PAMFLoginBean;

public class PAMFUserModel
{

    public PAMFUserBean getUserBeanByLoginId(PAMFLoginBean pbean)
    {
        PAMFUserBean userBean = new PAMFUserDAO().getUserBeanByLogin(pbean);
        setInstituteSortedStudentList(userBean);
        return userBean;
    }

    public void setInstituteSortedStudentList(PAMFUserBean userBean)
    {
        ArrayList<PAMFStudentBean> mappedStudents = userBean.getMappedStudentList();
        Map<Integer, ArrayList<PAMFStudentBean>> instituteSortedStudentList = new HashMap<Integer, ArrayList<PAMFStudentBean>>();
        Iterator<PAMFStudentBean> iter = mappedStudents.iterator();
        while (iter.hasNext())
        {
            PAMFStudentBean student = iter.next();
            int instituteID = student.getInstituteBean().getInstituteId();
            if (instituteSortedStudentList.containsKey(instituteID))
            {
                ArrayList<PAMFStudentBean> studentList = instituteSortedStudentList.get(instituteID);
                studentList.add(student);
                instituteSortedStudentList.put(instituteID, studentList);
            }
            else
            {
                ArrayList<PAMFStudentBean> studentList = new ArrayList<PAMFStudentBean>();
                studentList.add(student);
                instituteSortedStudentList.put(instituteID, studentList);
            }
        }
        userBean.setInstituteSortedStudentList(instituteSortedStudentList);
    }

    public PAMFInstituteFeeStructure getPaymentInfo(PAMFStudentBean selectedStudent)
    {
        if (selectedStudent != null)
        {
            return new PAMFUserDAO().getPaymentInfo(selectedStudent);
        }
        return null;
    }

}
