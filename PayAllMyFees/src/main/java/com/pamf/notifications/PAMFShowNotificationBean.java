package com.pamf.notifications;

import java.util.ArrayList;

public class PAMFShowNotificationBean
{

    public ArrayList<PAMFStudentNotifications> studentNotificationList = null;

    public PAMFShowNotificationBean()
    {
        super();
    }

    public PAMFShowNotificationBean(ArrayList<PAMFStudentNotifications> studentNotificationList)
    {
        super();
        this.studentNotificationList = studentNotificationList;       
    }

    public ArrayList<PAMFStudentNotifications> getStudentNotificationList()
    {
        return studentNotificationList;
    }

    public void setStudentNotificationList(ArrayList<PAMFStudentNotifications> studentNotificationList)
    {
        this.studentNotificationList = studentNotificationList;
    }

   
}
