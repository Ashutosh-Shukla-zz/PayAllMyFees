package com.pamf.result;

import java.util.ArrayList;

public class PAMFResultModel
{
    public ArrayList<PAMFResultBean> getResultListByStudent(int studentId)
    {
        return new PAMFResultDAO().getResultListByStudent(studentId);
    }
}
