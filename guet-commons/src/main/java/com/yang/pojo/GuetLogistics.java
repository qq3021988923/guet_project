package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "物流轨迹")
public class GuetLogistics {

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "订单ID")
    private Integer orderId;

    @Schema(description = "状态: 1待取件 2已取件 3运输中 4已送达 5已签收")
    private Integer status;

    @Schema(description = "当前位置")
    private String location;

    @Schema(description = "操作人")
    private String operator;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    // 状态文字描述（非数据库字段）
    @Schema(description = "状态描述")
    private String statusText;

    // 根据状态码获取状态描述
    public String getStatusText() {
        if (status == null) return "";
        switch (status) {
            case 1: return "待取件";
            case 2: return "已取件";
            case 3: return "运输中";
            case 4: return "已送达";
            case 5: return "已签收";
            default: return "未知状态";
        }
    }
}
