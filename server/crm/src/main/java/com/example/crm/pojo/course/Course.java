package com.example.crm.pojo.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class Course {

    Long id;
    String code;
    String name;
    String subject;
    Integer price;
    String application_person;
    String info;
    Date create_time;
    Integer is_delete;

}
