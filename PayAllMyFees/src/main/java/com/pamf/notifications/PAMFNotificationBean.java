package com.pamf.notifications;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PAMFNotificationBean
{

    private int InstituteId = -1;

    public ArrayList<PAMFClass> classList = null;

    private String Message = null;

    private String Std_Id = null;

    private String Div_Id = "";

    // private HashMap<String, String> classMap = null;

    public Map<String, ArrayList<String>> classMap = null;

    public PAMFNotificationBean()
    {
        super();
    }

    public PAMFNotificationBean(int instituteId, ArrayList<PAMFClass> classList, String message)
    {
        super();
        setInstituteId(instituteId);
        this.classList = classList;
        Message = message;
    }

    public ArrayList<PAMFClass> getClassList()
    {
        return classList;
    }

    public void setClassList(ArrayList<PAMFClass> classList)
    {
        this.classList = classList;
    }

    public String getMessage()
    {
        return Message;
    }

    public void setMessage(String message)
    {
        Message = message;
    }

    public Map<String, ArrayList<String>> getClassMap()
    {
        listToMap(getClassList());
        return classMap;
    }

    public void setClassMap(Map<String, ArrayList<String>> classMap)
    {
        this.classMap = classMap;
    }

    public void listToMap(ArrayList<PAMFClass> list)
    {
        // HashMap<String, String> classMap = new HashMap<String, String>();

        Map<String, ArrayList<String>> classMap = new HashMap<String, ArrayList<String>>();

        for (int i = 0; i < list.size(); i++)
        {
            classMap.put(list.get(i).getClassId(), list.get(i).getDivision());
        }
        this.classMap = classMap;
    }

    public String getStd_Id()
    {
        return Std_Id;
    }

    public void setStd_Id(String Std_Id)
    {
        this.Std_Id = Std_Id;
    }

    public String getDiv_Id()
    {
        return Div_Id;
    }

    public void setDiv_Id(String Div_Id)
    {
        this.Div_Id = Div_Id;
    }

    public int getInstituteId()
    {
        return InstituteId;
    }

    public void setInstituteId(int InstituteId)
    {
        this.InstituteId = InstituteId;
    }

}
