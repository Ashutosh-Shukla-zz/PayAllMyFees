package com.pamf.result;

public class PAMFResultBean
{
    private int resultId = -1;

    private int instituteClassDivId = -1;

    private int studentId = -1;

    private String ResultUrl = null;

    private String ResultDescription = null;

    public PAMFResultBean()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PAMFResultBean(int resultId, int instituteClassDivId, int studentId, String resultUrl,
            String resultDescription)
    {
        super();
        this.resultId = resultId;
        this.instituteClassDivId = instituteClassDivId;
        this.studentId = studentId;
        ResultUrl = resultUrl;
        ResultDescription = resultDescription;
    }

    public int getResultId()
    {
        return resultId;
    }

    public void setResultId(int resultId)
    {
        this.resultId = resultId;
    }

    public int getInstituteClassDivId()
    {
        return instituteClassDivId;
    }

    public void setInstituteClassDivId(int instituteClassDivId)
    {
        this.instituteClassDivId = instituteClassDivId;
    }

    public int getStudentId()
    {
        return studentId;
    }

    public void setStudentId(int studentId)
    {
        this.studentId = studentId;
    }

    public String getResultUrl()
    {
        return ResultUrl;
    }

    public void setResultUrl(String resultUrl)
    {
        ResultUrl = resultUrl;
    }

    public String getResultDescription()
    {
        return ResultDescription;
    }

    public void setResultDescription(String resultDescription)
    {
        ResultDescription = resultDescription;
    }

}
