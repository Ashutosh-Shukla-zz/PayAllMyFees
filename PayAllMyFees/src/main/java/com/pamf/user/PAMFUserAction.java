package com.pamf.user;

import com.opensymphony.xwork2.ActionContext;
import com.pamf.login.PAMFLoginBean;
import com.pamf.util.PAMFBaseAction;

public class PAMFUserAction extends PAMFBaseAction
{

    private static final long serialVersionUID = 5134727207085340792L;

    public PAMFUserBean userBean = new PAMFUserBean();

    public String inviteEmail = null;

    public String getInviteEmail()
    {
        return inviteEmail;
    }

    public void setInviteEmail(String inviteEmail)
    {
        this.inviteEmail = inviteEmail;
    }

    public PAMFUserBean getUserBean()
    {
        return userBean;
    }

    public void setUserBean(PAMFUserBean userBean)
    {
        this.userBean = userBean;
    }

    public String showUserDashboard()
    {
        session = ActionContext.getContext().getSession();
        PAMFLoginBean pbean = (PAMFLoginBean)session.get("loginInfo");
        PAMFUserModel usermodel = new PAMFUserModel();
        userBean = usermodel.getUserBeanByLoginId(pbean);
        session.put("userbean", userBean);
        session.put("instituteSortedStudentList", userBean.getInstituteSortedStudentList());
        if (userBean.getUserId() != -1)
        {
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }

    public String inviteFriend()
    {
        new PAMFInviteFriendModel().inviteFriend(inviteEmail);

        return SUCCESS;

    }

}
