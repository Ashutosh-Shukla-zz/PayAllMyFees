package com.pamf.institute;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pamf.user.PAMFInstituteBean;
import com.pamf.user.PAMFStudentBean;
import com.pamf.util.DBUtil;

public class InstituteDAO
{

    public HashMap<String, List<String>> getDashboardCombo(int instituteCredentialId)
    {
        HashMap<String, List<String>> classDivCombo = new HashMap<String, List<String>>();
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT ID_INST_CLS_DIV_MAP,CLS_STDNT,DIV_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST = (SELECT ID_INST FROM PMF_INST WHERE ID_USER_CRDNT = ?) order by CLS_STDNT";
        try
        {
            con = DBUtil.getInstance().getConnection();
            psmt = con.prepareStatement(query);
            psmt.setInt(1, instituteCredentialId);
            rs = psmt.executeQuery();

            while (rs.next())
            {
                if (classDivCombo != null)
                {
                    ArrayList al = (ArrayList)classDivCombo.get(rs.getObject(2));
                    if (al == null)
                    {
                        al = new ArrayList();
                    }
                    al.add(rs.getString(3) != null ? rs.getString(3) : null);
                    classDivCombo.put(rs.getString(2), al);
                }

            }

        }
        catch (SQLException sqle)
        {

            System.out.println("Error " + sqle);
        }
        catch (Exception e)
        {
            System.out.println("Error" + e);
        }
        finally
        {
            DBUtil.closeConnection(psmt, rs, con);
        }
        return classDivCombo;

    }

