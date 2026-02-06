package com.yang.servier;

import com.yang.dto.FinanceVO;
import com.yang.dto.PaymentDTO;
import com.yang.pojo.Finance;
import com.yang.pojo.GuetOrder;
import com.yang.pojo.PaymentRecord;

import java.util.List;
import java.util.Map;

public interface IFinanceService {

    void createFinanceRecord(GuetOrder order);

    List<FinanceVO> getFinanceList(Long userId, Integer paymentStatus);

    Map<String, Object> getFinanceStatistics(Long userId);

    void addPayment(PaymentDTO dto);

    List<PaymentRecord> getPaymentRecords(Long financeId);

    FinanceVO getFinanceDetail(Long id);
}
