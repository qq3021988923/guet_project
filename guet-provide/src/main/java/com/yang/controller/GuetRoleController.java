package com.yang.controller;

import com.yang.pojo.GuetRole;
import com.yang.servier.IGuetRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/guet")
public class GuetRoleController {

    @Autowired
    private IGuetRoleService roleService;


    // http://localhost:8888/guet/role
    @GetMapping("/role")
    public List<GuetRole> queryRole(){

        return roleService.selectAll();

    }

    @GetMapping("/role/select/{id}")
    public GuetRole selectById(@PathVariable Long id){

        return roleService.selectById(id);

    }

    @GetMapping("/role/delete/{id}")
    public int deleteById(@PathVariable  Long id) {
        return roleService.deleteById(id);
    }

    @PostMapping("/role/update")
    public int updateRole(@RequestBody GuetRole role) {
        return roleService.updateRole(role);
    }

    @PostMapping("/role/insert")
    public int insertRole(@RequestBody GuetRole role) {
        return roleService.insertRole(role);
    }

    @PostMapping("/role/selects")
    public List<GuetRole> selectListIds(@RequestBody List<Long> roleIds) {
        return roleService.selectByIds(roleIds);
    }
}
