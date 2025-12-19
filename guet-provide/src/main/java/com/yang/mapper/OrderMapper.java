package com.yang.mapper;

import com.yang.pojo.GuetOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {

    List<GuetOrder> selectByUserIdWithCustomer(Long userId);

    List<GuetOrder> selectAll();

    GuetOrder selectById(Integer id);

    List<GuetOrder> selectByCondition(GuetOrder order);

    List<GuetOrder> selectByUserId(Long userId);

    int insert(GuetOrder order);

    int update(GuetOrder order);

    int deleteById(Integer id);
}
