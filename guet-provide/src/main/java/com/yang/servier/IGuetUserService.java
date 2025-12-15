package com.yang.servier;

import com.yang.pojo.GuetUser;

import java.util.List;

public interface IGuetUserService {

    GuetUser getUserById(Long id);

    List<GuetUser> getUserInfo();

    GuetUser getUserByUsername(GuetUser user);

    List<GuetUser> searchUserByUsername(String keyword);

    int insertUser(GuetUser user);

    int updateUser(GuetUser user);

    int deleteUserById(Long id);

    int deleteUserPhysicallyById(Long id);

    int updateStatus(Long id);

    GuetUser verifyLogin(GuetUser user);
}
