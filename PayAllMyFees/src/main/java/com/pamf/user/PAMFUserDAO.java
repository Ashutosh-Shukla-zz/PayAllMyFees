package com.pamf.user;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.lang3.ArrayUtils;

import com.pamf.institute.PAMFInstituteFeeStructure;
import com.pamf.login.PAMFLoginBean;
import com.pamf.util.DBUtil;
import com.pamf.util.PAMFDatabaseConstants;
import com.pamf.util.PAMFUtilities;

public class PAMFUserDAO implements PAMFDatabaseConstants
{

    public PAMFUserBean getUserBeanByLogin(PAMFLoginBean pbean)
    {
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        PAMFUserBean userBean = new PAMFUserBean();
        String query = "SELECT ID_USER_INFO, ID_USER_CRDNT, CNCT_PHN00, CNCT_PHN01, CNCT_PHN02, CNCT_PHN03, ADS_USER, EML_USER"
                + " FROM " + TABLE_USER + " WHERE ID_USER_CRDNT = " + pbean.getLoginId();

        try
        {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next())
            {
                userBean.setUserId(rs.getInt("ID_USER_INFO"));
                userBean.setUserCredntialId(rs.getInt("ID_USER_CRDNT"));
                userBean.setContactNo1(rs.getInt("CNCT_PHN00"));
                userBean.setContactNo2(rs.getInt("CNCT_PHN01"));
                userBean.setContactNo3(rs.getInt("CNCT_PHN02"));
                userBean.setContactNo4(rs.getInt("CNCT_PHN03"));
                userBean.setAddress(rs.getString("ADS_USER"));
                userBean.setEmailId(rs.getString("EML_USER"));
            }
            if (userBean.getUserId() != -1)
                userBean.setMappedStudentList(getStudentBeanListByUserId(userBean.getUserId()));
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, con);
        }
        return userBean;
    }

    public ArrayList<PAMFStudentBean> getStudentBeanListByUserId(int userId)
    {
        ArrayList<PAMFStudentBean> studentBeanList = new ArrayList<PAMFStudentBean>();
        ArrayList<Integer> studentIDs = new ArrayList<Integer>();

        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT PMF_STDNT.ID_STDNT, PMF_STDNT.ID_INST, PMF_STDNT.ID_INST_CLS_DIV_MAP, PMF_STDNT.NM_GRDN, PMF_STDNT.CNCT_PHN, PMF_STDNT.FN_STDNT, PMF_STDNT.LN_STDNT, PMF_STDNT.ID_GEN_RGSTR, PMF_STDNT.DOB_STDNT, PMF_STDNT.EML_STDNT, PMF_STDNT.FE_AMT_DUE, PMF_STDNT.FE_PAID, PMF_STDNT.LATE_FE_AMT, PMF_STDNT.DATE_DUE,"
                + "PMF_INST.NM_INST, PMF_INST.ADS_INST, PMF_INST.CNCT_PHN, PMF_INST.EML_INST, PMF_INST.ST_INST "
                + "FROM PMF_STDNT, PMF_USER_STDNT_MAP, PMF_INST "
                + "WHERE PMF_STDNT.ID_STDNT =  PMF_USER_STDNT_MAP.ID_STDNT "
                + "AND PMF_STDNT.ID_INST = PMF_INST.ID_INST " + "AND PMF_USER_STDNT_MAP.ID_USER_INFO =  " + userId;
        try
        {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next())
            {
                PAMFStudentBean studentBean = new PAMFStudentBean();
                PAMFInstituteBean instituteBean = new PAMFInstituteBean();
                studentBean.setStudentId(rs.getInt("PMF_STDNT.ID_STDNT"));
                studentBean.setInstId(rs.getShort("PMF_STDNT.ID_INST"));
                studentBean.setInstClassDivMapId(rs.getInt("PMF_STDNT.ID_INST_CLS_DIV_MAP"));
                studentBean.setContactNo(rs.getBigDecimal("PMF_STDNT.CNCT_PHN").toBigInteger());
                studentBean.setGaurdianName(rs.getString("PMF_STDNT.NM_GRDN"));
                studentBean.setFirstName(rs.getString("PMF_STDNT.FN_STDNT"));
                studentBean.setLastName(rs.getString("PMF_STDNT.LN_STDNT"));
                studentBean.setGeneralRegNo(rs.getInt("PMF_STDNT.ID_GEN_RGSTR"));
                studentBean.setDateOfBirth(rs.getDate("PMF_STDNT.DOB_STDNT"));
                studentBean.setEmail(rs.getString("PMF_STDNT.EML_STDNT"));
                studentBean.setFeeAmountDue(rs.getFloat("PMF_STDNT.FE_AMT_DUE"));
                studentBean.setFeePaid(rs.getString("PMF_STDNT.FE_PAID"));
                studentBean.setLateFeeAmount(rs.getFloat("PMF_STDNT.LATE_FE_AMT"));
                studentBean.setDueDate(rs.getDate("PMF_STDNT.DATE_DUE"));
                // studentBean.setStudentClass(rs.getString("PMF_INST_CLS_DIV_MAP.CLS_STDNT"));
                // studentBean.setDiv(rs.getString("PMF_INST_CLS_DIV_MAP.DIV_STDNT"));
                instituteBean.setInstituteId(studentBean.getInstId());
                instituteBean.setInstituteName(rs.getString("PMF_INST.NM_INST"));
                instituteBean.setInstituteAddress(rs.getString("PMF_INST.ADS_INST"));
                instituteBean.setContactNo(new BigInteger(rs.getString("PMF_INST.CNCT_PHN")));
                instituteBean.setInstituteEmail(rs.getString("PMF_INST.EML_INST"));
                instituteBean.setIsActive(rs.getInt("PMF_INST.ST_INST"));
                studentBean.setInstituteBean(instituteBean);
                studentBeanList.add(studentBean);

                studentIDs.add((Integer)studentBean.getInstClassDivMapId());
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

        String inClause = ArrayUtils.toString(studentIDs);
        inClause = inClause.replace("[", "(");
        inClause = inClause.replace("]", ")");
        studentBeanList = getStudentClassDivById(inClause, studentBeanList);

        return studentBeanList;
    }

    public ArrayList<PAMFStudentBean> getStudentClassDivById(String inClause, ArrayList<PAMFStudentBean> studentBeanList)
    {
        String sql = "SELECT CLS_STDNT, DIV_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST_CLS_DIV_MAP IN " + inClause;
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int index = 0;
            while (rs.next())
            {
                studentBeanList.get(index).setStudentClass(rs.getString("CLS_STDNT"));
                studentBeanList.get(index).setDiv(rs.getString("DIV_STDNT"));
                index++;
                if (studentBeanList.size() < index)
                {
                    break;
                }
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstmt, rs, conn);
        }
        return studentBeanList;

    }

    public PAMFInstituteFeeStructure getPaymentInfo(PAMFStudentBean selectedStudent)
    {
        Connection conn = DBUtil.getInstance().getConnection();
        PAMFInstituteFeeStructure feeStructureBean = new PAMFInstituteFeeStructure();
        String sql = "SELECT " + COLUMN_RULEID + "," + COLUMN_INSTITUTECLASSDIVISIONMAPID + "," + COLUMN_FEESTRUCTURE
                + " FROM " + TABLE_INSTITUTEFEESTRUCTURE + " WHERE " + COLUMN_INSTITUTECLASSDIVISIONMAPID + "=?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = conn.prepareStatement(sql);

            int mappingId = selectedStudent.getInstClassDivMapId();
            pstmt.setInt(1, mappingId);

            rs = pstmt.executeQuery();
            while (rs.next())
            {
                int ruleId = rs.getInt(COLUMN_RULEID);
                mappingId = rs.getInt(COLUMN_INSTITUTECLASSDIVISIONMAPID);
                String feeStruct = PAMFUtilities.convertClobToString(rs.getClob(COLUMN_FEESTRUCTURE));

                feeStructureBean.setRuleID(ruleId);
                feeStructureBean.setInstClassDivMapId(mappingId);
                feeStructureBean.setFeeStructure(feeStruct);
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(pstmt, rs, conn);
        }
        return feeStructureBean;
    }
}
