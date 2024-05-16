package com.example.crm.pojo.menu;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {

    Long menu_id;
    String menu_name;
    Long parent_id;
    Integer order_num;
    String path;
    String component;
    Integer is_frame;
    Integer is_cache;
    String menu_type;
    String visible;
    String status;
    String perms;
    String icon;
    String create_by;
    Date create_time;
    String update_by;
    Date update_time;
    String remark;

}
