package com.pamf.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pamf.util.DBUtil;
import com.pamf.util.PAMFDatabaseConstants;

public class PAMFForgotPasswordDAO {
	
	 public PAMFLoginBean validateUser(PAMFLoginBean loginbean)
	    {
	        Connection con = DBUtil.getInstance().getConnection();
	        PreparedStatement pstm = null;
	        ResultSet rs = null;
	        String query = "SELECT ID_USER_CRDNT, EML_USER FROM " +PAMFDatabaseConstants.TABLE_USER + " WHERE ID_USER_CRDNT = (SELECT ID_USER_CRDNT FROM " + PAMFDatabaseConstants.TABLE_USER_CREDENTIALS + " WHERE ID_USER_LOGIN = '"
	                + loginbean.getUsername() +"')";

	        try
	        {
	            pstm = con.prepareStatement(query);
	            rs = pstm.executeQuery(query);
	            while (rs.next())
	            {
	                loginbean.setLoginId(rs.getInt("ID_USER_CRDNT"));
	                loginbean.setPassword("");
	                loginbean.setEmailId(rs.getString("EML_USER"));
	            }
	            
	            if (rs != null)
	              {
	                  rs.close();
	              }
	              if (pstm != null)
	              {
	            	  pstm.close();
	              }
	              if (con != null)
	              {
	            	  con.close();
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
	 
	 /**
	  * To update password for Password Recovery
	  * @param loginCredentials
	  * @return
	  */
	 public String updatePassword(PAMFLoginBean loginCredentials)
	    {
	        int flag = 0;

	        String sql = "UPDATE " +PAMFDatabaseConstants.TABLE_USER_CREDENTIALS + " SET PW_SLT_USER= ? WHERE ID_USER_CRDNT=?";
	        Connection conn = DBUtil.getInstance().getConnection();
	        PreparedStatement pStmt = null;
	        try
	        {
	        	pStmt = conn.prepareStatement(sql);
	        	pStmt.setString(1, loginCredentials.getPassword());
	        	pStmt.setInt(2, loginCredentials.getLoginId());
	            flag = pStmt.executeUpdate();
	        }
	        catch (SQLException e)
	        {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        finally
	        {
	            DBUtil.closeConnection(pStmt, null, conn);
	        }

	        if (flag > 0)
	            return "success";
	        else
	        {
	            return "error";
	        }
	    }


}
