package com.pamf.institute;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.pamf.admin.PAMFAdminModel;
import com.pamf.login.PAMFLoginBean;
import com.pamf.user.PAMFStudentBean;
import com.pamf.util.PAMFBaseAction;
import com.pamf.util.PAMFDownloadToExcelUtil;

public class InstituteAction extends PAMFBaseAction implements ModelDriven<InstituteForm>
{

    public ArrayList<PAMFStudentBean> studentList = new ArrayList<PAMFStudentBean>();
    
    
    public ArrayList<PAMFStudentBean> getStudentList()
    {
        return studentList;
    }

    public void setStudentList(ArrayList<PAMFStudentBean> studentList)
    {
        this.studentList = studentList;
    }

    private static final long serialVersionUID = 1L;

    public InstituteForm form = new InstituteForm();

    public static SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");

    private InstituteModel instituteModel = new InstituteModel();

    public String showDashboard()
    {
        session = ActionContext.getContext().getSession();
        PAMFLoginBean pbean = (PAMFLoginBean)session.get("loginInfo");
        studentList = instituteModel.getStudentBeanListByInstituteId(pbean.getLoginId(),null,null);
        session.put("instituteID", studentList.get(0).getInstId());
        setStudentList(studentList);
        // form.setClassDivCombo(instituteModel.getDashboardCombo(pbean.getLoginId()));

        return "showDashboard";
    }

    public String exportData()
    {       
        session = ActionContext.getContext().getSession();
        PAMFLoginBean pbean = (PAMFLoginBean)session.get("loginInfo");
        studentList = instituteModel.getStudentBeanListByInstituteId(pbean.getLoginId(), form.getClassName(),form.getDiv() );
        PAMFDownloadToExcelUtil downloadExcelUtil = new PAMFDownloadToExcelUtil();
        downloadExcelUtil.downloadExcel(studentList,pbean.getLoginId());
        
        return "exportData";
    }
    
