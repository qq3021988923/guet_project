package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "用户角色中间表")
public class    UserRole {

    @Schema(description = "唯一标识")
    private Long id;

    @Schema(description = "用户id")
    private Long roleId;

    @Schema(description = "角色id")
    private Long userId;

}
