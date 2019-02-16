package com.pamf.login;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.pamf.util.PAMFBaseAction;

public class PAMFForgotPasswordAction extends PAMFBaseAction implements SessionAware
{

    private static final long serialVersionUID = 1L;

    public PAMFLoginBean loginCredentials = null;

    SessionMap<String, Object> sessionmap;

    @Override
    public void setSession(Map<String, Object> map)
    {
        sessionmap = (SessionMap<String, Object>)map;
    }

    public PAMFLoginBean getLoginCredentials()
    {
        return loginCredentials;
    }

    public void setLoginCredentials(PAMFLoginBean loginCredentials)
    {
        this.loginCredentials = loginCredentials;
    }

    public String validateUser()
    {
        PAMFLoginModel pmodel = new PAMFLoginModel();
        pmodel.checkUserPasswordRecovery(loginCredentials);

        if (loginCredentials.getLoginId() != -1)
        {
            String status = pmodel.sendEmail(loginCredentials);
            if (status.equalsIgnoreCase("Success"))
            {
                sessionmap.put("loginInfo", loginCredentials);
                return SUCCESS;
            }
        }
        return ERROR;
    }

}
