package com.oyun.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

    @RequestMapping(value="/option")
    public String optionView(){
        return "/login/admin/adminOption";
    }


}
