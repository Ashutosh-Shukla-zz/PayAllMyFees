package com.pamf.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pamf.util.DBUtil;
import com.pamf.util.PAMFDatabaseConstants;

public class PAMFLoginDAO
{
    public PAMFLoginBean validateUser(PAMFLoginBean loginbean)
    {
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT ID_USER_CRDNT FROM " + PAMFDatabaseConstants.TABLE_USER_CREDENTIALS + " WHERE ID_USER_LOGIN = '"
                + loginbean.getUsername() + "' AND PW_SLT_USER = '" + loginbean.getPassword() + "' AND TY_USER ="
                + loginbean.getUserType();

        try
        {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery(query);
            while (rs.next())
            {
                loginbean.setLoginId(rs.getInt("ID_USER_CRDNT"));
                loginbean.setPassword("");
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }
        return loginbean;
    }

}
