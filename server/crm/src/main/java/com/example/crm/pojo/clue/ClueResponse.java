package com.example.crm.pojo.clue;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class ClueResponse {

    String cid;
    String phone;
    String src;
    String create_time;
    String create_by;
    String status;
    String opt;

}
