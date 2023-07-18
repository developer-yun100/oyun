package com.oyun.webUtil;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor implements HandlerInterceptor {

    // req -> check
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
        System.out.println("Interceptor URL() => " + req.getRequestURI());
        if(SessionUtil.sessionCheck(req)){
            res.sendRedirect("/main/interceptor");
            return false;
        }
        return true;
    }

}
