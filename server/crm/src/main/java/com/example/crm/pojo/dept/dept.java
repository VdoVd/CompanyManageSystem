package com.example.crm.pojo.dept;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class dept {
    Long dept_id;
    Long parent_id;
    String ancestors;
    String dept_name;
    Integer order_num;
    String leader;
    String phone;
    String email;
    String status;
    String del_flag;
    String create_by;
    Date create_time;
    String update_by;
    Date update_time;
}
