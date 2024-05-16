package com.example.crm.pojo.contract;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class Contract {

    Long id;
    String phone;
    String contract_no;
    String name;
    String subject;
    Long activity_id;
    String activity_name;
    Long course_id;
    String course_name;
    String channel;
    String status;
    String create_by;
    Long dept_id;
    Date create_time;
    String file_name;
    Float course_price;
    String process_instance_id;
    Long business_id;

}
