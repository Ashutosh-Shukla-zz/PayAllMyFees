package com.pamf.admin;

import java.util.ArrayList;
import java.util.Set;

import com.pamf.user.PAMFInstituteBean;
import com.pamf.user.PAMFStudentBean;
import com.pamf.util.PAMFBaseAction;

public class PAMFAdminActionBean extends PAMFBaseAction
{

    private static final long serialVersionUID = -8194130429767906349L;

    public PAMFAdminBean adminBean = new PAMFAdminBean();

    public String instituteId = null;

    public PAMFInstituteBean institute = new PAMFInstituteBean();

    public ArrayList<PAMFStudentBean> studentsList = new ArrayList<PAMFStudentBean>();

    public String selectedState = null;

    public Set<String> stateList = null;

    public String username = null;

    public String password = null;

    public String isActive = null;

    public PAMFAdminBean getAdminBean()
    {
        return adminBean;
    }

    public void setAdminBean(PAMFAdminBean adminBean)
    {
        this.adminBean = adminBean;
    }

    public String getInstituteId()
    {
        return instituteId;
    }

    public void setInstituteId(String instituteId)
    {
        this.instituteId = instituteId;
    }

    public PAMFInstituteBean getInstitute()
    {
        return institute;
    }

    public void setInstitute(PAMFInstituteBean institute)
    {
        this.institute = institute;
    }

    public ArrayList<PAMFStudentBean> getStudentsList()
    {
        return studentsList;
    }

    public void setStudentsList(ArrayList<PAMFStudentBean> studentsList)
    {
        this.studentsList = studentsList;
    }

    public String getSelectedState()
    {
        return selectedState;
    }

    public void setSelectedState(String selectedState)
    {
        this.selectedState = selectedState;
    }

    public Set<String> getStateList()
    {
        return stateList;
    }

    public void setStateList(Set<String> stateList)
    {
        this.stateList = stateList;
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

    public String getIsActive()
    {
        return isActive;
    }

    public void setIsActive(String isActive)
    {
        this.isActive = isActive;
    }

}
