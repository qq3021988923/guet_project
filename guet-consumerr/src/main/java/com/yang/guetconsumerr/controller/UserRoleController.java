package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.UserRoleService;
import com.yang.pojo.UserRole;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/urole")
public class UserRoleController {

    @Autowired
    private UserRoleService roleService;

    //网关  http://localhost:8088/consumer/api/urole/deleteByUserId/2
    @GetMapping("/deleteByUserId/{userId}")
    public Result<Integer> deleteByUserId(@PathVariable Long userId) {
        if(userId !=null){
            int i = roleService.deleteByUserId(userId);
            return Result.build(i,i==0?500:200,"删除操作");
        }
        return Result.build(0,500,"删除操作");
    }

    //网关  http://localhost:8088/consumer/api/urole/query
    // http://localhost:9999/api/urole/query
    @GetMapping("/query")
    public List<UserRole> listAllUserRole() {
        return roleService.listAllUserRole();
    }

    //网关  http://localhost:8088/consumer/api/urole/queryall
    // http://localhost:9999/api/urole/query
    @PostMapping("/queryall")
    public List<UserRole> listUserRoleByCondition(@RequestBody UserRole userRole) {
        return roleService.listUserRoleByCondition(userRole);
    }

    @GetMapping("/delete/{id}")
    public int deleteUserRoleById(@PathVariable Long id) {
        return roleService.deleteUserRoleById(id);
    }

    //网关  http://localhost:8088/consumer/api/urole/insert
    @PostMapping("/insert")
    public Result<Integer> uroleInsert(@RequestBody UserRole userRole) {
        int i = roleService.uroleInsert(userRole);
        return Result.build(i,i==0?500:200,"插入操作");
    }
}
