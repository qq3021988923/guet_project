package com.yang.servier.impl;

import com.yang.mapper.LogisticsMapper;
import com.yang.pojo.GuetLogistics;
import com.yang.servier.ILogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogisticsServiceImpl implements ILogisticsService {

    @Autowired
    private LogisticsMapper logisticsMapper;

    @Override
    public List<GuetLogistics> getByOrderId(Integer orderId) {
        return logisticsMapper.selectByOrderId(orderId);
    }

    @Override
    public GuetLogistics getLatestByOrderId(Integer orderId) {
        return logisticsMapper.selectLatestByOrderId(orderId);
    }

    @Override
    public int addLogistics(GuetLogistics logistics) {
        return logisticsMapper.insert(logistics);
    }

    @Override
    public int initLogistics(Integer orderId, String location, String operator) {
        GuetLogistics logistics = new GuetLogistics();
        logistics.setOrderId(orderId);
        logistics.setStatus(1); // 待取件
        logistics.setLocation(location);
        logistics.setOperator(operator);
        logistics.setRemark("订单已创建，等待取件");
        return logisticsMapper.insert(logistics);
    }

    @Override
    public int deleteByOrderId(Integer orderId) {
        return logisticsMapper.deleteByOrderId(orderId);
    }
}
