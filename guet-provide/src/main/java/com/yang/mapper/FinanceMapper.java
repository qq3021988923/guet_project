package com.yang.mapper;

import com.yang.dto.FinanceVO;
import com.yang.pojo.Finance;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface FinanceMapper {

    int insert(Finance finance);

    Finance selectById(Long id);

    Finance selectByOrderId(Integer orderId);

    int update(Finance finance);

    List<FinanceVO> selectFinanceList(@Param("userId") Long userId,
                                      @Param("paymentStatus") Integer paymentStatus);

    Map<String, Object> selectFinanceStatistics(@Param("userId") Long userId);
}
