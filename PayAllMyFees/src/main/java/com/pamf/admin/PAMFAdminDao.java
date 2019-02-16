package com.pamf.admin;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeMap;

import com.pamf.login.PAMFLoginBean;
import com.pamf.user.PAMFInstituteBean;
import com.pamf.util.DBUtil;

public class PAMFAdminDao
{

    public PAMFAdminBean getUserBeanByLogin(PAMFLoginBean pbean)
    {
        PAMFAdminBean adminBean = new PAMFAdminBean();
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;

        String query = "SELECT PMF_ADMN_INFO.ID_ADMIN, PMF_ADMN_INFO.ID_USER_CRDNT, "
                + "PMF_ADMN_INFO.FN_USER, PMF_ADMN_INFO.LN_USER, PMF_ADMN_INFO.CNCT_PHN, "
                + "PMF_ADMN_INFO.CNCT_PHN01, PMF_ADMN_INFO.EML_ADMIN FROM PMF_ADMN_INFO"
                + " WHERE PMF_ADMN_INFO.ID_USER_CRDNT=?";

        try
        {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, pbean.getLoginId());
            rs = pstm.executeQuery();
            while (rs.next())
            {
                adminBean.setAdminId(rs.getInt("PMF_ADMN_INFO.ID_ADMIN"));
                adminBean.setUserCredntialId(rs.getInt("PMF_ADMN_INFO.ID_USER_CRDNT"));
                adminBean.setFirstName(rs.getString("PMF_ADMN_INFO.FN_USER"));
                adminBean.setLastName(rs.getString("PMF_ADMN_INFO.LN_USER"));
                adminBean.setContactNo(rs.getInt("CNCT_PHN"));
                adminBean.setContactNo1(rs.getInt("PMF_ADMN_INFO.CNCT_PHN01"));
                adminBean.setEmail(rs.getString("PMF_ADMN_INFO.EML_ADMIN"));
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

        adminBean.setInstituteBeanList(getInstituteList());
        return adminBean;

    }

    private ArrayList<PAMFInstituteBean> getInstituteList()
    {
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<PAMFInstituteBean> instituteList = new ArrayList<PAMFInstituteBean>();
        String query = "SELECT PMF_INST.ID_INST, PMF_INST.NM_INST, PMF_INST.ADS_INST, PMF_INST.CNCT_PHN, PMF_INST.EML_INST, PMF_INST.ST_INST, PMF_INST.ID_RGN, PMF_RGN.CI_RGN, PMF_RGN.ST_RGN"
                + " FROM PMF_INST, PMF_RGN" + " WHERE PMF_INST.ID_RGN = PMF_RGN.ID_RGN";
        
        try
        {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                PAMFInstituteBean instituteBean = new PAMFInstituteBean();
                instituteBean.setContactNo(rs.getBigDecimal("PMF_INST.CNCT_PHN").toBigInteger());
                instituteBean.setInstituteAddress(rs.getString("PMF_INST.ADS_INST"));
                instituteBean.setInstituteEmail(rs.getString("PMF_INST.EML_INST"));
                instituteBean.setInstituteId(rs.getInt("PMF_INST.ID_INST"));
                instituteBean.setInstituteName(rs.getString("PMF_INST.NM_INST"));
                instituteBean.setIsActive(rs.getInt("PMF_INST.ST_INST"));
                instituteBean.setRegionId(rs.getInt("PMF_INST.ID_RGN"));
                instituteBean.setCity(rs.getString("PMF_RGN.CI_RGN"));
                instituteBean.setState(rs.getString("PMF_RGN.ST_RGN"));
                instituteList.add(instituteBean);
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

        return instituteList;
    }

    public PAMFInstituteBean getInstituteByID(int instituteId)
    {
        StringBuilder buildSql = new StringBuilder();
        buildSql.append("SELECT ");
        buildSql.append("  PMF_INST.ID_INST,");
        buildSql.append("  PMF_INST.ID_USER_CRDNT,");
        buildSql.append("  PMF_INST.NM_INST,");
        buildSql.append("  PMF_INST.ADS_INST,");
        buildSql.append("  PMF_INST.CNCT_PHN,");
        buildSql.append("  PMF_INST.EML_INST,");
        buildSql.append("  PMF_INST.ST_INST,");
        buildSql.append("  PMF_INST.ID_RGN,");
        buildSql.append("  PMF_RGN.ST_RGN,");
        buildSql.append("  PMF_RGN.CI_RGN");
        buildSql.append(" FROM ");
        buildSql.append("  PMF_INST,");
        buildSql.append("  PMF_RGN ");
        buildSql.append(" WHERE ");
        buildSql.append("  PMF_INST.ID_RGN   = PMF_RGN.ID_RGN ");
        buildSql.append(" AND PMF_INST.ID_INST= ? ");

        String sql = buildSql.toString();
        Connection connection = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        PAMFInstituteBean institute = new PAMFInstituteBean();
        try
        {
            pstm = connection.prepareStatement(sql);
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, instituteId);
            rs = pstm.executeQuery();
            if (rs.next())
            {
                institute.setInstituteId(rs.getInt(1));
                institute.setUserCrdntId(rs.getInt(2));
                institute.setInstituteName(rs.getString(3));
                institute.setInstituteAddress(rs.getString(4));
                institute.setContactNo(new BigInteger(rs.getString(5)));
                institute.setInstituteEmail(rs.getString(6));
                institute.setIsActive(rs.getInt(7));
                institute.setRegionId(rs.getInt(8));
                institute.setState(rs.getString(9));
                institute.setCity(rs.getString(10));
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, connection);
        }

        return institute;
    }

    public Set<String> fetchStates()
    {
        String sql = "SELECT DISTINCT ST_RGN FROM PMF_RGN ORDER BY ST_RGN ASC";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        TreeMap<String, Object> states = new TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);

        try
        {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                states.put(rs.getString(1), null);
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }

        return states.keySet();
    }

