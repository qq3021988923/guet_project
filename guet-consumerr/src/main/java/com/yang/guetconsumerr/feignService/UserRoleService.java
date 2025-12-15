package com.yang.guetconsumerr.feignService;

import com.yang.pojo.UserRole;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "uroleFeign")
public interface UserRoleService {

    @GetMapping("/urole/deleteByUserId/{userId}")
    public int deleteByUserId(@PathVariable Long userId);

    @GetMapping("/urole/query")
    public List<UserRole> listAllUserRole();

    @PostMapping("/urole/queryall")
    public List<UserRole> listUserRoleByCondition(@RequestBody UserRole userRole);

    @GetMapping("/urole/delete/{id}")
    public int deleteUserRoleById(@PathVariable Long id);

    @PostMapping("/urole/insert")
    public int uroleInsert(@RequestBody UserRole userRole);
}
