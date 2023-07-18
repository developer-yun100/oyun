package com.oyun.webUtil;

import org.apache.catalina.session.StandardSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class SessionUtil {

    private static HttpSession SESSION;

    public static void setSesstion(HttpServletRequest req, Map<String, Object> params){
        SESSION = req.getSession();
        SESSION.setAttribute("email", (String)params.get("email"));
        SESSION.setAttribute("name", (String)params.get("name"));
        SESSION.setAttribute("isCheck", 1);
        SESSION.setMaxInactiveInterval(60 * 30);
    }

    public static boolean sessionCheck(HttpServletRequest req){
        if(SESSION == null || !req.isRequestedSessionIdValid()){
            return true;
        } else {
            return false;
        }
    }

    public static HttpSession getSession(){
        return SESSION;
    }

    public static void sessionInvalidate(){
        SESSION.invalidate();
        SESSION = null;
    }


}
