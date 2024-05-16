package com.example.crm.pojo.dict;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class Dict {

    Long dict_code;
    Integer dict_sort;
    String dict_label;
    String dict_value;
    String dict_type;
    String css_class;
    String list_class;
    String is_default;
    String status;
    String create_by;
    Date create_time;
    String update_by;
    Date update_time;
    String remark;

}
