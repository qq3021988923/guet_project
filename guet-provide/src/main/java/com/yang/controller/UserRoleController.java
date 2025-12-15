package com.yang.controller;

import com.yang.pojo.UserRole;
import com.yang.servier.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/urole")
public class UserRoleController {

    @Autowired
    private IUserRoleService userRoleService;

    @GetMapping("/deleteByUserId/{userId}")
    public int deleteByUserId(@PathVariable Long userId) {
        return userRoleService.deleteByUserId(userId);
    }

    // http://localhost:8888/urole/query
    @GetMapping("/query")
    public List<UserRole> listAllUserRole() {
        return userRoleService.listAllUserRole();
    }

    // http://localhost:8888/urole/queryall 不能查全表
    @PostMapping("/queryall")
    public List<UserRole> listUserRoleByCondition(@RequestBody UserRole userRole) {
        return userRoleService.listUserRoleByCondition(userRole);
    }

    @GetMapping("/delete/{id}")
    public int deleteUserRoleById(@PathVariable Long id) {
        return userRoleService.deleteUserRoleById(id);
    }

    @PostMapping("/insert")
    public int uroleInsert(@RequestBody UserRole userRole) {
        return userRoleService.uroleInsert(userRole);
    }


}
