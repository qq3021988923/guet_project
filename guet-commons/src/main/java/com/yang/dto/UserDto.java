package com.yang.dto;

import com.yang.pojo.GuetUser;
import lombok.Data;

import java.util.List;

@Data
public class UserDto {

    private GuetUser user;

    private List<Long> roleIds;

}
