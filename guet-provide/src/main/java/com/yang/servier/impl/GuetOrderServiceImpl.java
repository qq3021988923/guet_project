package com.yang.servier.impl;

import com.yang.mapper.OrderMapper;
import com.yang.pojo.GuetOrder;
import com.yang.servier.IGuetOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuetOrderServiceImpl implements IGuetOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<GuetOrder> selectByUserIdWithCustomer(Long userId) {
        return orderMapper.selectByUserIdWithCustomer(userId);
    }

    @Override
    public List<GuetOrder> selectAll() {
        return orderMapper.selectAll();
    }

    @Override
    public GuetOrder selectById(Integer id) {
        return orderMapper.selectById(id);
    }

    @Override
    public List<GuetOrder> selectByCondition(GuetOrder order) {
        return orderMapper.selectByCondition(order);
    }

    @Override
    public List<GuetOrder> selectByUserId(Long userId) {
        return orderMapper.selectByUserId(userId);
    }

    @Override
    public int insert(GuetOrder order) {
        return orderMapper.insert(order);
    }

    @Override
    public int update(GuetOrder order) {
        return orderMapper.update(order);
    }

    @Override
    public int deleteById(Integer id) {
        return orderMapper.deleteById(id);
    }
}
