package com.yang.guetconsumerr.controller;

import com.yang.annotation.OperationLog;
import com.yang.dto.PaymentDTO;
import com.yang.guetconsumerr.feignService.FinanceService;
import com.yang.pojo.PaymentRecord;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/finance")
public class FinanceController {

    @Autowired
    private FinanceService financeService;

    // http://localhost:8088/consumer/api/finance/list
    // http://localhost:9999/api/finance/list
    @GetMapping("/list")
    public Result<Map<String, Object>> getFinanceList(@RequestParam(required = false) Long userId,
                                                      @RequestParam(required = false) Integer paymentStatus) {
        Map<String, Object> data = financeService.getFinanceList(userId, paymentStatus);
        return Result.build(data, 200, "查询成功");
    }

    // http://localhost:8088/consumer/api/finance/payment
    @OperationLog(module = "运费结算", operation = "添加结算")
    @PostMapping("/payment")
    public Result<Integer> addPayment(@RequestBody PaymentDTO dto) {
        int result = financeService.addPayment(dto);
        return Result.build(result, result == 0 ? 500 : 200, "结算成功");
    }

    // http://localhost:8088/consumer/api/finance/payment/{financeId}
    @GetMapping("/payment/{financeId}")
    public Result<List<PaymentRecord>> getPaymentRecords(@PathVariable Long financeId) {
        List<PaymentRecord> records = financeService.getPaymentRecords(financeId);
        return Result.build(records, 200, "查询成功");
    }

    // http://localhost:8088/consumer/api/finance/detail/{id}
    @GetMapping("/detail/{id}")
    public Result getFinanceDetail(@PathVariable Long id) {
        return Result.build(financeService.getFinanceDetail(id), 200, "查询成功");
    }
}
