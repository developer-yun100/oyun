package com.serviceUtil;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class PagingUtil {

    public Map<String, Object> paging(int totalCnt, int clickPage, int pageGroupSize){
        Map<String, Object> rMap = new HashMap<String, Object>();

        List<Map<String, Object>> blockList = new ArrayList<Map<String, Object>>();
        int pageNumber = 0;

        int lastPage = (totalCnt % pageGroupSize) == 0 ? (totalCnt / pageGroupSize) : (totalCnt / pageGroupSize) +1;

        for(int i = 1; i <= (pageGroupSize); i++){
            int q = (clickPage % pageGroupSize) == 0 ? (clickPage / pageGroupSize) -1 : (clickPage / pageGroupSize);
            pageNumber = (Integer)(q * pageGroupSize + i);

            if(lastPage < pageNumber){
                break;
            }

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", pageNumber);
            blockList.add(map);
        }

        int firstPage = 0;
        if(totalCnt > 0){
            firstPage = 1;
        }

        int prevPage = 0;
        int nextPage = 0;

        if(clickPage < lastPage && clickPage > firstPage){
            prevPage = clickPage - 1;
            nextPage = clickPage + 1;

        } else {
            prevPage = clickPage - 1;
            nextPage = clickPage;

            if(prevPage == 0){
                prevPage = 1;
                nextPage = nextPage + 1;
            }

            if(nextPage == lastPage){
                nextPage = lastPage;
                prevPage = lastPage - 1;
            }
        }

        rMap.put("blockPage", blockList);
        rMap.put("firstPage", firstPage);
        rMap.put("prevPage", prevPage);
        rMap.put("nextPage", nextPage);
        rMap.put("lastPage", lastPage);
        return rMap;
    }

}
