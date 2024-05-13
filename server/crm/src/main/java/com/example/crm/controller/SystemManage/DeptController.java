package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.DeptMapper;
import com.example.crm.pojo.dept.dept;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DeptController {
    @Autowired
    AllReturn allReturn;
    @Autowired
    DeptMapper deptMapper;
    @Autowired
    dept d;

    @GetMapping("/dept/all")
    public String getAll()
    {
        List<dept> deptList=deptMapper.getAll();
        if(deptList.size()!=0){
            allReturn.setData(deptMapper.getAll());
            allReturn.setSuccess(true);
            allReturn.setCode(200);
            allReturn.setMessage("查询成功");
        }else {
            allReturn.setData(new Object());
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("查询失败");
        }
        System.out.println("查找全部部门成功:"+allReturn);
        return new Gson().toJson(allReturn);
    }

    @GetMapping("/dept/find")
    public String findByName(@RequestParam String name){
        dept d=deptMapper.query(name);
        if(d!=null){
            allReturn.setData(d);
            allReturn.setSuccess(true);
            allReturn.setCode(200);
            allReturn.setMessage("查询成功");
        }else {
            allReturn.setData(null);
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("查询失败");
        }
        System.out.println("查找部门成功:"+allReturn);
        return new Gson().toJson(allReturn);
    }
}
