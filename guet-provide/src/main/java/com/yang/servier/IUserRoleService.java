package com.yang.servier;

import com.yang.pojo.UserRole;

import java.util.List;

public interface IUserRoleService {

    int deleteByUserId(Long userId);

    List<UserRole> listAllUserRole();

    // 动态条件查询
    List<UserRole> listUserRoleByCondition(UserRole userRole);

    // 根据ID删除
    int deleteUserRoleById(Long id);

    int uroleInsert(UserRole userRole);
}
