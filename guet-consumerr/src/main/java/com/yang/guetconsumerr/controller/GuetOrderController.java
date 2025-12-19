package com.yang.guetconsumerr.controller;

import com.yang.annotation.OperationLog;
import com.yang.guetconsumerr.feignService.*;
import com.yang.pojo.*;
import com.yang.pojo.GuetLogistics;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/order")
public class GuetOrderController {

    @Autowired
    private GuetOrderService service;

    @Autowired
    private BasicDataService basicDataService;

    @Autowired
    private GuetUserService guetUserService;

    @Autowired
    private CustomerService customerService;


    //   // http://localhost:8088/consumer/api/order/selectUsercus/1
    @GetMapping("/selectUsercus/{userId}")
    public Result<List<GuetOrder>> selectByUserIdWithCustomer(@PathVariable Long userId) {
        List<GuetOrder> guetOrders = service.selectByUserIdWithCustomer(userId);
        return Result.build(guetOrders,guetOrders==null?500:200,"my order");
    }

    @Autowired
    private LogisticsService logisticsService;

    // http://localhost:8088/consumer/api/order/addorder
    @OperationLog(module = "订单管理", operation = "新增订单")
    @PostMapping("/addorder")
    public Result<GuetOrder> addOrder(@RequestBody GuetOrder order){
        System.out.println(order.getPerson());

        // "td" + System.currentTimeMillis() % 10000000000L;
        order.setNum("td" + System.currentTimeMillis() % 10000000000L);
        order.setStatus(1);
        int i = service.insert(order);

        // 新增成功后初始化物流记录
        if (i > 0 && order.getId() != null) {
            try {
                logisticsService.initLogistics(order.getId(), order.getAddress(), null);
            } catch (Exception e) {
                System.out.println("初始化物流记录失败: " + e.getMessage());
            }
        }

        return Result.build(order, i == 0 ? 500 : 200, "客户下单");
    }

    // http://localhost:8088/consumer/api/order/orderdetails/1
    @GetMapping("/orderdetails/{userId}")
    public Result<HashMap<String,Object>> orderDetails(@PathVariable Long userId){

        // 收货地址
        HashMap<String,Object> mp=new HashMap<>();
        List<String> custname=new ArrayList<>();

        GuetUser users = guetUserService.getUserById(userId);
        List<Customer> customers = customerService.selectByUserId(users.getId());

        mp.put("customers",customers);

        // 前端业务员的名字 不用下拉框 传给前端的不是数组 只读状态
        mp.put("uname",users.getName());// 当前登录账号用户的名字


        List<GuetBasicData> intervalList = basicDataService.getByName("常用区间");
        List<GuetBasicData> shippingList = basicDataService.getByName("运货方式");
        List<GuetBasicData> paymentList = basicDataService.getByName("付款方式");
        List<GuetBasicData> pickupList = basicDataService.getByName("取货方式");
        List<GuetBasicData> unitList = basicDataService.getByName("单位");

        if(intervalList !=null){
            List<GuetBasicData> interval = basicDataService.getbyParentId(intervalList.get(0).getBaseId());
            mp.put("interval",interval);// 到达城市
        }
        if(shippingList !=null){
            List<GuetBasicData> shipping = basicDataService.getbyParentId(shippingList.get(0).getBaseId());
            mp.put("shipping",shipping);// 运货方式
        }
        if(paymentList !=null){
            List<GuetBasicData> payment = basicDataService.getbyParentId(paymentList.get(0).getBaseId());
            mp.put("payment",payment);// 付款方式
        }
        if(pickupList !=null){
            List<GuetBasicData> pickup = basicDataService.getbyParentId(pickupList.get(0).getBaseId());
            mp.put("pickup",pickup);// 取货方式
        }
        if(unitList !=null){
            List<GuetBasicData> unit = basicDataService.getbyParentId(unitList.get(0).getBaseId());
            mp.put("unit",unit);// 单位
        }

        System.out.println("我是map结合"+mp);
        return Result.build(mp,200,"订单基础数据");
    }

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

     // http://localhost:8088/consumer/api/order/query
    @PostMapping("/query")
    public Result<List<GuetOrder>> query(@RequestBody(required = false) GuetOrder order) {

        if (order == null) {
            order = new GuetOrder();
        }
        List<GuetOrder> list = service.query(order);
        return Result.build(list, 200, "查询成功");
    }

    // http://localhost:8088/consumer/api/order/search
    // 模糊搜索订单（按订单号/货物名称）
    @PostMapping("/search")
    public Result<List<GuetOrder>> search(@RequestBody GuetOrder order) {
        List<GuetOrder> list = service.query(order);
        return Result.build(list, 200, "搜索成功");
    }

    // http://localhost:8088/consumer/api/order/user
    @GetMapping("/user")
    public Result<List<GuetOrder>> getByUserId(@RequestParam(required = false) Long userId) {
        List<GuetOrder> list = service.getByUserId(userId);
        return Result.build(list, 200, "查询成功");
    }

    @PostMapping("/insert")
    public Result<Integer> insert(@RequestBody GuetOrder order) {
        int i = service.insert(order);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "添加失败" : "添加订单成功");
    }

    @OperationLog(module = "订单管理", operation = "修改订单")
    @PostMapping("/update")
    public Result<Integer> update(@RequestBody GuetOrder order) {
        int i = service.update(order);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "更新失败" : "更新订单成功");
    }

    @OperationLog(module = "订单管理", operation = "删除订单")
    @GetMapping("/delete/{id}")
    public Result<Integer> delete(@PathVariable Integer id) {
        int i = service.delete(id);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "删除失败" : "删除订单成功");
    }
}