    public TreeMap<String,Integer> fetchCitiesByState(String state)
    {
        String sql = "SELECT ID_RGN, CI_RGN FROM PMF_RGN WHERE ST_RGN = ? ORDER BY CI_RGN ASC";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;

        TreeMap<String, Integer> cities = new TreeMap<String, Integer>(String.CASE_INSENSITIVE_ORDER);
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, state);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                cities.put(rs.getString(2), rs.getInt(1));
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }

        return cities;
    }

    public int checkUsername(String username)
    {
        int flag = 0;
        String sql = "SELECT ID_USER_LOGIN  FROM PMF_USER_CRDNT WHERE ID_USER_LOGIN = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, username);
            rs = pstm.executeQuery();
            if (rs.next())
            {
                flag = 1;
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }
        return flag;
    }

    public String insertInstitute(PAMFInstituteBean institute)
    {
        int flag = 0;

        String sql = "INSERT INTO PMF_INST (ID_USER_CRDNT, NM_INST, ADS_INST, CNCT_PHN, EML_INST, ST_INST, ID_RGN) VALUES "
                + " (?,?,?,?,?,?,?)";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, institute.getUserCrdntId());
            pstm.setString(2, institute.getInstituteName());
            pstm.setString(3, institute.getInstituteAddress());
            pstm.setString(4, String.valueOf(institute.getContactNo()));
            pstm.setString(5, institute.getInstituteEmail());
            pstm.setInt(6, 1);
            pstm.setInt(7, institute.getRegionId());
            flag = pstm.executeUpdate();

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, null, conn);
        }

        if (flag > 0)
            return "success";
        else
        {
            return "error";
        }
    }

    public int createInstituteLogin(String username, String password, int usertype)
    {
        int flag = 0;
        String sql = "INSERT INTO PMF_USER_CRDNT(ID_USER_LOGIN, PW_SLT_USER, TY_USER) VALUES (?,?,?)";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, password);
            pstm.setInt(3, usertype);
            flag = pstm.executeUpdate();

        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, null, conn);
        }

        return flag;
    }

    public int changeInstitutionStatus(int instituteId, int isActive)
    {
        int flag = 0;
        String sql = "UPDATE PMF_INST SET ST_INST=? WHERE ID_INST=?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, isActive);
            pstm.setInt(2, instituteId);
            flag = pstm.executeUpdate();
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, null, conn);
        }
        return flag;
    }
}
