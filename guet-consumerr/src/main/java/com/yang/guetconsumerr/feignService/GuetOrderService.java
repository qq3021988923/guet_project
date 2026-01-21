package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetOrder;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "orderFeign")
public interface GuetOrderService {


    @GetMapping("/order/export")
    ResponseEntity<byte[]> exportExcel(@RequestParam(required = false) Long userId);


    @GetMapping("/order/selectUsercus/{userId}")
    public List<GuetOrder> selectByUserIdWithCustomer(@PathVariable Long userId);

    @GetMapping("/order/list")
    List<GuetOrder> list();

    @GetMapping("/order/{id}")
    GuetOrder getById(@PathVariable("id") Integer id);

    @PostMapping("/order/query")
    List<GuetOrder> query(@RequestBody GuetOrder order);

    @GetMapping("/order/user")
    List<GuetOrder> getByUserId(@RequestParam(required = false) Long userId);

    @PostMapping("/order/insert")
    GuetOrder insert(@RequestBody GuetOrder order);

    @PostMapping("/order/update")
    int update(@RequestBody GuetOrder order);

    @GetMapping("/order/delete/{id}")
    int delete(@PathVariable("id") Integer id);
}
