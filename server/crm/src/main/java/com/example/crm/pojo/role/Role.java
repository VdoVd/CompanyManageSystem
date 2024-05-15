package com.example.crm.pojo.role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Role {

    Long role_id;

    String role_name;

    String role_key;

    Integer role_sort;

    String data_scope;

    Integer menu_check_strictly;

    Integer dept_check_strictly;

    String status;

    String del_flag;

    String create_by;

    Date create_time;

    String update_by;

    Date update_time;

    String remark;

}
