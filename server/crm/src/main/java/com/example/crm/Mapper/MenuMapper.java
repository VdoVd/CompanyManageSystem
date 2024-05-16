package com.example.crm.Mapper;

import com.example.crm.pojo.menu.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {

    public List<Menu> all();

    public List<Menu> getMenus(String name,String status);

}
