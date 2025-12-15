package com.yang.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "基础表")
public class GuetBasicData {

    @Schema(description = "唯一标识")
    private int baseId;

    @Schema(description = "子类id")
    private int parentId;

    @Schema(description = "名字")
    private String baseName;

    @Schema(description = "描述 ")
    private String baseDesc;

}
