package com.pamf.student;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.pamf.user.PAMFInstituteBean;
import com.pamf.user.PAMFStudentBean;
import com.pamf.util.DBUtil;
import com.pamf.util.PAMFUtilities;

public class PAMFStudentDAO
{

    private static Logger logger = Logger.getLogger(PAMFStudentDAO.class);

    public List<PAMFStudentBean> searchStudentsByParams(BigInteger contact, int instituteId, Date dateOfBirth)
    {
        StringBuilder buildSql = new StringBuilder();
        buildSql.append("SELECT ");
        buildSql.append("STDNT.ID_STDNT, ");
        buildSql.append("STDNT.ID_INST_CLS_DIV_MAP, ");
        buildSql.append("STDNT.NM_GRDN, ");
        buildSql.append("STDNT.CNCT_PHN, ");
        buildSql.append("STDNT.FN_STDNT, ");
        buildSql.append("STDNT.LN_STDNT, ");
        buildSql.append("STDNT.ID_GEN_RGSTR, ");
        buildSql.append("STDNT.DOB_STDNT, ");
        buildSql.append("STDNT.EML_STDNT, ");
        buildSql.append("STDNT.FE_AMT_DUE, ");
        buildSql.append("STDNT.FE_PAID, ");
        buildSql.append("STDNT.LATE_FE_AMT, ");
        buildSql.append("INST.ID_INST, ");
        buildSql.append("INST.NM_INST, ");
        buildSql.append("INST.ADS_INST, ");
        buildSql.append("INST.CNCT_PHN, ");
        buildSql.append("INST.EML_INST, ");
        buildSql.append("INST.ST_INST, ");
        buildSql.append("INST.ID_RGN ");
        buildSql.append("FROM PMF_STDNT STDNT, PMF_INST INST ");
        buildSql.append("WHERE STDNT.ID_INST = INST.ID_INST ");
        buildSql.append("AND INST.ID_INST = ? ");
        buildSql.append("AND STDNT.CNCT_PHN = ? ");
        buildSql.append("AND STDNT.DOB_STDNT = ?");
        String sql = buildSql.toString();

        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<PAMFStudentBean> studentList = new ArrayList<PAMFStudentBean>();
        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, instituteId);
            pstm.setBigDecimal(2, new BigDecimal(contact));
            pstm.setDate(3, PAMFUtilities.convertJavaDateToSQLDate(dateOfBirth));

            logger.info("com.pamf.student.PAMFStudentDAO.searchStudentsByParams(BigInteger, int, String) - SQL : "
                    + pstm.toString());

            rs = pstm.executeQuery();
            while (rs.next())
            {
                PAMFStudentBean student = new PAMFStudentBean();
                student.setStudentId(rs.getInt(1));
                student.setInstClassDivMapId(rs.getInt(2));
                student.setGaurdianName(rs.getString(3));
                student.setContactNo(rs.getBigDecimal(4).toBigInteger());
                student.setFirstName(rs.getString(5));
                student.setLastName(rs.getString(6));
                student.setGeneralRegNo(rs.getInt(7));
                student.setDateOfBirth(rs.getDate(8));
                student.setEmail(rs.getString(9));
                student.setFeeAmountDue(rs.getFloat(10));
                student.setFeePaid(rs.getString(11));
                student.setLateFeeAmount(rs.getFloat(12));

                PAMFInstituteBean institute = new PAMFInstituteBean();
                institute.setInstituteId(rs.getInt(13));
                institute.setInstituteName(rs.getString(14));
                institute.setInstituteAddress(rs.getString(15));
                institute.setContactNo(rs.getBigDecimal(16).toBigInteger());
                institute.setInstituteEmail(rs.getString(17));
                institute.setIsActive(rs.getInt(18));
                institute.setRegionId(rs.getInt(19));

                student.setInstituteBean(institute);

                studentList.add(student);
            }
        }
        catch (SQLException sqlE)
        {
            logger.error(
                    "com.pamf.student.PAMFStudentDAO.searchStudentsByParams(BigInteger, int, Date) - Error when searching for Students with params ",
                    sqlE);
        }
        finally
        {
            DBUtil.closeConnection(pstm, rs, conn);
        }

        return studentList;
    }

}
