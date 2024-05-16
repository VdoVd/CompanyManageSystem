package com.example.crm.Mapper;


import com.example.crm.pojo.contract.Contract;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface ContractMapper {

    public List<Contract>getAll();

    public List<Contract>find(String name);

}
