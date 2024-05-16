package com.example.crm.Mapper;

import com.example.crm.pojo.business.Business;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface BusinessMapper {

    List<Business>getAll();

    List<Business>find(String name,String status);

}
