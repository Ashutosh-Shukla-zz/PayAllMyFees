package com.pamf.login;

import com.pamf.util.PAMFBaseAction;
import com.pamf.util.PAMFUtilities;

public class PAMFLoginAction extends PAMFBaseAction {

	private static final long serialVersionUID = 5134727207085340792L;

	public PAMFLoginBean loginCredentials = null;

	public String loginFailed = null;

	public PAMFLoginBean getLoginCredentials() {
		return loginCredentials;
	}

	public void setLoginCredentials(PAMFLoginBean loginCredentials) {
		this.loginCredentials = loginCredentials;
	}

	public String getLoginFailed() {
		return loginFailed;
	}

	public void setLoginFailed(String loginFailed) {
		this.loginFailed = loginFailed;
	}

	public String validateLogin() {
		PAMFLoginModel pmodel = new PAMFLoginModel();
		if (loginCredentials != null && loginCredentials.getPassword() != null) {
			String encryptedPwd = PAMFUtilities.encrypt(loginCredentials
					.getPassword());
			if (encryptedPwd != null) {
				loginCredentials.setPassword(encryptedPwd);
			}
		}
		pmodel.checkUser(loginCredentials);
		if (loginCredentials.getLoginId() != -1) {
			loginFailed = "1";
			session.put("loginInfo", loginCredentials);
			return SUCCESS;
		}
		switch (loginCredentials.getUserType()) {
		case 0:
			loginFailed = "0";
			return "adminError";
		case 1:
			loginFailed = "1";
			return ERROR;
		case 2:
			loginFailed = "2";
			return ERROR;
		}
		return ERROR;
	}

	public String logout() {
		session.remove("loginInfo");
		return "success";
	}

}
