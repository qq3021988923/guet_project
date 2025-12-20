package com.yang.dto;

import lombok.Data;
import java.util.List;

/**
 * 批量下单DTO
 */
@Data
public class OrderBatchDTO {
    // 基本信息（共享）
    private Long userId;
    private Integer customerId;
    private String address;
    private String phone;
    private String person;
    private String citi;
    private String payment;
    private String shipping;
    private String pickup;
    private String desc;

    // 货物列表
    private List<OrderItemDTO> items;
}
