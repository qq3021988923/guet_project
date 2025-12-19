package com.yang.controller;

import com.yang.servier.IStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    private IStatisticsService statisticsService;

    /**
     * 获取综合统计数据
     * GET /statistics/overview?userId=1
     */
    @GetMapping("/overview")
    public Map<String, Object> getOverviewStats(@RequestParam(required = false) Long userId) {
        return statisticsService.getOverviewStats(userId);
    }

    /**
     * 按日期统计订单
     * GET /statistics/date?userId=1&days=30
     */
    @GetMapping("/date")
    public List<Map<String, Object>> getOrderStatsByDate(
            @RequestParam(required = false) Long userId,
            @RequestParam(defaultValue = "30") int days) {
        return statisticsService.getOrderStatsByDate(userId, days);
    }

    /**
     * 按运输方式统计
     * GET /statistics/shipping?userId=1
     */
    @GetMapping("/shipping")
    public List<Map<String, Object>> getOrderStatsByShipping(@RequestParam(required = false) Long userId) {
        return statisticsService.getOrderStatsByShipping(userId);
    }

    /**
     * 按城市统计
     * GET /statistics/city?userId=1
     */
    @GetMapping("/city")
    public List<Map<String, Object>> getOrderStatsByCity(@RequestParam(required = false) Long userId) {
        return statisticsService.getOrderStatsByCity(userId);
    }

    /**
     * 按物流状态统计
     * GET /statistics/logistics?userId=1
     */
    @GetMapping("/logistics")
    public List<Map<String, Object>> getOrderStatsByLogisticsStatus(@RequestParam(required = false) Long userId) {
        return statisticsService.getOrderStatsByLogisticsStatus(userId);
    }

    /**
     * 获取总营收
     * GET /statistics/revenue?userId=1
     */
    @GetMapping("/revenue")
    public Map<String, Object> getTotalRevenue(@RequestParam(required = false) Long userId) {
        return statisticsService.getTotalRevenue(userId);
    }
}
