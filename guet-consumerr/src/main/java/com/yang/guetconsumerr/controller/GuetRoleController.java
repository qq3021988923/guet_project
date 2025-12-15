package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.GuetRoleService;
import com.yang.pojo.GuetRole;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/role")
public class GuetRoleController {

    @Autowired
    private GuetRoleService roleService;

    // 访问网关 http://localhost:8088/consumer/api/role
    // http://localhost:9999/api/role
    @RequestMapping("")
    public Result<List<GuetRole>> queryRole(){

        List<GuetRole> guetRoles = roleService.queryRole();

        return Result.build(guetRoles,guetRoles==null?500:200,"查询角色列表");
    }

    // 访问网关 http://localhost:8088/consumer/api/role/select/{id}
    @GetMapping("/select/{id}")
    public Result<GuetRole> selectById(@PathVariable Long id){

        GuetRole guetRole = roleService.selectById(id);

        return Result.build(guetRole,guetRole==null?500:200,"查询角色记录");

    }

    // 访问网关 http://localhost:8088/consumer/api/role/delete/{id}
    @GetMapping("/delete/{id}")
    public Result<Integer> deleteById(@PathVariable  Long id) {

        int i = roleService.deleteById(id);

        return Result.build(i,i==0?500:200,"delete_role");
    }

    // 访问网关 http://localhost:8088/consumer/api/role/update
    @PostMapping("/update")
    public Result<Integer> updateRole(@RequestBody GuetRole role) {

        int i = roleService.updateRole(role);

        return Result.build(i,i==0?500:200,"update_role");
    }

    // 访问网关 http://localhost:8088/consumer/api/role/insert
    @PostMapping("/insert")
    public Result<Integer> insertRole(@RequestBody GuetRole role) {

        int i = roleService.insertRole(role);

        return Result.build(i,i==0?500:200,"add_role");
    }


}
