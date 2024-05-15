package com.example.crm.Mapper;

import com.example.crm.pojo.role.Role;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface RoleMapper {

    public List<Role> allRoles();

    public List<Role> findRoles(String name,String status);
}
