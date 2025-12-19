package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "操作日志")
public class GuetOperationLog {

    @Schema(description = "ID")
    private Long id;

    @Schema(description = "操作用户ID")
    private Long userId;

    @Schema(description = "操作用户名")
    private String username;

    @Schema(description = "操作模块")
    private String module;

    @Schema(description = "操作类型")
    private String operation;

    @Schema(description = "请求方法")
    private String method;

    @Schema(description = "请求参数")
    private String params;

    @Schema(description = "操作IP")
    private String ip;

    @Schema(description = "状态：1成功 0失败")
    private Integer status;

    @Schema(description = "错误信息")
    private String errorMsg;

    @Schema(description = "操作时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
