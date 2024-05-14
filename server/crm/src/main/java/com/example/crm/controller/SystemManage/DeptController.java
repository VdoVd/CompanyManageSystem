package com.example.crm.controller.SystemManage;

import com.example.crm.Mapper.DeptMapper;
import com.example.crm.pojo.dept.dept;
import com.example.crm.pojo.dept.updateDept;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/dept/update")
    public String updateDeptFunc(@RequestBody updateDept d){

        Integer res = deptMapper.update(d.getName(),d.getLeader(),d.getPhone(),d.getStatus(),d.getId());

        if(res!=0){
            allReturn.setData(res);
            allReturn.setSuccess(true);
            allReturn.setCode(200);
            allReturn.setMessage("查询成功");
        }else {
            allReturn.setData(res);
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("查询失败");
        }
        System.out.println("更新部门成功:"+new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);

    }

    @PostMapping("/dept/delete")
    public String deleteDeptFunc(@RequestBody updateDept d){
        Integer res = deptMapper.delete(d.getId().toString());
        if(res!=0){
            allReturn.setData(res);
            allReturn.setSuccess(true);
            allReturn.setCode(200);
            allReturn.setMessage("删除成功");
        }else {
            allReturn.setData(res);
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("删除失败");
        }
        System.out.println("删除部门成功:"+new Gson().toJson(allReturn));
        return new Gson().toJson(allReturn);
    }
}
