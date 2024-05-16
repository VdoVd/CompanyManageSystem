package com.example.crm.pojo.contract;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class ContractResponse {

    String name;
    String cid;
    String goodSubject;
    String goodCourse;
    String phone;
    String create_time;

}
