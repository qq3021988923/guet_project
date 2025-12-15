package com.yang.servier.impl;

import com.yang.mapper.GuetUserMapper;
import com.yang.pojo.GuetUser;
import com.yang.servier.IGuetUserService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuetUserServiceImpl implements IGuetUserService {

    @Resource
    private GuetUserMapper userMapper;

    @Override
    public GuetUser getUserById(Long id) {
        return userMapper.getUserById(id);
    }

    @Override
    public List<GuetUser> getUserInfo() {
        return userMapper.getUserInfo();
    }

    @Override
    public GuetUser getUserByUsername(GuetUser user) {
        return userMapper.getUserByUsername(user.getUsername());
    }

    @Override
    public List<GuetUser> searchUserByUsername(String keyword) {
        return userMapper.searchUserByUsername(keyword);
    }

    @Override
    public int insertUser(GuetUser user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int updateUser(GuetUser user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUserById(Long id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int deleteUserPhysicallyById(Long id) {
        return userMapper.deleteUserPhysicallyById(id);
    }

    @Override
    public int updateStatus(Long id) {
        return userMapper.updateStatus(id);
    }

    @Override
    public GuetUser verifyLogin(GuetUser user) {
        return userMapper.verifyLogin(user);
    }


}
