package com.example.crm.Mapper;

import com.example.crm.pojo.SystemUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SystemUserMapper {
    public SystemUser queryByName(String username);

    public List<SystemUser> getAllUser();

    public List<SystemUser> queryUsers(String username, String phonenumber, Integer state);

    public boolean deleteByName(String username);

    public boolean updateUser(String nickname,String username,String phonenumber,String status);

    public boolean updatePassword(String username,String password);
}
