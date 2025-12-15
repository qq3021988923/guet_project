package com.yang.controller;

import com.yang.pojo.Customer;
import com.yang.servier.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private ICustomerService Service;

    // http://localhost:8888/customer/list
    @GetMapping("/list")
    public List<Customer> selectAll() {
        return Service.selectAll();
    }

    // http://localhost:8888/customer/query
    @PostMapping("/query")
    public List<Customer> selectByName(@RequestBody Customer customer) {
        return Service.selectByName(customer);
    }

    // http://localhost:8888/customer/insert
    @PostMapping("/insert")
    public int insert(@RequestBody Customer customer) {
        return Service.insert(customer);
    }

    @PostMapping("/update")
    public int updateById(@RequestBody Customer customer) {
        return Service.updateById(customer);
    }

    @GetMapping("/delete/{id}")
    public int deleteById(@PathVariable Integer id) {
        return Service.deleteById(id);
    }


}