    public String fetchDivisions(){
    	form.setDivList(instituteModel.fetchDivisions((int)session.get("instituteID"), form.getClassName()));
		
    	HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			
			// TODO: Remove stack trace
			e.printStackTrace();
		}
			StringBuilder divSelectBox = new StringBuilder();
			divSelectBox.append("<option value=\"\">").append("Select Division").append("</option>");
			for (String div : form.getDivList()){
				divSelectBox.append("<option value=\"").append(div).append("\">").append(div).append("</option>");
				divSelectBox.append("\n");
			}
			out.print(divSelectBox.toString());
			out.flush();
			out.close();
		

		
    	return "fetchDivisions";
    }
    
    public String UploadData()
    {
    	form.setClassList(instituteModel.fetchClasses((int)session.get("instituteID")));
    	
        if (form != null && form.getFileName() != null && !"".equals(form.getFileName().trim()))
        {

            String fileName = form.getFileName();
            if (fileName != null)
            {
                try
                {
                    File excelFile = (File)form.getFile();
                    Workbook workbook = null;
                    if (fileName.endsWith(".xls"))
                    {
                        workbook = new HSSFWorkbook(new FileInputStream(excelFile));
                    }
                    else if (fileName.endsWith(".xlsx"))
                    {
                        workbook = WorkbookFactory.create(new FileInputStream(excelFile));
                    }
                    Sheet sheet = workbook.getSheetAt(0);
                    int rows = sheet.getLastRowNum();
                    int cols = 0;
                    Cell cell;
                    int tmp;
                    ArrayList<DataUploadVO> al;
                    String[] headerArray;
                    Row row = sheet.getRow(0);

                    for (int i = 0; i < rows; i++)
                    {
                        row = sheet.getRow(i);
                        if (row != null)
                        {
                            tmp = sheet.getRow(i).getPhysicalNumberOfCells();
                            if (tmp > cols)
                                cols = tmp;
                        }
                    }
                    headerArray = new String[cols];
                    for (int i = 0; i < 1; i++)
                    {
                        row = sheet.getRow(i);
                        if (row != null)
                        {
                            for (int c = 0; c < cols; c++)
                            {
                                cell = row.getCell((short)c);
                                if (cell != null && !"".equals(cell.toString().trim()))
                                {
                                    headerArray[c] = (cell.getStringCellValue()).toUpperCase();
                                }
                            }
                        }
                    }
                    al = new ArrayList<DataUploadVO>();

                    outer: for (int i = 1; i <= rows; i++)
                    {

                        row = sheet.getRow(i);
                        if (row != null)
                        {
                            DataUploadVO dataVO = new DataUploadVO();
                            inner: for (int c = 0; c < cols; c++)
                            {

                                cell = row.getCell((short)c);
                                if (cell != null)
                                {
                                    if ((cell.getCellType() == HSSFCell.CELL_TYPE_STRING || cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC )&& c == 0)// Class
                                    {
                                    	if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING )
                                    		dataVO.setClassName(cell.getStringCellValue());
                                    	else 
                                    		dataVO.setClassName(String.valueOf((int)cell.getNumericCellValue()));
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 1
                                            && cell.getStringCellValue() != null)// Div
                                    {
                                        dataVO.setDiv(cell.getStringCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 2
                                            && cell.getStringCellValue() != null)// Guardian
                                                                                 // Name
                                    {
                                        dataVO.setGuardianName(cell.getStringCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC && c == 3
                                            && cell.getNumericCellValue() != 0)// Guardian
                                                                               // Phone
                                                                               // Number
                                    {
                                        dataVO.setGuardianPhoneNumber((int)cell.getNumericCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 4
                                            && cell.getStringCellValue() != null)// First
                                                                                 // Name
                                    {
                                        dataVO.setFirstName((cell.getStringCellValue()));
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 5
                                            && cell.getStringCellValue() != null)// Last
                                                                                 // Name
                                    {
                                        dataVO.setLastName((cell.getStringCellValue()));
                                    }
                                    else if ((cell.getCellType() == HSSFCell.CELL_TYPE_STRING || cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC )&& c == 6)// 
                                    {
                                    	if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING )
                                    		dataVO.setGeneralRegisterNumber(cell.getStringCellValue());
                                    	else 
                                    		dataVO.setGeneralRegisterNumber(String.valueOf(cell.getNumericCellValue()));
                                    }
                                    else if (c == 7 && cell.getStringCellValue() != null)// Date
                                                                                       // Of
                                                                                       // Birth
                                    {
                                        dataVO.setDateOfBirth(formatter.parse(cell.getStringCellValue()));
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 8
                                            && cell.getStringCellValue() != null)// Student
                                                                                 // Email
                                    {
                                        dataVO.setStudentEmail(cell.getStringCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC && c == 9)// Fees
                                                                               // Amount
                                                                               // Due
                                    {
                                        dataVO.setFeesAmountDue(cell.getNumericCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING && c == 10
                                            && cell.getStringCellValue() != null)// Fees
                                                                                 // Paid
                                    {
                                        dataVO.setFeesPaid(cell.getStringCellValue());
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC && c == 11)// Late
                                                                               // Fees
                                                                               // Amount
                                    {
                                        dataVO.setLateFeesAmount(cell.getNumericCellValue());
                                    }
                                    else if (c == 12 && cell.getStringCellValue() != null && !"".equals(cell.getStringCellValue().trim()))// Date Due
                                    {
                                        dataVO.setDateDue(formatter.parse(cell.getStringCellValue()));
                                    }
                                    else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC && c == 13
											&& cell.getNumericCellValue() != 0)// Institute
									// ID
									{
										dataVO.setInstituteID((int) cell
												.getNumericCellValue());
									} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC
											&& c == 14
											&& cell.getNumericCellValue() != 0)// Student
																				// ID
									{
										dataVO.setStudentID((int) cell
												.getNumericCellValue());
									} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC
											&& c == 15
											&& cell.getNumericCellValue() != 0)// Institute
																				// Class
																				// Division
																				// Map
																				// ID
									{
										dataVO.setInstituteClassDivisionMapID((int) cell
												.getNumericCellValue());
									}
                                    else
                                    {
                                        System.out.println("Extra field :: " + c);
                                    }
                                }

                            }
                            if(dataVO.getInstituteID()==0)
                            	dataVO.setInstituteID((int)session.get("instituteID"));
                            
                            al.add(dataVO);
                        }

                    }

                    if (al.size() > 0)
                    {

                       instituteModel.insertData(al);
                    }
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
            }

        }
        return "uploadData";
    }

    @Override
    public InstituteForm getModel()
    {
        // TODO Auto-generated method stub
        return form;
    }

}
