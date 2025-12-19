package com.yang.servier.impl;

import com.yang.mapper.StatisticsMapper;
import com.yang.servier.IStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsServiceImpl implements IStatisticsService {

    @Autowired
    private StatisticsMapper statisticsMapper;

    @Override
    public List<Map<String, Object>> getOrderStatsByDate(Long userId, int days) {
        return statisticsMapper.getOrderStatsByDate(userId, days);
    }

    @Override
    public List<Map<String, Object>> getOrderStatsByShipping(Long userId) {
        return statisticsMapper.getOrderStatsByShipping(userId);
    }

    @Override
    public List<Map<String, Object>> getOrderStatsByCity(Long userId) {
        return statisticsMapper.getOrderStatsByCity(userId);
    }

    @Override
    public List<Map<String, Object>> getOrderStatsByLogisticsStatus(Long userId) {
        return statisticsMapper.getOrderStatsByLogisticsStatus(userId);
    }

    @Override
    public Map<String, Object> getTotalRevenue(Long userId) {
        return statisticsMapper.getTotalRevenue(userId);
    }

    @Override
    public Map<String, Object> getOverviewStats(Long userId) {
        Map<String, Object> result = new HashMap<>();
        result.put("dateStats", getOrderStatsByDate(userId, 30));
        result.put("shippingStats", getOrderStatsByShipping(userId));
        result.put("cityStats", getOrderStatsByCity(userId));
        result.put("logisticsStats", getOrderStatsByLogisticsStatus(userId));
        result.put("revenue", getTotalRevenue(userId));
        return result;
    }
}
