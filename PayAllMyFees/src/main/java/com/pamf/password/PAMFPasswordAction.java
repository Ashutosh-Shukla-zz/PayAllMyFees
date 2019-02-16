package com.pamf.password;

import com.pamf.login.PAMFLoginBean;
import com.pamf.util.PAMFBaseAction;
import com.pamf.util.PAMFUtilities;

public class PAMFPasswordAction extends PAMFBaseAction {

	private static final long serialVersionUID = -8749941361849359666L;

	public PAMFLoginBean loginCredentials = null;

	public String newPassword = null;

	public String status = null;

	public PAMFLoginBean getLoginCredentials() {
		return loginCredentials;
	}

	public void setLoginCredentials(PAMFLoginBean loginCredentials) {
		this.loginCredentials = loginCredentials;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String changePassword() {
		String encryptPwd = PAMFUtilities.encrypt(loginCredentials
				.getPassword());
		if (encryptPwd != null) {
			loginCredentials.setPassword(encryptPwd);
		}

		String newEncryptPwd = PAMFUtilities.encrypt(newPassword);
		if (newEncryptPwd != null) {
			setNewPassword(newEncryptPwd);
		}
		status = new PAMFPasswordModel().checkCurrentPassword(loginCredentials,
				newPassword);
		return "updatePassword";
	}

}
