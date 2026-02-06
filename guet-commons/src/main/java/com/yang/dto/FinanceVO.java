package com.yang.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Schema(description = "财务视图对象")
public class FinanceVO {

    @Schema(description = "财务记录ID")
    private Long id;

    @Schema(description = "订单ID")
    private Integer orderId;

    @Schema(description = "订单总额")
    private BigDecimal totalAmount;

    @Schema(description = "已付金额")
    private BigDecimal paidAmount;

    @Schema(description = "未付金额")
    private BigDecimal unpaidAmount;

    @Schema(description = "付款状态")
    private Integer paymentStatus;

    @Schema(description = "付款状态文本")
    private String paymentStatusText;

    @Schema(description = "收款次数")
    private Integer paymentCount;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Schema(description = "备注")
    private String remark;

    // 关联信息
    @Schema(description = "订单号")
    private String orderNum;

    @Schema(description = "货物名称")
    private String orderName;

    @Schema(description = "业务员ID")
    private Long userId;

    @Schema(description = "业务员姓名")
    private String userName;

    @Schema(description = "客户ID")
    private Integer customerId;

    @Schema(description = "客户名称")
    private String customerName;

    @Schema(description = "运输方式")
    private String shippingMethod;

    @Schema(description = "物流状态")
    private Integer logisticsStatus;
}
