package com.example.crm.pojo.active;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Activity {
    Long id;
    String name;
    String channel;
    String type;
    String discount;
    Integer vouchers;
    String status;
    Date begin_time;
    Date end_time;
    Date create_time;
    String code;
}
