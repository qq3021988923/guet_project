package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@Schema(description = "角色类")
public class GuetRole implements Serializable {

    @Schema(description = "唯一标识")
    private Long id;

    @Schema(description = "昵称")
    private String roleName;

    @Schema(description = "角色代码")
    private String roleCode;

    @Schema(description = "备注")
    private String memo;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "修改时间")
    private Date updateTime;

    @Schema(description = "是否删除")
    private Integer isDeleted;


}
