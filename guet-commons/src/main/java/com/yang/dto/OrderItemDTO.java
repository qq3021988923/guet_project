package com.yang.dto;

import lombok.Data;

/**
 * 订单货物明细DTO
 */
@Data
public class OrderItemDTO {
    private String name;
    private Integer number;
    private String unit;
    private Integer price;
    private Long total;
    private String brand;
}
