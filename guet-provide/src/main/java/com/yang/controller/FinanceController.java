package com.yang.controller;

import com.yang.dto.FinanceVO;
import com.yang.dto.PaymentDTO;
import com.yang.pojo.GuetOrder;
import com.yang.pojo.PaymentRecord;
import com.yang.servier.IFinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/finance")
public class FinanceController {

    @Autowired
    private IFinanceService financeService;

    // 创建订单时自动生成运费记录
    @PostMapping("/create")
    public int createFinanceRecord(@RequestBody GuetOrder order) {
        financeService.createFinanceRecord(order);
        return 1;
    }

    // http://localhost:8888/finance/list
    @GetMapping("/list")
    public Map<String, Object> getFinanceList(@RequestParam(required = false) Long userId,
                                              @RequestParam(required = false) Integer paymentStatus) {
        List<FinanceVO> list = financeService.getFinanceList(userId, paymentStatus);
        Map<String, Object> statistics = financeService.getFinanceStatistics(userId);

        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("statistics", statistics);
        return result;
    }

    // http://localhost:8888/finance/payment
    @PostMapping("/payment")
    public int addPayment(@RequestBody PaymentDTO dto) {
        financeService.addPayment(dto);
        return 1;
    }

    // http://localhost:8888/finance/payment/{financeId}
    @GetMapping("/payment/{financeId}")
    public List<PaymentRecord> getPaymentRecords(@PathVariable Long financeId) {
        return financeService.getPaymentRecords(financeId);
    }

    // http://localhost:8888/finance/detail/{id}
    @GetMapping("/detail/{id}")
    public FinanceVO getFinanceDetail(@PathVariable Long id) {
        return financeService.getFinanceDetail(id);
    }
}
