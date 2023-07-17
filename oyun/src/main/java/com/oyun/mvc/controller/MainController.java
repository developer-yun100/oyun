package com.oyun.mvc.controller;

import com.oyun.webUtil.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@RequestMapping(value="/main")
public class MainController {

    @RequestMapping(value="/title")
    public String titleView(){
        return "/main/title";
    }

    @RequestMapping(value="/titlePopup")
    public String titlePopupView(){
        return "/main/titlePopup";
    }

    @RequestMapping(value="/interceptor")
    public String interceptorView(){
        return "/interceptorPage/interceptor";
    }

    @RequestMapping(value="/login")
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest req, HttpServletResponse res, Model model
            , @RequestBody Map<String, Object> params) throws Exception{
        System.out.println("params => " + params);
        SessionUtil.setSesstion(req, params);
        String email = (String)SessionUtil.getSession().getAttribute("email");
        String name = (String)SessionUtil.getSession().getAttribute("name");
        System.out.println("email => " + email);
        System.out.println("name => " + name);
        return params;
    }

    @RequestMapping(value="/logout")
    @ResponseBody
    public Map<String, Object> logout(HttpServletRequest req, HttpServletResponse res, Model model
            , @RequestBody Map<String, Object> params) throws Exception{
        SessionUtil.sessionInvalidate();
        return params;
    }

}
