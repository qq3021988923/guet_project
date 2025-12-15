package com.yang.mapper;

import com.yang.pojo.Customer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper {

    List<Customer> selectAll();

    List<Customer> selectByName(Customer customer);

    int insert(Customer customer);

    int updateById(Customer customer);

    int deleteById(Integer id);

}
