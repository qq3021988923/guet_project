package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "客户实体类")
public class Customer {

    @Schema(description = "客户ID")
    private Integer id;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "订单ID")
    private Integer orderId;

    @Schema(description = "名字")
    private String name;

    @Schema(description = "手机号码")
    private String phone;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "地址")
    private String address;

    @Schema(description = "性别")
    private String sex;

    @Schema(description = "备注")
    private String desc;

}
