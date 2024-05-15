package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.RoleMapper;
import com.example.crm.pojo.role.Role;
import com.example.crm.pojo.role.RoleResponse;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class RoleController {

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    Role role;

    @Autowired
    RoleResponse roleResponse;

    @Autowired
    AllReturn allReturn;

    @GetMapping("/role/all")
    public String all(){

        List<Role> roles= roleMapper.allRoles();
        List<RoleResponse> roleResponses=new ArrayList<>();;
        roles.stream().forEach(role -> {
            roleResponse.setName(role.getRole_name());
            roleResponse.setRole(role.getRole_key());
            roleResponse.setStatus(role.getStatus());
            roleResponse.setTime(role.getCreate_time().toString());
            roleResponses.add(roleResponse);
        });
        if(roleResponses.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("查找全部角色成功");
            allReturn.setSuccess(true);
            allReturn.setData(roleResponses);
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("查找全部角色失败");
            allReturn.setSuccess(false);
            allReturn.setData(roleResponses);
        }
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);

    }

    @GetMapping("/role/find")
    public String find(@RequestParam String name,@RequestParam String status){
        System.out.println("name:"+name+"status:"+status);
        List<Role> roles= roleMapper.findRoles(name,status);
        List<RoleResponse> roleResponses=new ArrayList<>();;
        roles.stream().forEach(role -> {
            roleResponse.setName(role.getRole_name());
            roleResponse.setRole(role.getRole_key());
            roleResponse.setStatus(role.getStatus());
            roleResponse.setTime(role.getCreate_time().toString());
            roleResponses.add(roleResponse);
        });
        if(roleResponses.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("搜索角色成功");
            allReturn.setSuccess(true);
            allReturn.setData(roleResponses);
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("搜索角色失败");
            allReturn.setSuccess(false);
            allReturn.setData(roleResponses);
        }
        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

}
