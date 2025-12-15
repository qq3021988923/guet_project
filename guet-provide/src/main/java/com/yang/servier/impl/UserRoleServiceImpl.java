package com.yang.servier.impl;

import com.yang.mapper.UserRoleMapper;
import com.yang.pojo.UserRole;
import com.yang.servier.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceImpl implements IUserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public int deleteByUserId(Long userId) {
        return userRoleMapper.deleteByUserId(userId);
    }

    @Override
    public List<UserRole> listAllUserRole() {
        return userRoleMapper.listAllUserRole();
    }

    @Override
    public List<UserRole> listUserRoleByCondition(UserRole userRole) {
        return userRoleMapper.listUserRoleByCondition(userRole);
    }

    @Override
    public int deleteUserRoleById(Long id) {
        return userRoleMapper.deleteUserRoleById(id);
    }

    @Override
    public int uroleInsert(UserRole userRole) {
        return userRoleMapper.uroleInsert(userRole);
    }
}
