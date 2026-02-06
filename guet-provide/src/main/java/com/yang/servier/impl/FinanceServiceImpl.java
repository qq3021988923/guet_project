package com.yang.servier.impl;

import com.yang.dto.FinanceVO;
import com.yang.dto.PaymentDTO;
import com.yang.mapper.FinanceMapper;
import com.yang.mapper.PaymentRecordMapper;
import com.yang.pojo.Finance;
import com.yang.pojo.GuetOrder;
import com.yang.pojo.PaymentRecord;
import com.yang.servier.IFinanceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class FinanceServiceImpl implements IFinanceService {

    @Autowired
    private FinanceMapper financeMapper;

    @Autowired
    private PaymentRecordMapper paymentRecordMapper;

    @Override
    public void createFinanceRecord(GuetOrder order) {
        // 检查是否已存在
        Finance existing = financeMapper.selectByOrderId(order.getId());
        if (existing != null) {
            return;
        }

        Finance finance = new Finance();
        finance.setOrderId(order.getId());
        finance.setTotalAmount(new BigDecimal(order.getTotal()));
        finance.setPaidAmount(BigDecimal.ZERO);
        finance.setUnpaidAmount(new BigDecimal(order.getTotal()));
        finance.setPaymentStatus(1);
        finance.setPaymentCount(0);

        financeMapper.insert(finance);
    }

    @Override
    public List<FinanceVO> getFinanceList(Long userId, Integer paymentStatus) {
        List<FinanceVO> list = financeMapper.selectFinanceList(userId, paymentStatus);

        for (FinanceVO vo : list) {
            vo.setPaymentStatusText(getStatusText(vo.getPaymentStatus()));
        }

        return list;
    }

    @Override
    public Map<String, Object> getFinanceStatistics(Long userId) {
        return financeMapper.selectFinanceStatistics(userId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addPayment(PaymentDTO dto) {
        // 1. 查询财务记录
        Finance finance = financeMapper.selectById(dto.getFinanceId());
        if (finance == null) {
            throw new RuntimeException("财务记录不存在");
        }

        // 2. 校验收款金额
        BigDecimal newPaidAmount = finance.getPaidAmount().add(dto.getPaymentAmount());
        if (newPaidAmount.compareTo(finance.getTotalAmount()) > 0) {
            throw new RuntimeException("收款金额超过订单总额");
        }

        // 3. 插入收款记录
        PaymentRecord record = new PaymentRecord();
        BeanUtils.copyProperties(dto, record);
        if (record.getPaymentTime() == null) {
            record.setPaymentTime(new Date());
        }
        if (record.getCreateTime() == null) {
            record.setCreateTime(new Date());
        }
        paymentRecordMapper.insert(record);

        // 4. 更新财务记录
        finance.setPaidAmount(newPaidAmount);
        finance.setUnpaidAmount(finance.getTotalAmount().subtract(newPaidAmount));
        finance.setPaymentCount(finance.getPaymentCount() + 1);

        // 5. 更新付款状态
        if (finance.getPaidAmount().compareTo(finance.getTotalAmount()) == 0) {
            finance.setPaymentStatus(3);
        } else if (finance.getPaidAmount().compareTo(BigDecimal.ZERO) > 0) {
            finance.setPaymentStatus(2);
        }

        financeMapper.update(finance);
    }

    @Override
    public List<PaymentRecord> getPaymentRecords(Long financeId) {
        return paymentRecordMapper.selectByFinanceId(financeId);
    }

    @Override
    public FinanceVO getFinanceDetail(Long id) {
        List<FinanceVO> list = financeMapper.selectFinanceList(null, null);
        for (FinanceVO vo : list) {
            if (vo.getId().equals(id)) {
                vo.setPaymentStatusText(getStatusText(vo.getPaymentStatus()));
                return vo;
            }
        }
        return null;
    }

    private String getStatusText(Integer status) {
        if (status == null) {
            return "未知";
        }
        switch (status) {
            case 1: return "待结算";
            case 2: return "部分结算";
            case 3: return "已结算";
            default: return "未知";
        }
    }
}
