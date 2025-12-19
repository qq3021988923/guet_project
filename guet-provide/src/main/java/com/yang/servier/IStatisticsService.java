package com.yang.servier;

import java.util.List;
import java.util.Map;

public interface IStatisticsService {

    // 按日期统计订单
    List<Map<String, Object>> getOrderStatsByDate(Long userId, int days);

    // 按运输方式统计
    List<Map<String, Object>> getOrderStatsByShipping(Long userId);

    // 按城市统计
    List<Map<String, Object>> getOrderStatsByCity(Long userId);

    // 按物流状态统计
    List<Map<String, Object>> getOrderStatsByLogisticsStatus(Long userId);

    // 获取总营收
    Map<String, Object> getTotalRevenue(Long userId);

    // 获取综合统计数据
    Map<String, Object> getOverviewStats(Long userId);
}
