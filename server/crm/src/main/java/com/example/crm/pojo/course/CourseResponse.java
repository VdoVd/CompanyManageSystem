package com.example.crm.pojo.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class CourseResponse {

    String cid;
    String courseName;
    String subject;
    String price;
    String fit;
    String intro;
    String create_time;

}
