package com.pamf.admin;

import java.util.Set;
import java.util.TreeMap;

import com.pamf.login.PAMFLoginBean;
import com.pamf.login.PAMFLoginDAO;
import com.pamf.user.PAMFInstituteBean;

public class PAMFAdminModel
{

    public PAMFAdminBean getAdminBeanByLoginId(PAMFLoginBean pbean)
    {
        return new PAMFAdminDao().getUserBeanByLogin(pbean);
    }

    public PAMFInstituteBean getInstituteByID(int instituteId)
    {
        return new PAMFAdminDao().getInstituteByID(instituteId);
    }

    public Set<String> fetchStates()
    {
        return new PAMFAdminDao().fetchStates();
    }

    public TreeMap<String, Integer> fetchCitiesByState(String state)
    {
        return new PAMFAdminDao().fetchCitiesByState(state);
    }

    public int checkUsername(String username)
    {
        return new PAMFAdminDao().checkUsername(username);
    }

    public String insertInstitute(PAMFInstituteBean institute, String username, String password)
    {
        int usertype = 1;
        String flag = null;
        PAMFLoginBean loginBean = new PAMFLoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);
        loginBean.setUserType(usertype);
        int status;

        PAMFAdminDao adminDao = new PAMFAdminDao();
        if (username != null && password != null)
        {
            status = adminDao.createInstituteLogin(username, password, usertype);
            if (status > 0)
            {
                loginBean = new PAMFLoginDAO().validateUser(loginBean);
                institute.setUserCrdntId(loginBean.getLoginId());
                flag = new PAMFAdminDao().insertInstitute(institute);
            }
        }

        return flag;
    }

    public int changeInstitutionStatus(int instituteId, int isActive)
    {
        return new PAMFAdminDao().changeInstitutionStatus(instituteId, isActive);
    }

}
