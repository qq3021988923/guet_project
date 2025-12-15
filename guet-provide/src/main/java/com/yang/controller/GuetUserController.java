package com.yang.controller;

import com.yang.pojo.Brand;
import com.yang.pojo.GuetUser;
import com.yang.servier.IGuetUserService;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/guet")
public class GuetUserController {

    @Autowired
    private IGuetUserService userService;

    // http://localhost:8888/guet/queryById/1
    @GetMapping("/queryById/{id}")
    public GuetUser getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    // http://localhost:8888/guet/user
    @GetMapping("/user")
    public Result<List<GuetUser>> findAll() {
        // return userService.getUserInfo();
        return Result.build(userService.getUserInfo(),200,"用户信息");
    }


    // http://localhost:8888/guet/name
    @PostMapping("/name")
    public GuetUser getUserByUsername(@RequestBody GuetUser user) {
        return userService.getUserByUsername(user);
    }


    // http://localhost:8888/guet/search
    @PostMapping("/search")
    public List<GuetUser> searchUserByUsername(@RequestBody GuetUser user){
        System.out.println("计算机应用技术"+user.getUsername());
        return userService.searchUserByUsername(user.getUsername());
    }

    // http://localhost:8888/guet/insert
    @PostMapping("/insert")
    public int insertUser(@RequestBody GuetUser user){
        return userService.insertUser(user);
    }

    @PostMapping("/update")
    public int updateUser(@RequestBody GuetUser user){
        return userService.updateUser(user);
    }

    @GetMapping("/delete/{id}")
    public int deleteUserById(@PathVariable  Long id) {
        return userService.deleteUserById(id);
    }

    @GetMapping("/pydelete/{id}")
    public int deleteUserPhysicallyById(@PathVariable  Long id) {
        return userService.deleteUserPhysicallyById(id);
    }

    // http://localhost:8888/guet/upstatus/16
    @GetMapping("/upstatus/{id}")
    public int updateStatus(@PathVariable  Long id) {
        return userService.updateStatus(id);
    }

    // http://localhost:8888/guet/login
    @PostMapping("/login")
    public GuetUser verifyLogin(@RequestBody GuetUser user){
        return userService.verifyLogin(user);
    }

}
