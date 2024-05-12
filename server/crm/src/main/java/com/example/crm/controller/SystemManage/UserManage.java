package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.SystemUserMapper;
import com.example.crm.interfacePackage.UserLoginToken;
import com.example.crm.pojo.SystemUser;
import com.example.crm.pojo.sysmanage.UpdateUser;
import com.example.crm.pojo.sysmanage.deleteUser;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
        allReturn.setMessage("查找全部用户成功");
        allReturn.setSuccess(true);
        allReturn.setData(new Gson().toJson(list));
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

    @UserLoginToken
    @GetMapping("/user/find")
    public String findUser(

            @RequestParam(value = "username",required = false) String username,
            @RequestParam(value = "phonenumber",required = false) String phonenumber,
            @RequestParam(value = "state",required = false) Integer state
//            @RequestParam("create_time") Date create_time

            ) {
        List<SystemUser> systemUsers=systemUserMapper.queryUsers(username,phonenumber,state);
        if(systemUsers.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("查找用户成功");
            allReturn.setSuccess(true);
            allReturn.setData(systemUsers);
            System.out.println(new Gson().toJson(allReturn));
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("查找用户失败");
            allReturn.setSuccess(false);
            allReturn.setData(null);
            System.out.println(new Gson().toJson(allReturn));
        }

        return new Gson().toJson(allReturn);
    }

    @UserLoginToken
    @PostMapping("/user/delete")
    public String deleteUser(@RequestBody deleteUser deleteUser) {
        boolean res=systemUserMapper.deleteByName(deleteUser.getUsername());
        if(res){
            allReturn.setCode(200);
            allReturn.setMessage("删除用户成功");
            allReturn.setSuccess(true);
            allReturn.setData(true);
            System.out.println(new Gson().toJson(allReturn));
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("删除用户失败");
            allReturn.setSuccess(false);
            allReturn.setData(false);
        }
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

    @UserLoginToken
    @PostMapping("/user/update")
    public String updateUser(@RequestBody UpdateUser systemUser) {
        boolean res=systemUserMapper.updateUser(systemUser.getNickname(),systemUser.getUsername(),systemUser.getPhonenumber(),systemUser.getStatus());
        if(res){
            allReturn.setCode(200);
            allReturn.setMessage("修改用户成功");
            allReturn.setSuccess(true);
            allReturn.setData(true);
            System.out.println(new Gson().toJson(allReturn));
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("修改用户失败");
            allReturn.setSuccess(false);
            allReturn.setData(false);
        }
        System.out.println("update:"+new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

    @UserLoginToken
    @PostMapping("/user/updatePass")
    public String updatePass(@RequestBody SystemUser systemUser) {
        boolean res=systemUserMapper.updatePassword(systemUser.getUser_name(),systemUser.getPassword());
        if(res){
            allReturn.setCode(200);
            allReturn.setMessage("修改用户成功");
            allReturn.setSuccess(true);
            allReturn.setData(true);
            System.out.println(new Gson().toJson(allReturn));
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("修改用户失败");
            allReturn.setSuccess(false);
            allReturn.setData(false);
        }
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }
}
