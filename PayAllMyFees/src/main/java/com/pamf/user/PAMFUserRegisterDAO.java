package com.pamf.user;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.pamf.util.DBUtil;

public class PAMFUserRegisterDAO
{

    private static Logger logger = Logger.getLogger(PAMFUserRegisterDAO.class);

    DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);

    public PAMFUserRegisterDAO()
    {

    }

    public TreeMap<String,Integer> fetchInstitutesByRegion(int region)
    {
        String sql = "SELECT ID_INST, NM_INST FROM PMF_INST WHERE ID_RGN = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        TreeMap<String, Integer> institutes = new TreeMap<String, Integer>();
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, region);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                institutes.put(rs.getString(2), rs.getInt(1));
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
        return institutes;
    }

    public ArrayList<PAMFStudentBean> showMatchingStudents(long contactPhone, int instituteId, String DOB)
    {
        // DOB="2010-05-28";

        String sql = "SELECT ID_STDNT, NM_GRDN,DOB_STDNT,CNCT_PHN,FN_STDNT,LN_STDNT FROM PMF_STDNT WHERE  ID_INST = ? and CNCT_PHN = ? and DOB_STDNT = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<PAMFStudentBean> studentBeans = new ArrayList<PAMFStudentBean>();
        try
        {
            pstm = conn.prepareStatement(sql);
            // Date parsed = formatter.parse(DOB);
            // java.sql.Date date = new java.sql.Date(parsed.getTime());
            // java.sql.Date sqlDate = new java.sql.Date(parsed1.getTime());
            // DOB_STDNT LIKE ? and
            // Date parsed = formatter.parse(DOB);
            // java.sql.Date sqlDate = new java.sql.Date(parsed.getTime())

            java.sql.Date dobDate = new java.sql.Date(formatter.parse(DOB).getTime());
            pstm.setInt(1, instituteId);
            pstm.setLong(2, contactPhone);
            pstm.setDate(3, dobDate);
            // and DOB_STDNT like ?
            rs = pstm.executeQuery();
            System.out.println(pstm);
            while (rs.next())
            {
                PAMFStudentBean studentBean = new PAMFStudentBean();
                studentBean.setStudentId(rs.getInt(1));
                studentBean.setGaurdianName(rs.getString(2));
                studentBean.setDateOfBirth(rs.getDate(3));
                studentBean.setContactNo(rs.getBigDecimal(4).toBigInteger());
                studentBean.setFirstName(rs.getString(5));
                studentBean.setLastName(rs.getString(6));
                studentBeans.add(studentBean);
            }
        }
        catch (SQLException | ParseException e)
        {
            // TODO Auto-generated catch block | ParseException e
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }
        return studentBeans;
    }

    public String fetchRegionNameByRegionId(int regionId)
    {
        String sql = "SELECT ST_RGN FROM PMF_RGN WHERE ID_RGN = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String regionName = "";
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, regionId);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                regionName = rs.getString(1);
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
        return regionName;
    }

    public String fetchinstNameByinstId(int instituteId)
    {
        String sql = "SELECT NM_INST FROM PMF_INST WHERE ID_INST = ?";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String instituteName = "";
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, instituteId);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                instituteName = rs.getString(1);
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
        return instituteName;
    }

    public void insertUserInfo(PAMFUserRegisterBean regBean, int userCredId)
    {
        int userLoginPkId = 0;
        StringBuilder sqlBuild = new StringBuilder();
        sqlBuild.append("INSERT INTO PMF_USER_INFO");
        sqlBuild.append("(");
        sqlBuild.append("   ID_USER_CRDNT,");
        sqlBuild.append("   ADS_USER,");
        sqlBuild.append("   EML_USER,");
        sqlBuild.append("   CNCT_PHN00");
        sqlBuild.append(") ");
        sqlBuild.append("VALUES (?, ?, ?, ?)");
        String sql = sqlBuild.toString();

        String address = regBean.getAddress().trim();
        String emailId = regBean.getEmailID().trim();
        BigInteger contact1 = regBean.getContactNo();

        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try
        {
            pstm = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, userCredId);
            pstm.setString(2, address);
            pstm.setString(3, emailId);
            pstm.setBigDecimal(4, new BigDecimal(contact1));

            userLoginPkId = pstm.executeUpdate();
            rs = pstm.getGeneratedKeys();
            if (rs.next())
            {
                userLoginPkId = rs.getInt(1);
            }

            // Map current user with the students
            createUserStudentMap(regBean, userLoginPkId);
        }
        catch (SQLException sqlE)
        {
            logger.error("Error inserting user information : " + sql, sqlE);
            logger.error("UserCredID : " + userCredId);
            logger.error("Address : " + address);
            logger.error("Email ID : " + emailId);
            logger.error("Contact 01 : " + contact1);
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }
    }

    public void createUserStudentMap(PAMFUserRegisterBean regBean, int userInfoId)
    {
        List<Integer> studentIdInList = regBean.getStudentIdInList();
        String[] sqlArray = new String[studentIdInList.size()];
        Connection conn = DBUtil.getInstance().getConnection();
        Statement stmt = null;
        int[] updateCounts = new int[1];
        try
        {
            stmt = conn.createStatement();
            for (int i = 0; i < studentIdInList.size(); i++)
            {
                StringBuilder sql = new StringBuilder();
                sql.append("INSERT INTO PMF_USER_STDNT_MAP(ID_STDNT, ID_USER_INFO ) VALUES ( ");
                sql.append(studentIdInList.get(i));
                sql.append(" , ");
                sql.append(userInfoId);
                sql.append(" )");
                sqlArray[i] = sql.toString();

                stmt.addBatch(sqlArray[i]);
            }
            updateCounts = stmt.executeBatch();
        }
        catch (SQLException sqlE)
        {
            if (sqlE instanceof BatchUpdateException)
            {
                BatchUpdateException buE = (BatchUpdateException)sqlE;
                updateCounts = buE.getUpdateCounts();
            }
        }
        finally
        {
            for (int i = 0; i < updateCounts.length; i++)
            {
                if (updateCounts[i] == Statement.EXECUTE_FAILED)
                {
                    logger.error("Error executing statement : " + sqlArray[i]);
                }
            }
            DBUtil.closeConnection(stmt, null, conn);
        }
    }

    public int insertUserCredentials(String username, String password, int usertype)
    {
        int userCredId = 0;
        String sql = "INSERT INTO PMF_USER_CRDNT(ID_USER_LOGIN, TY_USER, PW_SLT_USER) VALUES " + "(?,?,?)";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try
        {
            pstm = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            pstm.setString(1, username.trim());
            pstm.setInt(2, usertype);
            pstm.setString(3, password.trim());

            userCredId = pstm.executeUpdate();
            rs = pstm.getGeneratedKeys();
            if (rs.next())
            {
                userCredId = rs.getInt(1);
            }
        }
        catch (SQLException sqlE)
        {
            logger.error("Error while inserting user credentials for new users", sqlE);
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }
        return userCredId;
    }
}
