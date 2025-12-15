package com.yang.servier;

import com.yang.pojo.GuetRole;

import java.util.List;

public interface IGuetRoleService {

    List<GuetRole> selectAll();

    GuetRole selectById(Long id);

    int deleteById(Long id);

    int updateRole(GuetRole role);

    int insertRole(GuetRole role);

    List<GuetRole> selectByIds(List<Long> roleIds);
}
