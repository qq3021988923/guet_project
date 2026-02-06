package com.yang.mapper;

import com.yang.pojo.PaymentRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentRecordMapper {

    int insert(PaymentRecord record);

    List<PaymentRecord> selectByFinanceId(Long financeId);

    List<PaymentRecord> selectByOrderId(Integer orderId);
}
