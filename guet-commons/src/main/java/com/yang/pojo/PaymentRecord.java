package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Schema(description = "收款记录")
public class PaymentRecord {

    @Schema(description = "收款记录ID")
    private Long id;

    @Schema(description = "财务记录ID")
    private Long financeId;

    @Schema(description = "订单ID")
    private Integer orderId;

    @Schema(description = "本次收款金额")
    private BigDecimal paymentAmount;

    @Schema(description = "付款方式")
    private String paymentMethod;

    @Schema(description = "收款时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date paymentTime;

    @Schema(description = "操作人ID")
    private Long operatorId;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
