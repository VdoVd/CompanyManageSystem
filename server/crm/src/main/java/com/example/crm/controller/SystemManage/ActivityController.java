package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.ActivityMapper;
import com.example.crm.pojo.active.Activity;
import com.example.crm.pojo.active.ActivityResponse;
import com.example.crm.pojo.menu.Menu;
import com.example.crm.pojo.menu.MenuResponse;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Mapper
@Component
public class ActivityController {

    @Autowired
    AllReturn allReturn;

    @Autowired
    ActivityMapper activityMapper;

    @Autowired
    ActivityResponse activityResponse;

    @GetMapping("/acti/all")
    public String getAll() {
        List<Activity> lists= activityMapper.getAll();
        List<ActivityResponse> Responses=new ArrayList<>();
        Integer i=0;
        lists.forEach(item -> {
            Responses.add(new ActivityResponse(item.getId().toString(),item.getName(),item.getName(),item.getChannel(),item.getCreate_time().toString(),item.getEnd_time().toString()));
        });

        if(Responses.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("查找全部菜单成功");
            allReturn.setSuccess(true);
            allReturn.setData(Responses);
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("查找全部菜单失败");
            allReturn.setSuccess(false);
            allReturn.setData(Responses);
        }

        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

}
