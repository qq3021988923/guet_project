package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.StatisticsService;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    /**
     * 获取综合统计数据
     * GET /api/statistics/overview?userId=1
     * http://localhost:8088/consumer/api/statistics/overview
     */
    @GetMapping("/overview")
    public Result<Map<String, Object>> getOverviewStats(@RequestParam(required = false) Long userId) {
        Map<String, Object> data = statisticsService.getOverviewStats(userId);
        return Result.build(data, 200, "获取成功");
    }

    /**
     * 按日期统计订单
     */
    @GetMapping("/date")
    public Result<List<Map<String, Object>>> getOrderStatsByDate(
            @RequestParam(required = false) Long userId,
            @RequestParam(defaultValue = "30") int days) {
        List<Map<String, Object>> data = statisticsService.getOrderStatsByDate(userId, days);
        return Result.build(data, 200, "获取成功");
    }

    /**
     * 按运输方式统计
     */
    @GetMapping("/shipping")
    public Result<List<Map<String, Object>>> getOrderStatsByShipping(@RequestParam(required = false) Long userId) {
        List<Map<String, Object>> data = statisticsService.getOrderStatsByShipping(userId);
        return Result.build(data, 200, "获取成功");
    }

    /**
     * 按城市统计
     */
    @GetMapping("/city")
    public Result<List<Map<String, Object>>> getOrderStatsByCity(@RequestParam(required = false) Long userId) {
        List<Map<String, Object>> data = statisticsService.getOrderStatsByCity(userId);
        return Result.build(data, 200, "获取成功");
    }

    /**
     * 按物流状态统计
     */
    @GetMapping("/logistics")
    public Result<List<Map<String, Object>>> getOrderStatsByLogisticsStatus(@RequestParam(required = false) Long userId) {
        List<Map<String, Object>> data = statisticsService.getOrderStatsByLogisticsStatus(userId);
        return Result.build(data, 200, "获取成功");
    }

    /**
     * 获取总营收
     */
    @GetMapping("/revenue")
    public Result<Map<String, Object>> getTotalRevenue(@RequestParam(required = false) Long userId) {
        Map<String, Object> data = statisticsService.getTotalRevenue(userId);
        return Result.build(data, 200, "获取成功");
    }
}
