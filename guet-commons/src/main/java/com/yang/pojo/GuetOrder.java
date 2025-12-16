package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "订单")
public class GuetOrder {

    @Schema(description = "订单ID")
    private Integer id;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "客户ID")
    private Integer customerId;

    @Schema(description = "订单号码")
    private String num;

    @Schema(description = "货物名称")
    private String name;//

    @Schema(description = "订单数量")
    private Integer number;//

    @Schema(description = "价格")
    private Integer price;//

    @Schema(description = "总价格")
    private Long total;//

    @Schema(description = "状态")
    private Integer status;

    @Schema(description = "地址")
    private String address;//

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Schema(description = "付款方式")
    private String payment;//

    @Schema(description = "货运方式")
    private String shipping;//

    @Schema(description = "城市")
    private String citi;//

    @Schema(description = "备注")
    private String desc;//

    @Schema(description = "手机号码")
    private String phone;//

    @Schema(description = "收货人")
    private String person;//

    @Schema(description = "取件方式")
    private String pickup;//

    @Schema(description = "单位")
    private String unit;//

    @Schema(description = "品牌")
    private String brand;

}
