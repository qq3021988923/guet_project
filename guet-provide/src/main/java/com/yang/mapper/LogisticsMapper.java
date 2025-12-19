package com.yang.mapper;

import com.yang.pojo.GuetLogistics;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LogisticsMapper {

    // 根据订单ID查询物流轨迹（按时间倒序）
    List<GuetLogistics> selectByOrderId(Integer orderId);

    // 查询订单最新物流状态
    GuetLogistics selectLatestByOrderId(Integer orderId);

    // 新增物流记录
    int insert(GuetLogistics logistics);

    // 批量新增（创建订单时初始化）
    int batchInsert(@Param("list") List<GuetLogistics> list);

    // 删除订单相关的物流记录
    int deleteByOrderId(Integer orderId);
}
