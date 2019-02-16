package com.pamf.notifications;
import java.util.Date;

public class PAMFStudentNotifications
{
 
    private String notificationMessage =null;
    private int notificationDiv_Map_Id =-1;
    private String student_Id =null;
    private Date createdDate=null;
    
    public String getNotificationMessage()
    {
        return notificationMessage;
    }
    public void setNotificationMessage(String notificationMessage)
    {
        this.notificationMessage = notificationMessage;
    }
    
    public String getStudent_Id()
    {
        return student_Id;
    }
    public void setStudent_Id(String student_Id)
    {
        this.student_Id = student_Id;
    }
    public Date getCreatedDate()
    {
        return createdDate;
    }
    public void setCreatedDate(Date createdDate)
    {
        this.createdDate = createdDate;
    }
    public int getNotificationDiv_Map_Id()
    {
        return notificationDiv_Map_Id;
    }
    public void setNotificationDiv_Map_Id(int notificationDiv_Map_Id)
    {
        this.notificationDiv_Map_Id = notificationDiv_Map_Id;
    }
}
