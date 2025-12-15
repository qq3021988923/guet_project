package com.yang.mapper;

import com.yang.pojo.GuetUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GuetUserMapper {

    GuetUser getUserById(Long id);

    List<GuetUser> getUserInfo();

    GuetUser getUserByUsername(String username);


    List<GuetUser> searchUserByUsername(String keyword);

    //List<GuetUser> searchUserByName(String keyword);

    int insertUser(GuetUser user);

    int updateUser(GuetUser user);

    // 逻辑删除
    int deleteUserById(Long id);

    // 真的删除
    int deleteUserPhysicallyById(Long id);

    int updateStatus(Long id);

    GuetUser verifyLogin(GuetUser user);

}
