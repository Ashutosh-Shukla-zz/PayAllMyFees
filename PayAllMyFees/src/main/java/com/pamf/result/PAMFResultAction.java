package com.pamf.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.pamf.user.PAMFStudentBean;
import com.pamf.user.PAMFUserBean;
import com.pamf.util.PAMFBaseAction;

public class PAMFResultAction extends PAMFBaseAction
{

    private static final long serialVersionUID = -7292783367929367297L;

    public int studentId;

    public ArrayList<PAMFResultBean> resultList = new ArrayList<PAMFResultBean>();

    public PAMFStudentBean studentbean = new PAMFStudentBean();

    public ArrayList<PAMFResultBean> getResultList()
    {
        return resultList;
    }

    public void setResultList(ArrayList<PAMFResultBean> resultList)
    {
        this.resultList = resultList;
    }

    public PAMFStudentBean getStudentbean()
    {
        return studentbean;
    }

    public void setStudentbean(PAMFStudentBean studentbean)
    {
        this.studentbean = studentbean;
    }

    public int getStudentId()
    {
        return studentId;
    }

    public void setStudentId(int studentId)
    {
        // this.studentId = Integer.parseInt(request.getParameter("studentId"));
        this.studentId = studentId;
    }

    public String showResult()
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = null;
        try
        {
            out = response.getWriter();
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String responseStr = "";
        PAMFUserBean userBean = (PAMFUserBean)session.get("userbean");
        ArrayList<PAMFStudentBean> studentList = userBean.getMappedStudentList();
        PAMFStudentBean selectedStudent = null;
        for (PAMFStudentBean student : studentList)
        {
            if (student.getStudentId() == getStudentId())
            {
                selectedStudent = student;
                break;
            }
        }

        setStudentbean(selectedStudent);
        resultList = new PAMFResultModel().getResultListByStudent(selectedStudent.getStudentId());
        responseStr = getResultAjax(resultList, responseStr);
        setResultList(resultList);
        out.print(responseStr);
        out.flush();
        out.close();
        if (!resultList.isEmpty())
            return SUCCESS;
        else
            return ERROR;

    }

    private String getResultAjax(ArrayList<PAMFResultBean> resultList2, String responseStr)
    {
        int i = 1;
        String str = "";
        Iterator<PAMFResultBean> iter = resultList2.iterator();
        while (iter.hasNext())
        {
            PAMFResultBean resultBean = new PAMFResultBean();
            resultBean = iter.next();
            str  =  "  <tr role=\"row\" class=\"odd\">"
                    + "      <td class=\"sorting_1\">"+i+"</td>"
                    + "   <td>"+resultBean.getResultId()+"</td>"
                     + "     <td>"+resultBean.getResultDescription()+"</td>"
                    + "      <td>"+resultBean.getResultUrl()+"</td>"
                   + "   </tr>";
            responseStr = responseStr + str;
        }

        return responseStr;
        // TODO Auto-generated method stub

    }
}
