package com.example.crm.pojo.sysmanage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUser {
    String username;
    String nickname;
    String status;
    String phonenumber;
}
