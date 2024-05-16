package com.example.crm.pojo.business;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Business {
    Long id;
    String name;
    String phone;
    String channel;
    Long activity_id;
    String province;
    String city;
    String sex;
    Integer age;
    String weixin;
    String qq;
    String level;
    String subject;
    String course_id;
    String occupation;
    String education;
    String job;
    String salary;
    String major;
    String expected_salary;
    String reasons;
    String plan;
    Date plan_time;
    Date last_update_time;
    String other_intention;
    Date next_time;
    Long clue_id;
    String transfer;
    String create_by;
    Date create_time;
    String update_by;
    Date update_time;
    String status;
    String remark;
}
