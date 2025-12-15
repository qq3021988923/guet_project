package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "orderFeign")
public interface GuetOrderService {


    @GetMapping("/order/list")
    List<GuetOrder> list();

    @GetMapping("/order/{id}")
    GuetOrder getById(@PathVariable("id") Integer id);

    @PostMapping("/order/query")
    List<GuetOrder> query(@RequestBody GuetOrder order);

    @GetMapping("/order/user/{userId}")
    List<GuetOrder> getByUserId(@PathVariable("userId") Long userId);

    @PostMapping("/order/insert")
    int insert(@RequestBody GuetOrder order);

    @PostMapping("/order/update")
    int update(@RequestBody GuetOrder order);

    @GetMapping("/order/delete/{id}")
    int delete(@PathVariable("id") Integer id);
}
