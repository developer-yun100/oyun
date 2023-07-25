package com.oyun.mvc.service;

import com.serviceUtil.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MainService {

    @Autowired
    PagingUtil pagingUtil;

    public Map<String, Object> dataReq(Map<String, Object> param) throws Exception{
        Map<String, Object> rMap = new HashMap<String, Object>();
        int clickPage = Integer.parseInt(param.get("clickPage").toString()); //Integer.parseInt((String)param.get("clickPage"));

        rMap.put("paging", pagingUtil.paging(57, clickPage,5));
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for(int i = 0; i < 10; i++){
            Map<String, Object> lMap = new HashMap<String, Object>();
            lMap.put("seq", String.valueOf((i+1)));
            list.add(lMap);
        }
        rMap.put("dataList", list);
        return rMap;
    }



}
