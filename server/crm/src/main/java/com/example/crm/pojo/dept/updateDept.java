package com.example.crm.pojo.dept;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class updateDept {
    String name;
    String leader;
    String phone;
    String status;
    String id;
}
