package com.example.crm.pojo.clue;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Clue {
    Long id;
    String name;
    String phone;
    String channel;
    Long activity_id;
    String sex;
    Integer age;
    String weixin;
    String qq;
    String level;
    String subject;
    String status;
    Date create_time;
    String create_by;
    Integer false_count;
    Date next_time;
    Date update_time;
    String transfer;
    Date end_time;
}
