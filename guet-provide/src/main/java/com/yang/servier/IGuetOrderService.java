package com.yang.servier;

import com.yang.pojo.GuetOrder;

import java.util.List;

public interface IGuetOrderService {


    List<GuetOrder> selectAll();

    GuetOrder selectById(Integer id);

    List<GuetOrder> selectByCondition(GuetOrder order);

    List<GuetOrder> selectByUserId(Long userId);

    int insert(GuetOrder order);

    int update(GuetOrder order);

    int deleteById(Integer id);
}
