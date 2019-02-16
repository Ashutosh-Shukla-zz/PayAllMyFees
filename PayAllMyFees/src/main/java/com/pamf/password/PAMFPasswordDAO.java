package com.pamf.password;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.Action;
import com.pamf.login.PAMFLoginBean;
import com.pamf.util.DBUtil;
import com.pamf.util.PAMFDatabaseConstants;

public class PAMFPasswordDAO
{

    protected String checkCurrentPassword(PAMFLoginBean loginCredentials, String newPassword)
    {
        String sql = "SELECT COUNT(*) FROM PMF_USER_CRDNT WHERE ID_USER_LOGIN=? AND PW_SLT_USER = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int updateCount = -1;
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, loginCredentials.getUsername());
            pstm.setString(2, loginCredentials.getPassword());
            rs = pstm.executeQuery();
            while (rs.next())
            {
                updateCount = rs.getInt(1);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }
        if (updateCount > 0)
        {
            return updatePassword(loginCredentials, newPassword);
        }
        else
        {
            return "failure";
        }
    }

    protected String updatePassword(PAMFLoginBean loginCredentials, String newPassword)
    {
        int flag = -1;
        String sql = "UPDATE " + PAMFDatabaseConstants.TABLE_USER_CREDENTIALS
                + " SET PW_SLT_USER = ? WHERE ID_USER_LOGIN = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, loginCredentials.getUsername());
            flag = pstmt.executeUpdate();
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return Action.ERROR;
        }
        finally
        {
            DBUtil.closeConnection(pstmt, null, conn);
        }

        if (flag >= 0)
        {
            return Action.SUCCESS;
        }
        else
        {
            return Action.ERROR;
        }

    }

}
