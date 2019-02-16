package com.pamf.login;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor
{

    private static final long serialVersionUID = 4788090811631275816L;

    public String intercept(final ActionInvocation invocation) throws Exception
    {
        Map<String, Object> session = ActionContext.getContext().getSession();
        Integer userId = null;
        // sb: feel free to change this to some other type of an object which
        // represents that the user is logged in. for this example, I am using
        // an integer which would probably represent a primary key that I would
        // look the user up by with Hibernate or some other mechanism.
        if ((session != null && !session.isEmpty()))
        {
            PAMFLoginBean pbean = (PAMFLoginBean)session.get("loginInfo");
            userId = (Integer)pbean.getLoginId();
        }
        // sb: if the user is already signed-in, then let the request through.
        if (userId != null)
        {
            return invocation.invoke();
        }

        Object action = invocation.getAction();

        // sb: if the action doesn't require sign-in, then let it through.
        if (!(action instanceof LoginRequired))
        {
            return invocation.invoke();
        }

        // sb: if this request does require login and the current action is
        // not the login action, then redirect the user
        if (!(action instanceof PAMFLoginAction))
        {
            return "loginRedirect";
        }

        // sb: they either requested the login page or are submitting their
        // login now, let it through
        return invocation.invoke();
    }
}