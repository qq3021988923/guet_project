package com.yang.guetconsumerr.controller;

import com.yang.annotation.OperationLog;
import com.yang.guetconsumerr.feignService.CustomerService;
import com.yang.pojo.Customer;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cust")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    // http://localhost:8088/consumer/api/cust/sbyuserid
    @GetMapping("/sbyuserid")
    public Result<List<Customer>> selectByUserId(@RequestParam(required = false) Long userId) {
        System.out.println("用户id"+userId);
        List<Customer> customers = customerService.selectByUserId(userId);
        System.out.println(customers);
        return Result.build(customers,customers==null?500:200,"当前用户的客户");
    }

    // http://localhost:8088/consumer/api/cust/list
    @GetMapping("/list")
    public Result<List<Customer>> selectAll() {
        List<Customer> cust = customerService.selectAll();
        return Result.build(cust,cust==null?500:200,"列表查询");
    }

    @PostMapping("/query")
    public Result<List<Customer>> selectByName(@RequestBody Customer customer) {
        List<Customer> cust = customerService.selectByName(customer);
        return Result.build(cust,cust==null?500:200,"模糊查询");
    }

    // http://localhost:8088/consumer/api/cust/insert
    @OperationLog(module = "客户管理", operation = "新增客户")
    @PostMapping("/insert")
    public Result<Integer> insert(@RequestBody Customer customer) {
        int i = customerService.insert(customer);
        return Result.build(i,i==0?500:200,"添加客户");
    }

    // http://localhost:8088/consumer/api/cust/update
    @OperationLog(module = "客户管理", operation = "修改客户")
    @PostMapping("/update")
    public Result<Integer> updateById(@RequestBody Customer customer) {
        int i = customerService.updateById(customer);
        return Result.build(i,i==0?500:200,"更新客户");
    }

    // http://localhost:8088/consumer/api/cust/delete
    @OperationLog(module = "客户管理", operation = "删除客户")
    @GetMapping("/delete/{id}")
    public Result<Integer> deleteById(@PathVariable Integer id) {
        int i = customerService.deleteById(id);
        return Result.build(i,i==0?500:200,"删除客户");
    }

}
