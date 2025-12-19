package com.yang.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface StatisticsMapper {

    // 按日期统计订单数量和金额
    List<Map<String, Object>> getOrderStatsByDate(@Param("userId") Long userId, @Param("days") int days);

    // 按运输方式统计订单数量
    List<Map<String, Object>> getOrderStatsByShipping(@Param("userId") Long userId);

    // 按城市统计订单数量
    List<Map<String, Object>> getOrderStatsByCity(@Param("userId") Long userId);

    // 按物流状态统计订单数量
    List<Map<String, Object>> getOrderStatsByLogisticsStatus(@Param("userId") Long userId);

    // 获取总营收
    Map<String, Object> getTotalRevenue(@Param("userId") Long userId);
}
