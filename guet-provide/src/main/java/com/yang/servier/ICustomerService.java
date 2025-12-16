package com.yang.servier;

import com.yang.pojo.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> selectByUserId(Long userId);

    List<Customer> selectAll();

    List<Customer> selectByName(Customer customer);

    int insert(Customer customer);

    int updateById(Customer customer);

    int deleteById(Integer id);
}
