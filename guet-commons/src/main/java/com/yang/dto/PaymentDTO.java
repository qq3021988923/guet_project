package com.yang.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Schema(description = "收款请求DTO")
public class PaymentDTO {

    @Schema(description = "财务记录ID")
    private Long financeId;

    @Schema(description = "订单ID")
    private Integer orderId;

    @Schema(description = "收款金额")
    private BigDecimal paymentAmount;

    @Schema(description = "付款方式")
    private String paymentMethod;

    @Schema(description = "收款时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date paymentTime;

    @Schema(description = "操作人ID")
    private Long operatorId;
}
