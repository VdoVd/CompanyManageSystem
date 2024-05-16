package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.MenuMapper;
import com.example.crm.Mapper.RoleMapper;
import com.example.crm.pojo.menu.Menu;
import com.example.crm.pojo.menu.MenuResponse;
import com.example.crm.pojo.role.Role;
import com.example.crm.pojo.role.RoleResponse;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class MenuController {

    @Autowired
    MenuMapper menuMapper;

    @Autowired
    Menu menu;

    @Autowired
    MenuResponse menuResponse;

    @Autowired
    Role role;

    @Autowired
    RoleResponse roleResponse;

    @Autowired
    AllReturn allReturn;

    @GetMapping("/menu/all")
    public String all(){

        List<Menu> menus= menuMapper.all();
        List<MenuResponse> menuResponses=new ArrayList<>();
        Integer i=0;
        menus.forEach(item -> {
            String perm=item.getPerms()==null?"empty":(item.getPerms().isEmpty()?"perm":item.getPerms());
            String component=item.getComponent()==null?"empty":(item.getComponent().isEmpty()?"component":item.getComponent());
            menuResponses.add(new MenuResponse(item.getMenu_name(),item.getStatus(),perm,component,item.getCreate_time().toString()));
            System.out.println("perm:"+perm);
        });

        if(menus.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("查找全部菜单成功");
            allReturn.setSuccess(true);
            allReturn.setData(menuResponses);
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("查找全部菜单失败");
            allReturn.setSuccess(false);
            allReturn.setData(menuResponses);
        }

        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }

    @GetMapping("/menu/find")
    public String find(@RequestParam String name,@RequestParam String status){

        List<Menu> menus= menuMapper.getMenus(name,status);
        List<MenuResponse> menuResponses=new ArrayList<>();
        Integer i=0;
        menus.forEach(item -> {
            String perm=item.getPerms()==null?"empty":(item.getPerms().isEmpty()?"perm":item.getPerms());
            String component=item.getComponent()==null?"empty":(item.getComponent().isEmpty()?"component":item.getComponent());
            menuResponses.add(new MenuResponse(item.getMenu_name(),item.getStatus(),perm,component,item.getCreate_time().toString()));
            System.out.println("perm:"+perm);
        });

        if(menus.size()!=0){
            allReturn.setCode(200);
            allReturn.setMessage("查找菜单成功");
            allReturn.setSuccess(true);
            allReturn.setData(menuResponses);
        }else {
            allReturn.setCode(400);
            allReturn.setMessage("查找菜单失败");
            allReturn.setSuccess(false);
            allReturn.setData(menuResponses);
        }

        System.out.println(new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);

    }
}
