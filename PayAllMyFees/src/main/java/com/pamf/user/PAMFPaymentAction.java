package com.pamf.user;

import java.util.ArrayList;

import com.pamf.institute.PAMFInstituteFeeStructure;
import com.pamf.util.PAMFBaseAction;

public class PAMFPaymentAction extends PAMFBaseAction
{

    private static final long serialVersionUID = -311322594796989751L;

    public int studentId;

    public PAMFStudentBean selectedStudent = null;

    public PAMFInstituteFeeStructure instituteFeeStructure = null;

    public int getStudentId()
    {
        return studentId;
    }

    public void setStudentId(int studentId)
    {
        this.studentId = studentId;
    }

    public PAMFInstituteFeeStructure getInstituteFeeStructure()
    {
        return instituteFeeStructure;
    }

    public void setInstituteFeeStructure(PAMFInstituteFeeStructure instituteFeeStructure)
    {
        this.instituteFeeStructure = instituteFeeStructure;
    }

    public PAMFStudentBean getSelectedStudent()
    {
        return selectedStudent;
    }

    public void setSelectedStudent(PAMFStudentBean selectedStudent)
    {
        this.selectedStudent = selectedStudent;
    }

    public String showPaymentInfo()
    {
        PAMFUserBean userBean = (PAMFUserBean)session.get("userbean");
        ArrayList<PAMFStudentBean> studentList = userBean.getMappedStudentList();

        for (PAMFStudentBean student : studentList)
        {
            if (student.getStudentId() == getStudentId())
            {
                selectedStudent = student;
                break;
            }
        }
        PAMFUserModel model = new PAMFUserModel();
        instituteFeeStructure = model.getPaymentInfo(selectedStudent);
        if (instituteFeeStructure != null)
        {
            return SUCCESS;
        }
        return ERROR;
    }

}