    public void uploadData(ArrayList<DataUploadVO> dataList)
 {
		int instituteClassDivMapId;
		String insertData = "INSERT INTO PMF_STDNT (ID_INST,ID_INST_CLS_DIV_MAP,NM_GRDN,CNCT_PHN,FN_STDNT,LN_STDNT,ID_GEN_RGSTR,DOB_STDNT,EML_STDNT,FE_AMT_DUE,FE_PAID,LATE_FE_AMT,DATE_DUE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String updateData = "UPDATE PMF_STDNT SET ID_INST= ?,ID_INST_CLS_DIV_MAP = ? ,NM_GRDN = ?, CNCT_PHN = ? ,FN_STDNT = ?,"
				+ "LN_STDNT = ?,ID_GEN_RGSTR = ?, DOB_STDNT = ?,EML_STDNT = ?,FE_AMT_DUE = ?,FE_PAID = ? ,LATE_FE_AMT = ?,"
				+ "DATE_DUE = ?, TS_MDF_RCRD = NOW() WHERE ID_STDNT = ?";
		Connection con = null;
		PreparedStatement psmt = null;

		try {
			for (DataUploadVO data : dataList) {
				int updateCount = 0;

				instituteClassDivMapId = getInstituteClassDivMapID(data.getInstituteID(), data.getClassName(),data.getDiv());
				if (instituteClassDivMapId < 0) {
					createNewInstituteClassDivMapID(data.getInstituteID(),data.getClassName(), data.getDiv());
					instituteClassDivMapId = getInstituteClassDivMapID(data.getInstituteID(), data.getClassName(),data.getDiv());
				}

				con = DBUtil.getInstance().getConnection();

				if (data.getStudentID() != 0) {

					psmt = con.prepareStatement(updateData);
					psmt.setInt(1, data.getInstituteID());
					psmt.setInt(2, instituteClassDivMapId);
					psmt.setString(3, data.getGuardianName());
					psmt.setInt(4, data.getGuardianPhoneNumber());
					psmt.setString(5, data.getFirstName());
					psmt.setString(6, data.getLastName());
					psmt.setString(7, data.getGeneralRegisterNumber());

					java.sql.Date sql = new java.sql.Date(data.getDateOfBirth().getTime());
					psmt.setDate(8, sql);

					psmt.setString(9, data.getStudentEmail());
					psmt.setDouble(10, data.getFeesAmountDue());
					psmt.setString(11, data.getFeesPaid());
					psmt.setDouble(12,data.getLateFeesAmount() != null ? data.getLateFeesAmount() : 0.00);

					if (data.getDateDue() != null)
						sql = new java.sql.Date(data.getDateDue().getTime());
					else
						sql = null;
					psmt.setDate(13, sql);

					psmt.setInt(14, data.getStudentID());
					updateCount = psmt.executeUpdate();
					psmt.close();
				}

				if (updateCount <= 0) {
					psmt = con.prepareStatement(insertData);
					psmt.setInt(1, data.getInstituteID());
					psmt.setInt(2, instituteClassDivMapId);
					psmt.setString(3, data.getGuardianName());
					psmt.setInt(4, data.getGuardianPhoneNumber());
					psmt.setString(5, data.getFirstName());
					psmt.setString(6, data.getLastName());
					psmt.setString(7, data.getGeneralRegisterNumber());
					java.sql.Date sql = new java.sql.Date(data.getDateOfBirth().getTime());

					psmt.setDate(8, sql);
					psmt.setString(9, data.getStudentEmail());
					psmt.setDouble(10, data.getFeesAmountDue());
					psmt.setString(11, data.getFeesPaid());
					psmt.setDouble(12,data.getLateFeesAmount() != null ? data.getLateFeesAmount() : 0.00);

					sql = new java.sql.Date(data.getDateDue().getTime());
					psmt.setDate(13, sql);
					psmt.execute();
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DBUtil.closeConnection(psmt, null, con);
		}

	}

    public int getInstituteClassDivMapID(int instituteID, String studentClass, String studentDiv)
    {
        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int instituteClassDivMapID = -1;
        String sql = "SELECT ID_INST_CLS_DIV_MAP FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST= ? AND CLS_STDNT=? AND DIV_STDNT=?";
        try
        {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, instituteID);
            psmt.setString(2, studentClass);
            psmt.setString(3, studentDiv);
            rs = psmt.executeQuery();
            if (rs.next())
            {
            	instituteClassDivMapID = rs.getInt("ID_INST_CLS_DIV_MAP");
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        finally
        {
            DBUtil.closeConnection(psmt, rs, con);
        }
        return instituteClassDivMapID;
    }
    
	private void createNewInstituteClassDivMapID(int instituteID,String studentClass, String studentDiv) {
		Connection con = DBUtil.getInstance().getConnection();
		PreparedStatement psmt = null;		
		String insertQuery = "INSERT INTO PMF_INST_CLS_DIV_MAP ( ID_INST, CLS_STDNT, DIV_STDNT ) VALUES ( ? , ? , ?) ";

		try {
			psmt = con.prepareStatement(insertQuery);
            psmt.setInt(1, instituteID);
            psmt.setString(2, studentClass != null ? studentClass.trim() : null);
            psmt.setString(3, studentDiv!= null ? studentDiv.trim() : null);
            psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(psmt, null, con);
		}
	}

    public ArrayList<PAMFStudentBean> getStudentBeanListByInstituteId(int instituteCredentialId, String className, String division)
    {
        ArrayList<PAMFStudentBean> studentBeanList = new ArrayList<PAMFStudentBean>();
        ArrayList<Integer> studentIDs = new ArrayList<Integer>();

        Connection con = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String query = "SELECT PMF_STDNT.ID_STDNT, PMF_STDNT.ID_INST, PMF_STDNT.ID_INST_CLS_DIV_MAP, PMF_STDNT.NM_GRDN, PMF_STDNT.CNCT_PHN, PMF_STDNT.FN_STDNT, PMF_STDNT.LN_STDNT, PMF_STDNT.ID_GEN_RGSTR, PMF_STDNT.DOB_STDNT, PMF_STDNT.EML_STDNT, PMF_STDNT.FE_AMT_DUE, PMF_STDNT.FE_PAID, PMF_STDNT.LATE_FE_AMT, PMF_STDNT.DATE_DUE, "
                + "PMF_INST.NM_INST, PMF_INST.ADS_INST, PMF_INST.CNCT_PHN, PMF_INST.EML_INST, PMF_INST.ST_INST, PMF_INST_CLS_DIV_MAP.CLS_STDNT, PMF_INST_CLS_DIV_MAP.DIV_STDNT "
                + "FROM PMF_STDNT, PMF_INST , PMF_INST_CLS_DIV_MAP "
                + "WHERE PMF_STDNT.ID_INST_CLS_DIV_MAP = PMF_INST_CLS_DIV_MAP.ID_INST_CLS_DIV_MAP "
                + "AND PMF_INST.ID_INST = PMF_STDNT.ID_INST "
                + "AND PMF_STDNT.ID_INST = (SELECT ID_INST FROM PMF_INST WHERE ID_USER_CRDNT = ?) ";
        
        if (className != null && !"".equals(className.trim()))
        	query =  query + " AND PMF_INST_CLS_DIV_MAP.CLS_STDNT = ?";
        

        if (division != null && !"".equals(division.trim()))
        	query =  query + " AND PMF_INST_CLS_DIV_MAP.DIV_STDNT = ?";
        
        query = query + " GROUP BY ID_STDNT";
        System.out.println(query);
        try
        {   
            pstm = con.prepareStatement(query);
            pstm.setInt(1, instituteCredentialId);
            
            if (className != null && !"".equals(className.trim()))
            	pstm.setString(2, className.trim());

            if (division != null && !"".equals(division.trim()))
            	pstm.setString(3, division.trim());
            
            rs = pstm.executeQuery();
            while (rs.next())
            {
                PAMFStudentBean studentBean = new PAMFStudentBean();
                PAMFInstituteBean instituteBean = new PAMFInstituteBean();
                studentBean.setStudentId(rs.getInt("PMF_STDNT.ID_STDNT"));
                studentBean.setInstId(rs.getShort("PMF_STDNT.ID_INST"));
                studentBean.setInstClassDivMapId(rs.getInt("PMF_STDNT.ID_INST_CLS_DIV_MAP"));
               // studentBean.setContactNo(rs.getInt("PMF_STDNT.CNCT_PHN"));
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
                studentBean.setStudentClass(rs.getString("PMF_INST_CLS_DIV_MAP.CLS_STDNT"));
                studentBean.setDiv(rs.getString("PMF_INST_CLS_DIV_MAP.DIV_STDNT"));
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
        return studentBeanList;
    }

    
    public ArrayList<String> fetchClasses(int instituteID)
    {
        String sql = "SELECT DISTINCT CLS_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST = ? ORDER BY CLS_STDNT ASC";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<String> classes = new ArrayList<String>();

        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, instituteID);
            rs = pstm.executeQuery();
            while (rs.next())
            {
            	classes.add(rs.getString(1));
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

        return classes;
    }
    
    public ArrayList<String> fetchDivisions(int instituteID, String ClassName)
    {
        String sql = "SELECT DISTINCT DIV_STDNT FROM PMF_INST_CLS_DIV_MAP WHERE ID_INST = ? and CLS_STDNT = ? ORDER BY CLS_STDNT ASC";
        Connection conn = DBUtil.getInstance().getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<String>  divisions = new ArrayList<String>();

        try
        {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, instituteID);
            pstm.setString(2, ClassName);
            rs = pstm.executeQuery();
            while (rs.next())
            {
            	divisions.add(rs.getString(1));
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

        return divisions;
    }

    /*public ArrayList<PAMFStudentBean> getStudentClassDivById(String inClause, ArrayList<PAMFStudentBean> studentBeanList)
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
            try
            {
                rs.close();
                pstmt.close();
                conn.close();
            }
            catch (SQLException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return studentBeanList;

    }*/
}
