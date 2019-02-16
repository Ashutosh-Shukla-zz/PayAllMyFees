package com.pamf.notifications;

import java.util.ArrayList;

public class PAMFNotificationModel
{

    public ArrayList<PAMFClass> getPamfClass(int instId)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.getClasses(instId);
    }

    public int getDivMapId(int instId, String classId, String divId)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.getDivMapId(instId, classId, divId);
    }

    public String insertNotification(int ID_INST_CLS_DIV_MAP_id, String Message)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.insertNotification(ID_INST_CLS_DIV_MAP_id, Message);
    }

    public ArrayList<String> getDivisionbyClass(String classId)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.getDivisionbyClass(classId);
    }

    public PAMFShowNotificationBean getPamfNotificationsForStudent(int div_map_id)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.getPamfNotificationsForStudent(div_map_id);
    }

    public int getStudentDivMapId(int studentId)
    {
        PAMFNotificationDAO pamfDao = new PAMFNotificationDAO();
        return pamfDao.getStudentDivMapId(studentId);
    }

}
