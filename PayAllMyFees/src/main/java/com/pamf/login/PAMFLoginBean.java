package com.pamf.login;

public class PAMFLoginBean
{
    private int loginId = -1;

    private String username = null;

    private String password = null;

    private int userType = -1;
    
    private String emailId = null;

    public PAMFLoginBean()
    {
        super();
    }

    public PAMFLoginBean(String userName, String password, int userType)
    {
        this.username = userName;
        this.password = password;
        this.userType = userType;
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

    public int getUserType()
    {
        return userType;
    }

    public void setUserType(int userType)
    {
        this.userType = userType;
    }

    public int getLoginId()
    {
        return loginId;
    }

    public void setLoginId(int loginId)
    {
        this.loginId = loginId;
    }

	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}

	/**
	 * @param emailId the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

}
