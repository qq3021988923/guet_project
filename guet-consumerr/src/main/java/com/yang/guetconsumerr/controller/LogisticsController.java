package com.yang.guetconsumerr.controller;

import com.yang.annotation.OperationLog;
import com.yang.guetconsumerr.feignService.LogisticsService;
import com.yang.pojo.GuetLogistics;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/logistics")
public class LogisticsController {

    @Autowired
    private LogisticsService logisticsService;

    /**
     * 根据订单ID查询物流轨迹
     * GET /api/logistics/order/{orderId}
     * 访问网关
     */
    @GetMapping("/order/{orderId}")
    public Result<List<GuetLogistics>> getByOrderId(@PathVariable Integer orderId) {
        List<GuetLogistics> list = logisticsService.getByOrderId(orderId);
        return Result.build(list, 200, "查询成功");
    }

    /**
     * 查询订单最新物流状态
     * GET /api/logistics/latest/{orderId}
     */
    @GetMapping("/latest/{orderId}")
    public Result<GuetLogistics> getLatestByOrderId(@PathVariable Integer orderId) {
        GuetLogistics logistics = logisticsService.getLatestByOrderId(orderId);
        return Result.build(logistics, logistics != null ? 200 : 404, logistics != null ? "查询成功" : "暂无物流信息");
    }

    /**
     * 新增物流记录（更新物流状态）
     * POST /api/logistics/add
     */
    @OperationLog(module = "物流管理", operation = "更新物流状态")
    @PostMapping("/add")
    public Result<Integer> addLogistics(@RequestBody GuetLogistics logistics) {
        int i = logisticsService.addLogistics(logistics);
        return Result.build(i, i > 0 ? 200 : 500, i > 0 ? "更新成功" : "更新失败");
    }

    /**
     * 初始化物流记录
     * POST /api/logistics/init
     */
    @PostMapping("/init")
    public Result<Integer> initLogistics(@RequestParam Integer orderId,
                                         @RequestParam(required = false) String location,
                                         @RequestParam(required = false) String operator) {
        int i = logisticsService.initLogistics(orderId, location, operator);
        return Result.build(i, i > 0 ? 200 : 500, i > 0 ? "初始化成功" : "初始化失败");
    }

    /**
     * 删除订单相关的物流记录
     * DELETE /api/logistics/order/{orderId}
     */
    @DeleteMapping("/order/{orderId}")
    public Result<Integer> deleteByOrderId(@PathVariable Integer orderId) {
        int i = logisticsService.deleteByOrderId(orderId);
        return Result.build(i, 200, "删除成功");
    }
}
