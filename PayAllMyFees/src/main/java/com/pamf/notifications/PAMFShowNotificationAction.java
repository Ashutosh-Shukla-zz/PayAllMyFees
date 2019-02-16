package com.pamf.notifications;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.pamf.util.PAMFBaseAction;

public class PAMFShowNotificationAction extends PAMFBaseAction
{
    private static final long serialVersionUID = -3354418020006942447L;

    public int studentId = -1;

    public PAMFShowNotificationBean ShowNotificationBeanBean = new PAMFShowNotificationBean();

    public PAMFShowNotificationBean getNotificationBean()
    {
        return ShowNotificationBeanBean;
    }

    public void setNotificationBean(PAMFShowNotificationBean ShowNotificationBeanBean)
    {
        this.ShowNotificationBeanBean = ShowNotificationBeanBean;
    }

    public int getStudendId()
    {
        return studentId;
    }

    public void setStudendId(int studendId)
    {
        this.studentId = studendId;
    }

    public String showNotificationByStudentID()
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
        PAMFNotificationModel pamfModel = new PAMFNotificationModel();

        int div_map_id = pamfModel.getStudentDivMapId(getStudendId());

        if (div_map_id != -1)
            ShowNotificationBeanBean = pamfModel.getPamfNotificationsForStudent(div_map_id);
        responseStr = getResultAjax(ShowNotificationBeanBean.getStudentNotificationList(), responseStr);
        out.print(responseStr);
        out.flush();
        out.close();
        if (!ShowNotificationBeanBean.getStudentNotificationList().isEmpty())
            return SUCCESS;
        else
            return ERROR;
    }

    private String getResultAjax(ArrayList<PAMFStudentNotifications> notificationList, String responseStr)
    {
        int i = 1;
        String str = "";
        Iterator<PAMFStudentNotifications> iter = notificationList.iterator();
        while (iter.hasNext())
        {
            PAMFStudentNotifications notification = new PAMFStudentNotifications();
            notification = iter.next();
            str = "  <tr role=\"row\" class=\"odd\">" + "      <td class=\"sorting_1\">" + i + "</td>" + "   <td>"
                    + notification.getNotificationMessage() + "</td>" + "     <td>" + notification.getCreatedDate()
                    + "</td>" + "   </tr>";
            responseStr = responseStr + str;
        }

        return responseStr;
        // TODO Auto-generated method stub

    }

}
