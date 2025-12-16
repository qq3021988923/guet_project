package com.yang.guetconsumerr.feignService;

import com.yang.pojo.Customer;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "customerFeign")
public interface CustomerService {

    @GetMapping("/customer/sbyuserid")
    public List<Customer> selectByUserId(@RequestParam(required = false) Long userId);

    // http://localhost:8888/customer/list
    @GetMapping("/customer/list")
    public List<Customer> selectAll();

    // http://localhost:8888/customer/query
    @PostMapping("/customer/query")
    public List<Customer> selectByName(@RequestBody Customer customer);

    // http://localhost:8888/customer/insert
    @PostMapping("/customer/insert")
    public int insert(@RequestBody Customer customer);

    @PostMapping("/customer/update")
    public int updateById(@RequestBody Customer customer);

    @GetMapping("/customer/delete/{id}")
    public int deleteById(@PathVariable Integer id);

}
