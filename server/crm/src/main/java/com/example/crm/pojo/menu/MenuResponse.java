package com.example.crm.pojo.menu;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuResponse {
    String name;
    String status;
    String perms;
    String component;
    String time;
}
