package com.yang.mapper;

import com.yang.pojo.GuetRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GuetRoleMapper {

    List<GuetRole> selectAll();

    GuetRole selectById(Long id);

    int deleteById(Long id);

    int updateRole(GuetRole role);

    int insertRole(GuetRole role);

    List<GuetRole> selectByIds(List<Long> roleIds);

}
