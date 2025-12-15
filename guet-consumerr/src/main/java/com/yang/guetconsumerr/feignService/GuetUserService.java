package com.yang.guetconsumerr.feignService;


import com.yang.pojo.GuetUser;
import com.yang.utils.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "userFeign")
public interface GuetUserService {

    @GetMapping("/guet/queryById/{id}")
    public GuetUser getUserById(@PathVariable Long id);

    @GetMapping("/guet/user")
    public Result<List<GuetUser>> getQueryUser();

    @GetMapping("/guet/name")
    public GuetUser getUserByUsername(@RequestBody GuetUser user);

    @PostMapping("/guet/search")
    public List<GuetUser> searchUserByUsername(GuetUser user);

    @PostMapping("/guet/insert")
    public int insertUser(@RequestBody GuetUser user);

    @PostMapping("/guet/update")
    public int updateUser(@RequestBody GuetUser user);

    @GetMapping("/guet/delete/{id}")
    public int deleteUserById(@PathVariable Long id);

    @GetMapping("/guet/pydelete/{id}")
    public int deleteUserPhysicallyById(@PathVariable Long id);

    @GetMapping("/guet/upstatus/{id}")
    public int updateStatus(@PathVariable  Long id);

    @PostMapping("/guet/login")
    public GuetUser verifyLogin(@RequestBody GuetUser user);

}
