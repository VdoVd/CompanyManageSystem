package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.SystemUserMapper;
import com.example.crm.interfacePackage.UserLoginToken;
import com.example.crm.pojo.SystemUser;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
public class UserManage {

    @Autowired
    SystemUserMapper systemUserMapper;

    @Autowired
    AllReturn allReturn;

    @UserLoginToken
    @GetMapping("/users")
    public String getUsers() {
        List<SystemUser> list=systemUserMapper.getAllUser();
        allReturn.setCode(200);
        allReturn.setMsg("查找全部用户成功");
        allReturn.setSuccess(true);
        allReturn.setData(new Gson().toJson(list));
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

    @UserLoginToken
    @GetMapping("/user/find")
    public String findUser(

            @RequestParam("username") String username,
            @RequestParam("phonenumber") String phonenumber,
            @RequestParam("state") Integer state
//            @RequestParam("create_time") Date create_time

            ) {
        List<SystemUser> list=systemUserMapper.getAllUser();
        allReturn.setCode(200);
        allReturn.setMsg("查找用户成功");
        allReturn.setSuccess(true);
        allReturn.setData(state);
        System.out.println(new Gson().toJson(allReturn));

        return new Gson().toJson(allReturn);
    }

}
