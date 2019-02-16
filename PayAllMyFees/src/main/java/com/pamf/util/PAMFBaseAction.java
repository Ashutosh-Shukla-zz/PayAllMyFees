package com.pamf.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class PAMFBaseAction extends ActionSupport implements ServletRequestAware, SessionAware
{

    private static final long serialVersionUID = 3178772193587523977L;

    protected HttpServletRequest request = null;

    public Map<String, Object> session = null;

    @Override
    public void setServletRequest(HttpServletRequest request)
    {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> session)
    {
        this.session = session;
    }

}
