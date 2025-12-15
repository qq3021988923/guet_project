package com.yang.guetconsumerr.controller;

import com.yang.dto.UserDto;
import com.yang.guetconsumerr.feignService.GuetRoleService;
import com.yang.guetconsumerr.feignService.GuetUserService;
import com.yang.guetconsumerr.feignService.UserRoleService;
import com.yang.guetconsumerr.security.JwtUtil;
import com.yang.pojo.GuetRole;
import com.yang.pojo.GuetUser;
import com.yang.pojo.UserRole;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
@CrossOrigin
public class GuetController {

    @Autowired
    private GuetUserService userService;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private GuetRoleService roleService;


    // http://localhost:8088/consumer/api/user/save
    @PostMapping("/save")
    public Result<Integer> saveUser(@RequestBody UserDto user){


        if(user.getRoleIds() !=null){

            // 通过当前用户的id删除对应的中间表再重新分配
            userRoleService.deleteByUserId(user.getUser().getId());

            for(Long i:user.getRoleIds()){

                UserRole userRole=new UserRole();
                userRole.setUserId(user.getUser().getId());
                userRole.setRoleId(i);

                //插入中间表
                userRoleService.uroleInsert(userRole);
            }

        }



        if(user.getUser().getId() != null ){

            int i = userService.updateUser(user.getUser());
            return Result.build(i,i==0 ? 500:200,"更新用户记录");

        }else{

            int i = userService.insertUser(user.getUser());
            return Result.build(i,i==0 ? 500:200,"添加用户记录");

        }
    }

    // http://localhost:8088/consumer/api/user/select/1
    @GetMapping("/select/{id}")
    public Result<HashMap<String,Object>> getUserById(@PathVariable Long id) {

        HashMap<String,Object> robj=new HashMap<>();
        GuetUser userById = userService.getUserById(id);
        robj.put("user",userById);

        UserRole urole=new UserRole();
        urole.setUserId(userById.getId());

        List<Long> ids=new ArrayList<>();

        List<UserRole> userRoles = userRoleService.listUserRoleByCondition(urole);
        for(UserRole rs:userRoles){
            ids.add(rs.getRoleId());
        }
        robj.put("ownerRoleIds",ids);
        List<GuetRole> guetRoles = roleService.queryRole();
        robj.put("roles",guetRoles);

        return Result.build(robj,200,"查询用户记录");
        //return null;
    }


    // 访问网关 http://localhost:8088/consumer/api/user/query
    // http://localhost:9999/api/user/query
    @RequestMapping("/query")
    public Result<List<GuetUser>> getUserInfo() {
        return userService.getQueryUser();
    }

    // 访问网关 http://localhost:8088/consumer/api/user/username
    // http://localhost:9999/api/user/username
    @PostMapping("/username") //
    public Result<GuetUser> getUserByUsername(@RequestBody GuetUser user) {
        //return userService.getUserByUsername(user);
        GuetUser users=userService.getUserByUsername(user);
        System.out.println("hello");
        return Result.build(users,users==null ? 500:200,"登录");
    }

    // 访问网关 http://localhost:8088/consumer/api/user/search
    @PostMapping("/search")
    public Result<List<GuetUser>> searchUserByUsername(@RequestBody GuetUser user){
        List<GuetUser> guetUsers = userService.searchUserByUsername(user);
        return Result.build(guetUsers,guetUsers==null ? 500:200,"模糊查询用户记录");
    }

    // 访问网关 http://localhost:8088/consumer/api/user/insert
    @PostMapping("/insert")
    public Result<Integer> insertUser(@RequestBody GuetUser user){
        int i = userService.insertUser(user);
        return Result.build(i,i==0 ? 500:200,"添加用户记录");
    }

    // 访问网关 http://localhost:8088/consumer/api/user/update
    @PostMapping("/update")
    public Result<Integer> updateUser(@RequestBody GuetUser user){
        int i = userService.updateUser(user);
        return Result.build(i,i==0 ? 500:200,"更新用户记录");
    }






    // 访问网关 http://localhost:8088/consumer/api/user/delete/1
    @GetMapping("/delete/{id}")
    public Result<Integer> deleteUserById(@PathVariable  Long id) {
        int i = userService.deleteUserById(id);
        return Result.build(i,i==0 ? 500:200,"禁用账号");
    }


    // 访问网关 http://localhost:8088/consumer/api/user/pydelete
    @GetMapping("/pydelete/{id}")
    public Result<Integer> deleteUserPhysicallyById(@PathVariable  Long id) {
        int i = userService.deleteUserPhysicallyById(id);
        return Result.build(i,i==0 ? 500:200,"删除用户记录");
    }

    // 访问网关 http://localhost:8088/consumer/api/user/upstatus/16
    @GetMapping("/upstatus/{id}")
    public Result<Integer> updateStatus(@PathVariable  Long id) {
        int i = userService.updateStatus(id);
        return Result.build(i,i==0 ? 500:200,"启动账号");
    }

    // http://localhost:8088/consumer/api/user/login
    @PostMapping("/login")
    public Result<Map<String, Object>> verifyLogin(@RequestBody GuetUser user, UserRole urole){

        Map<String, Object> response = new HashMap<>();
        GuetUser users = userService.verifyLogin(user);

        if (users == null) {
            return Result.build(response,401,"用户不存在");
        }

//        if (!passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {;
//            return Result.build(response,401,"密码错误");
//        }

//        if (user.getStatus() == 0) {
//            return Result.build(user,403,"用户已被禁用");;
//        }

        String token = jwtUtil.generateToken(user.getUsername());
//        response.put("code", 200);

        Long uid=users.getId();
        urole.setUserId(uid);

        List<UserRole> lists= userRoleService.listUserRoleByCondition(urole);

        List<String> rname=new ArrayList<>();
        if(lists !=null && !lists.isEmpty()){
            System.out.println("当前用户在中间表的数据" + lists);

            List<Long> rids=new ArrayList<>();
            // 提取中间表roleid的所有字段

            for (int i = 0; i < lists.size(); i++) {

                Long rid = lists.get(i).getRoleId();
                rids.add(rid);
            }

            System.out.println("我是角色表的ids"+rids);
            System.out.println("--------------------------------------------------------------");
            List<GuetRole> guetRoles = roleService.selectListIds(rids);



            for (int i = 0; i < guetRoles.size(); i++) {

                rname.add(guetRoles.get(i).getRoleName());
            }

            System.out.println("当前用户所具有的职位"+rname);
            response.put("permission", rname);

        }

        if (lists != null && lists.isEmpty()) {
            response.put("permission", "三无人员");
        }

        response.put("token", token);
        response.put("user", users);

//        GuetUser users = userService.verifyLogin(user);

        //return Result.build(users,users==null ? 500:200,"登录");
        return Result.build(response,200,"登录成功");
    }
}
