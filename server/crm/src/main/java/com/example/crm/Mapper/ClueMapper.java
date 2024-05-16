package com.example.crm.Mapper;

import com.example.crm.pojo.clue.Clue;
import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ClueMapper {
    public List<Clue> getAll();

    public List<Clue> find(String name);

}
