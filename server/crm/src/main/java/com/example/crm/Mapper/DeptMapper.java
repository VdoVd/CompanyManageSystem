package com.example.crm.Mapper;

import com.example.crm.pojo.SystemUser;
import com.example.crm.pojo.dept.dept;
import com.example.crm.pojo.dept.updateDept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface DeptMapper {

    public List<dept> getAll();

    public dept query(String name);

    public Integer update(String name,String leader,String phone,String status,String id);

    public Integer delete(String id);

}
