package com.yang.servier.impl;

import com.yang.mapper.GuetRoleMapper;
import com.yang.pojo.GuetRole;
import com.yang.servier.IGuetRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuetRoleServiceImpl implements IGuetRoleService {

    @Autowired
    private GuetRoleMapper roleMapper;

    @Override
    public List<GuetRole> selectAll() {
        return roleMapper.selectAll();
    }

    @Override
    public GuetRole selectById(Long id) {
        return roleMapper.selectById(id);
    }

    @Override
    public int deleteById(Long id) {
        return roleMapper.deleteById(id);
    }

    @Override
    public int updateRole(GuetRole role) {
        return roleMapper.updateRole(role);
    }

    @Override
    public int insertRole(GuetRole role) {
        return roleMapper.insertRole(role);
    }

    @Override
    public List<GuetRole> selectByIds(List<Long> roleIds) {
        return roleMapper.selectByIds(roleIds);
    }
}
