package com.yang.controller;

import com.yang.pojo.GuetOrder;
import com.yang.servier.IGuetOrderService;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class GuetOrderController {


    @Autowired
    private IGuetOrderService iGuetOrderService;

    // 查询所有订单
    // http://localhost:8888/order/list
    @GetMapping("/list")
    public List<GuetOrder> list() {
        return iGuetOrderService.selectAll();
    }

    // 根据ID查询
    // http://localhost:8888/order/1
    @GetMapping("/{id}")
    public GuetOrder getById(@PathVariable Integer id) {
        return iGuetOrderService.selectById(id);
    }

    // 条件查询
    @PostMapping("/query")
    public List<GuetOrder> query(@RequestBody GuetOrder order) {
        return iGuetOrderService.selectByCondition(order);
    }

    // 根据用户ID查询
    @GetMapping("/user/{userId}")
    public List<GuetOrder> getByUserId(@PathVariable Long userId) {
        return iGuetOrderService.selectByUserId(userId);
    }

    // 新增订单
    @PostMapping("/insert")
    public int insert(@RequestBody GuetOrder order) {
        return iGuetOrderService.insert(order);
    }

    // 更新订单
    @PostMapping("/update")
    public int update(@RequestBody GuetOrder order) {
        return iGuetOrderService.update(order);
    }

    // 删除订单
    @GetMapping("/delete/{id}")
    public int delete(@PathVariable Integer id) {
        return iGuetOrderService.deleteById(id);
    }

}
