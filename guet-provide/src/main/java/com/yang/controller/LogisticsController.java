package com.yang.controller;

import com.yang.pojo.GuetLogistics;
import com.yang.servier.ILogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/logistics")
public class LogisticsController {

    @Autowired
    private ILogisticsService logisticsService;

    /**
     * 根据订单ID查询物流轨迹
     * GET /logistics/order/{orderId}
     */
    @GetMapping("/order/{orderId}")
    public List<GuetLogistics> getByOrderId(@PathVariable Integer orderId) {
        return logisticsService.getByOrderId(orderId);
    }

    /**
     * 查询订单最新物流状态
     * GET /logistics/latest/{orderId}
     */
    @GetMapping("/latest/{orderId}")
    public GuetLogistics getLatestByOrderId(@PathVariable Integer orderId) {
        return logisticsService.getLatestByOrderId(orderId);
    }

    /**
     * 新增物流记录（更新物流状态）
     * POST /logistics/add
     * Body: { orderId, status, location, operator, remark }
     */
    @PostMapping("/add")
    public int addLogistics(@RequestBody GuetLogistics logistics) {
        return logisticsService.addLogistics(logistics);
    }

    /**
     * 初始化物流记录（创建订单时调用）
     * POST /logistics/init
     */
    @PostMapping("/init")
    public int initLogistics(@RequestParam Integer orderId,
                             @RequestParam(required = false) String location,
                             @RequestParam(required = false) String operator) {
        return logisticsService.initLogistics(orderId, location, operator);
    }

    /**
     * 删除订单相关的物流记录
     * DELETE /logistics/order/{orderId}
     */
    @DeleteMapping("/order/{orderId}")
    public int deleteByOrderId(@PathVariable Integer orderId) {
        return logisticsService.deleteByOrderId(orderId);
    }
}
