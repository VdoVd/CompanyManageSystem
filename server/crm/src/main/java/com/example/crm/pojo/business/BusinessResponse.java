package com.example.crm.pojo.business;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class BusinessResponse {

    String name;
    String phone;
    String status;
    String cid;
    String subject;
    String create_time;
    String create_by;

}
