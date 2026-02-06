package com.yang.dto;


import cn.idev.excel.annotation.ExcelProperty;
import cn.idev.excel.annotation.write.style.ColumnWidth;
import cn.idev.excel.annotation.write.style.ContentStyle;
import cn.idev.excel.annotation.write.style.HeadStyle;
import cn.idev.excel.enums.poi.HorizontalAlignmentEnum;
import lombok.Data;

@Data
public class OrderExportDTO {

    @ExcelProperty("订单号")
    private String num;

    @ExcelProperty("客户名称")
    private String customerName;

    @ExcelProperty("货物名称")
    private String name;

    @ExcelProperty("品牌")
    private String brand;

    @ExcelProperty("数量")
    private Integer number;

    @ExcelProperty("单位")
    private String unit;

    @ExcelProperty("单价")
    private Integer price;

    @ExcelProperty("总价")
    private Long total;

    @ExcelProperty("收货人")
    private String person;

    @ExcelProperty("联系电话")
    private String phone;

    @ExcelProperty("收货地址")
    private String address;

    @ExcelProperty("到达城市")
    private String citi;

    @ExcelProperty("货运方式")
    private String shipping;

    @ExcelProperty("付款方式")
    private String payment;

    @ExcelProperty("取件方式")
    private String pickup;

    @ExcelProperty("下单时间")
    private String createTime;

    @ExcelProperty("物流状态")
    private String logisticsStatus;

    @ExcelProperty("结算状态")
    private String settlementStatus;

    @ExcelProperty("备注")
    private String desc;
}
