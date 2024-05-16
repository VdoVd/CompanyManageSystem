package com.example.crm.Mapper;

import com.example.crm.pojo.active.Activity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ActivityMapper {

    public List<Activity> getAll();

    public List<Activity> find(String name);
}
