package com.example.crm.Mapper;

import com.example.crm.pojo.course.Course;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface CourseMapper {

    public List<Course> getAll();

    public List<Course>find(String name);

}
