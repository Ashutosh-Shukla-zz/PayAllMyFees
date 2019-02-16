package com.pamf.password;

import com.pamf.login.PAMFLoginBean;

public class PAMFPasswordModel
{

    public String checkCurrentPassword(PAMFLoginBean loginCredentials, String newPassword)
    {
        return new PAMFPasswordDAO().checkCurrentPassword(loginCredentials, newPassword);
    }

}
