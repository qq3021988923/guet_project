package com.yang.servier;

import com.yang.pojo.GuetLogistics;

import java.util.List;

public interface ILogisticsService {

    // 根据订单ID查询物流轨迹
    List<GuetLogistics> getByOrderId(Integer orderId);

    // 查询订单最新物流状态
    GuetLogistics getLatestByOrderId(Integer orderId);

    // 新增物流记录（更新物流状态）
    int addLogistics(GuetLogistics logistics);

    // 创建订单时初始化物流记录
    int initLogistics(Integer orderId, String location, String operator);

    // 删除订单相关的物流记录
    int deleteByOrderId(Integer orderId);
}
