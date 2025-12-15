package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetRole;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "roleFeign")
public interface GuetRoleService {


    @GetMapping("/guet/role")
    public List<GuetRole> queryRole();

    @GetMapping("/guet/role/select/{id}")
    public GuetRole selectById(@PathVariable Long id);

    @GetMapping("/guet/role/delete/{id}")
    public int deleteById(@PathVariable  Long id);

    @PostMapping("/guet/role/update")
    public int updateRole(@RequestBody GuetRole role);

    @PostMapping("/guet/role/insert")
    public int insertRole(@RequestBody GuetRole role);

    @PostMapping("/guet/role/selects")
    public List<GuetRole> selectListIds(@RequestBody List<Long> roleIds);
}
