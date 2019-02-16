package com.pamf.notifications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pamf.util.DBUtil;

public class PAMFNotificationDAO
{

    public PAMFNotificationDAO()
    {

    }

    public ArrayList<PAMFClass> getClasses(int instId)
    {
        ArrayList<PAMFClass> classList = new ArrayList<PAMFClass>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection con = DBUtil.getInstance().getConnection();

        String query = "SELECT DISTINCT CLS_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST=?";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, instId);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                ArrayList<String> divList = new ArrayList<String>();
                PAMFClass pclass = new PAMFClass();
                String myclass = rs.getString("CLS_STDNT");
                pclass.setClassId(myclass);
                divList = getDivisionbyClass(myclass);
                pclass.setDivision(divList);
                classList.add(pclass);
            }

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }

        return classList;
    }

    public int getDivMapId(int instId, String classId, String divId)
    {
        int inst_cls_div_map_id = -1;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "";
        Connection con = DBUtil.getInstance().getConnection();
        query = "SELECT DISTINCT ID_INST_CLS_DIV_MAP FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST=? and CLS_STDNT=? and DIV_STDNT=?";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, instId);
            pstm.setString(2, classId);
            pstm.setString(3, divId);

            rs = pstm.executeQuery();
            while (rs.next())
            {
                inst_cls_div_map_id = rs.getInt("ID_INST_CLS_DIV_MAP");
            }

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }

        return inst_cls_div_map_id;
    }

    public String insertNotification(int ID_INST_CLS_DIV_MAP_id, String Message)
    {
        PreparedStatement pstm = null;
        Connection con = DBUtil.getInstance().getConnection();
        String query = "INSERT INTO PMF_NOTIFICATION (ID_INST_CLS_DIV_MAP, MSG_NOTIF) VALUES(?,?)";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, ID_INST_CLS_DIV_MAP_id);
            pstm.setString(2, Message);

            pstm.executeUpdate();
            // con.commit();

            pstm.close();

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, null, con);
        }

        return "success";
    }

    public ArrayList<String> getDivisionbyClass(String classId)
    {
        ArrayList<String> divList = new ArrayList<String>();
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT DISTINCT DIV_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE CLS_STDNT=?";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setString(1, classId);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                String division = null;
                division = rs.getString("DIV_STDNT");
                if (division != null)
                    divList.add(division);
                else
                    divList.add("");
            }

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }

        return divList;

    }

    public PAMFShowNotificationBean getPamfNotificationsForStudent(int div_map_id)
    {
        PAMFShowNotificationBean showNotificationBean = new PAMFShowNotificationBean();

        ArrayList<PAMFStudentNotifications> stdntNotifications = new ArrayList<PAMFStudentNotifications>();
        Connection con = DBUtil.getInstance().getConnection();

        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT DISTINCT MSG_NOTIF,ID_INST_CLS_DIV_MAP,TS_CRT_RCRD FROM PMF_NOTIFICATION WHERE ID_INST_CLS_DIV_MAP=?";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, div_map_id);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                PAMFStudentNotifications pamfStdnt = new PAMFStudentNotifications();

                pamfStdnt.setNotificationDiv_Map_Id(rs.getInt("ID_INST_CLS_DIV_MAP"));
                pamfStdnt.setNotificationMessage(rs.getString("MSG_NOTIF"));
                pamfStdnt.setCreatedDate(rs.getDate("TS_CRT_RCRD"));
                stdntNotifications.add(pamfStdnt);
            }

            showNotificationBean.setStudentNotificationList(stdntNotifications);
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }

        return showNotificationBean;
    }

    public int getStudentDivMapId(int studentId)
    {
        int division_map_id = -1;
        Connection con = DBUtil.getInstance().getConnection();

        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT DISTINCT ID_INST_CLS_DIV_MAP FROM PMF_STDNT WHERE ID_STDNT=?";
        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, studentId);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                division_map_id = rs.getInt("ID_INST_CLS_DIV_MAP");
            }

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }

        return division_map_id;
    }
}
