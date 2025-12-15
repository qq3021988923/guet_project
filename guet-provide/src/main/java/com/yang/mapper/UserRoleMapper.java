package com.yang.mapper;

import com.yang.pojo.UserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRoleMapper {

    int deleteByUserId(Long userId);

    // 全表查询
    List<UserRole> listAllUserRole();

    // 动态条件查询
    List<UserRole> listUserRoleByCondition(UserRole userRole);

    // 根据ID删除
    int deleteUserRoleById(Long id);

    int uroleInsert(UserRole userRole);
}
