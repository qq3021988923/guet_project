package com.yang.servier.impl;

import com.yang.mapper.CustomerMapper;
import com.yang.pojo.Customer;
import com.yang.servier.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpI implements ICustomerService {


    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public List<Customer> selectAll() {
        return customerMapper.selectAll();
    }

    @Override
    public List<Customer> selectByName(Customer customer) {
        return customerMapper.selectByName(customer);
    }

    @Override
    public int insert(Customer customer) {
        return customerMapper.insert(customer);
    }

    @Override
    public int updateById(Customer customer) {
        return customerMapper.updateById(customer);
    }

    @Override
    public int deleteById(Integer id) {
        return customerMapper.deleteById(id);
    }
}
