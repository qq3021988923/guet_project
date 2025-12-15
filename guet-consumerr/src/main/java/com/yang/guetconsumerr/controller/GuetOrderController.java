package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.GuetOrderService;
import com.yang.pojo.GuetOrder;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class GuetOrderController {

    @Autowired
    private GuetOrderService service;

    // http://localhost:8088/consumer/api/order/list
    // http://localhost:9999/api/order/list
    @GetMapping("/list")
    public Result<List<GuetOrder>> list() {
        List<GuetOrder> list = service.list();
        return Result.build(list, 200, "订单列表");
    }

    @GetMapping("/{id}")
    public Result<GuetOrder> getById(@PathVariable Integer id) {
        GuetOrder order = service.getById(id);
        return Result.build(order, order != null ? 200 : 404, order != null ? "查询成功" : "订单不存在");
    }

    // 动态查询
    @PostMapping("/query")
    public Result<List<GuetOrder>> query(@RequestBody(required = false) GuetOrder order) {

        if (order == null) {
            order = new GuetOrder();
        }
        List<GuetOrder> list = service.query(order);
        return Result.build(list, 200, "查询成功");
    }

    @GetMapping("/user/{userId}")
    public Result<List<GuetOrder>> getByUserId(@PathVariable Long userId) {
        List<GuetOrder> list = service.getByUserId(userId);
        return Result.build(list, 200, "查询成功");
    }

    @PostMapping("/insert")
    public Result<Integer> insert(@RequestBody GuetOrder order) {
        int i = service.insert(order);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "添加失败" : "添加订单成功");
    }

    @PostMapping("/update")
    public Result<Integer> update(@RequestBody GuetOrder order) {
        int i = service.update(order);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "更新失败" : "更新订单成功");
    }

    @GetMapping("/delete/{id}")
    public Result<Integer> delete(@PathVariable Integer id) {
        int i = service.delete(id);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "删除失败" : "删除订单成功");
    }
}
