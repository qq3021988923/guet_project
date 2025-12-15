package com.yang.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@Schema(description = "用户实体类")
public class GuetUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "唯一标识")
    private Long id;

    @Schema(description = "用户名")
    private String username;

    @Schema(description = "密码")
    private String password;

    @Schema(description = "昵称")
    private String name;

    @Schema(description = "电话号码")
    private String phone;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "备注")
    private String memo;

    @Schema(description = "状态：1为正常，0为禁止")
    private Integer status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "创建时间")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "修改时间")
    private Date updateTime;

    @Schema(description = "性别")
    private String sex;


//    @Schema(description = "微信open id")
//    private String openId;

//    @Schema(description = "微信开放平台unionID")
//    private String unionId;

//    @Schema(description = "最后一次登录ip")
//    private String lastLoginIp;
//
//    @Schema(description = "最后一次登录时间")
//    private Date lastLoginTime;

}
