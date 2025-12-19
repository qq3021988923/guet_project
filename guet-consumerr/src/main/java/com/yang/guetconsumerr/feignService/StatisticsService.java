package com.yang.guetconsumerr.feignService;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@FeignClient(name = "guet-provide", contextId = "statisticsFeign")
public interface StatisticsService {

    @GetMapping("/statistics/overview")
    Map<String, Object> getOverviewStats(@RequestParam(value = "userId", required = false) Long userId);

    @GetMapping("/statistics/date")
    List<Map<String, Object>> getOrderStatsByDate(
            @RequestParam(value = "userId", required = false) Long userId,
            @RequestParam(value = "days", defaultValue = "30") int days);

    @GetMapping("/statistics/shipping")
    List<Map<String, Object>> getOrderStatsByShipping(@RequestParam(value = "userId", required = false) Long userId);

    @GetMapping("/statistics/city")
    List<Map<String, Object>> getOrderStatsByCity(@RequestParam(value = "userId", required = false) Long userId);

    @GetMapping("/statistics/logistics")
    List<Map<String, Object>> getOrderStatsByLogisticsStatus(@RequestParam(value = "userId", required = false) Long userId);

    @GetMapping("/statistics/revenue")
    Map<String, Object> getTotalRevenue(@RequestParam(value = "userId", required = false) Long userId);
}
