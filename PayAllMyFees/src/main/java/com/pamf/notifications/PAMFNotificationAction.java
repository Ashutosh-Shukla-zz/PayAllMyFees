package com.pamf.notifications;

import java.util.ArrayList;

import com.pamf.util.PAMFBaseAction;

public class PAMFNotificationAction extends PAMFBaseAction
{

    private static final long serialVersionUID = -8306050764144489102L;

    public PAMFNotificationBean notificationBean = new PAMFNotificationBean();

    public PAMFNotificationBean getNotificationBean()
    {
        return notificationBean;
    }

    public void setNotificationBean(PAMFNotificationBean notificationBean)
    {
        this.notificationBean = notificationBean;
    }

    public String sendNotification()
    {
        ArrayList<PAMFClass> pamfClass = new ArrayList<PAMFClass>();

        int credentialID;// = (int) session.getAttribute("credentialID");TO DO:
                         // TODO: Ashu to read it from session
        credentialID = 32;

        PAMFNotificationModel pamfModel = new PAMFNotificationModel();
        pamfClass = pamfModel.getPamfClass(credentialID);
        notificationBean.setInstituteId(credentialID);
        notificationBean.setClassList(pamfClass);
        session.put("pamfClass", pamfClass);

        return "success";
    }

    public String insertNotification()
    {
        int inst_cls_div_map_id = 0;
        String strMessage = "error";
        ArrayList<String> divisions = null;

        int credentialID;// = (int) session.getAttribute("credentialID"); TO DO:
                         // TODO: Ashu to read it from session
        credentialID = 32;

        ArrayList<PAMFClass> pamfClass = (ArrayList<PAMFClass>)session.get("pamfClass");
        PAMFNotificationModel pamfModel = new PAMFNotificationModel();

        if (notificationBean.getDiv_Id().length() <= 0)
        {
            for (int i = 0; i < pamfClass.size(); i++)
            {
                if (pamfClass.get(i).getClassId().equalsIgnoreCase(notificationBean.getStd_Id()))
                {
                    divisions = pamfClass.get(i).getDivision();
                }
            }
            // divisions=pamfModel.getDivisionbyClass(notificationBean.getStd_Id());
        }
        else
        {
            divisions.add(notificationBean.getDiv_Id());
        }

        if (divisions != null)
        {
            for (int i = 0; i < divisions.size(); i++)
            {
                inst_cls_div_map_id = pamfModel.getDivMapId(credentialID, notificationBean.getStd_Id(),
                        divisions.get(i));
                strMessage = pamfModel.insertNotification(inst_cls_div_map_id, notificationBean.getMessage());
            }
        }
        else
        {
            inst_cls_div_map_id = pamfModel.getDivMapId(credentialID, notificationBean.getStd_Id(),
                    notificationBean.getDiv_Id());
            strMessage = pamfModel.insertNotification(inst_cls_div_map_id, notificationBean.getMessage());
        }

        return strMessage;
    }
}