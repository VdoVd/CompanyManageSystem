package com.example.crm.Mapper;

import com.example.crm.pojo.SystemUser;
import com.example.crm.pojo.TestClass;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface SystemUserMapper {
    public SystemUser queryByName(String username);

    public List<SystemUser> getAllUser();

    public SystemUser queryUser(String username, String phoneNumber, Integer state);

}
