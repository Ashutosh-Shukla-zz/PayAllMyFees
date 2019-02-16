package com.pamf.result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pamf.util.DBUtil;

public class PAMFResultDAO
{

    public ArrayList<PAMFResultBean> getResultListByStudent(int studentId)
    {
        ArrayList<PAMFResultBean> resultList = new ArrayList<PAMFResultBean>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        String query = " SELECT ID_RESULT, ID_INST_CLS_DIV_MAP, DESC_RESULT, URL_RESULT" + " FROM PMF_RESULT"
                + " WHERE ID_STDNT = ?";

        try
        {
            con = DBUtil.getInstance().getConnection();
            pstm = con.prepareStatement(query);
            pstm.setInt(1, studentId);
            rs = pstm.executeQuery();

            while (rs.next())
            {
                PAMFResultBean resultBean = new PAMFResultBean();
                resultBean.setResultId(rs.getInt("ID_RESULT"));
                resultBean.setStudentId(studentId);
                resultBean.setResultDescription(rs.getString("DESC_RESULT"));
                resultBean.setResultUrl(rs.getString("URL_RESULT"));
                resultBean.setInstituteClassDivId(rs.getInt("ID_INST_CLS_DIV_MAP"));
                resultList.add(resultBean);

            }
        }
        catch (SQLException e)
        {
            // TODO: handle exception
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }
        return resultList;
    }
}
