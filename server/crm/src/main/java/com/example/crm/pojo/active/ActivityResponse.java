package com.example.crm.pojo.active;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ActivityResponse {

    String activeNum;
    String intro;
    String detail;
    String src;
    String create_time;
    String end_time;

}
