package com.yang.guetconsumerr.feignService;

import com.yang.dto.FinanceVO;
import com.yang.dto.PaymentDTO;
import com.yang.pojo.GuetOrder;
import com.yang.pojo.PaymentRecord;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "guet-provide", contextId = "financeFeign")
public interface FinanceService {

    @PostMapping("/finance/create")
    int createFinanceRecord(@RequestBody GuetOrder order);

    @GetMapping("/finance/list")
    Map<String, Object> getFinanceList(@RequestParam(required = false) Long userId,
                                       @RequestParam(required = false) Integer paymentStatus);

    @PostMapping("/finance/payment")
    int addPayment(@RequestBody PaymentDTO dto);

    @GetMapping("/finance/payment/{financeId}")
    List<PaymentRecord> getPaymentRecords(@PathVariable Long financeId);

    @GetMapping("/finance/detail/{id}")
    FinanceVO getFinanceDetail(@PathVariable Long id);
}
