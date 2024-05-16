package com.example.crm.pojo.dict;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class DictResponse {

    String name;
    String status;
    String type;
    String desc;
    String create_time;

}
