package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetLogistics;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "guet-provide", contextId = "logisticsFeign")
public interface LogisticsService {

    @GetMapping("/logistics/order/{orderId}")
    List<GuetLogistics> getByOrderId(@PathVariable("orderId") Integer orderId);

    @GetMapping("/logistics/latest/{orderId}")
    GuetLogistics getLatestByOrderId(@PathVariable("orderId") Integer orderId);

    @PostMapping("/logistics/add")
    int addLogistics(@RequestBody GuetLogistics logistics);

    @PostMapping("/logistics/init")
    int initLogistics(@RequestParam("orderId") Integer orderId,
                      @RequestParam(value = "location", required = false) String location,
                      @RequestParam(value = "operator", required = false) String operator);

    @DeleteMapping("/logistics/order/{orderId}")
    int deleteByOrderId(@PathVariable("orderId") Integer orderId);
}
