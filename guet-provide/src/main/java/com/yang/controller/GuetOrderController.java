package com.yang.controller;


import cn.idev.excel.FastExcel;
import com.yang.dto.OrderExportDTO;
import com.yang.mapper.FinanceMapper;
import com.yang.mapper.LogisticsMapper;
import com.yang.pojo.Finance;
import com.yang.pojo.GuetLogistics;
import com.yang.pojo.GuetOrder;
import com.yang.servier.IGuetOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import java.io.ByteArrayOutputStream;


import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/order")
public class GuetOrderController {


    @Autowired
    private IGuetOrderService iGuetOrderService;

    @Autowired
    private LogisticsMapper logisticsMapper;

    @Autowired
    private FinanceMapper financeMapper;


    // 客户对应的订单
    // http://localhost:8888/order/selectUsercus/1
    @GetMapping("/selectUsercus/{userId}")
    public List<GuetOrder> selectByUserIdWithCustomer(@PathVariable Long userId) {
        List<GuetOrder> guetOrders = iGuetOrderService.selectByUserIdWithCustomer(userId);
        return guetOrders;
    }


    // 查询所有订单
    // http://localhost:8888/order/list
    @GetMapping("/list")
    public List<GuetOrder> list() {
        return iGuetOrderService.selectAll();
    }

    // 根据ID查询
    // http://localhost:8888/order/1
    @GetMapping("/{id}")
    public GuetOrder getById(@PathVariable Integer id) {
        return iGuetOrderService.selectById(id);
    }

    // 条件查询
    @PostMapping("/query")
    public List<GuetOrder> query(@RequestBody GuetOrder order) {



        return iGuetOrderService.selectByCondition(order);
    }

    // 根据用户ID查询
    @GetMapping("/user")
    public List<GuetOrder> getByUserId(@RequestParam(required = false) Long userId) {
        return iGuetOrderService.selectByUserId(userId);
    }

    // 新增订单
    @PostMapping("/insert")
    public GuetOrder insert(@RequestBody GuetOrder order) {
        iGuetOrderService.insert(order);
        return order;  // 返回包含自动生成ID的order对象
    }

    // 更新订单
    @PostMapping("/update")
    public int update(@RequestBody GuetOrder order) {
        return iGuetOrderService.update(order);
    }

    // 删除订单
    @GetMapping("/delete/{id}")
    public int delete(@PathVariable Integer id) {
        return iGuetOrderService.deleteById(id);
    }


    @GetMapping("/export")
    public ResponseEntity<byte[]> exportExcel(@RequestParam(required = false) Long userId) throws IOException {

        // 1. 查询订单数据(带客户信息)
        List<GuetOrder> orders = (userId != null)
                ? iGuetOrderService.selectByUserIdWithCustomer(userId)
                : iGuetOrderService.selectAll(); // 这里可能需要新增 selectAllWithCustomer() 方法

        // 2. 转换为导出DTO
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<OrderExportDTO> exportData = new ArrayList<>();

        for (GuetOrder order : orders) {
            OrderExportDTO dto = new OrderExportDTO();
            dto.setNum(order.getNum());
            dto.setCustomerName(order.getCustomerName());
            dto.setName(order.getName());
            dto.setBrand(order.getBrand());
            dto.setNumber(order.getNumber());
            dto.setUnit(order.getUnit());
            dto.setPrice(order.getPrice());
            dto.setTotal(order.getTotal());
            dto.setPerson(order.getPerson());
            dto.setPhone(order.getPhone());
            dto.setAddress(order.getAddress());
            dto.setCiti(order.getCiti());
            dto.setShipping(order.getShipping());
            dto.setPayment(order.getPayment());
            dto.setPickup(order.getPickup());
            dto.setCreateTime(order.getCreateTime() != null ? sdf.format(order.getCreateTime()) : "");
            dto.setDesc(order.getDesc());

            // 物流状态
            GuetLogistics latest = logisticsMapper.selectLatestByOrderId(order.getId());
            if (latest != null) {
                dto.setLogisticsStatus(latest.getStatusText());
            } else {
                dto.setLogisticsStatus("待处理");
            }

            // 结算状态
            Finance finance = financeMapper.selectByOrderId(order.getId());
            if (finance != null) {
                switch (finance.getPaymentStatus()) {
                    case 1: dto.setSettlementStatus("待结算"); break;
                    case 2: dto.setSettlementStatus("部分结算"); break;
                    case 3: dto.setSettlementStatus("已结算"); break;
                    default: dto.setSettlementStatus("未知");
                }
            } else {
                dto.setSettlementStatus("无记录");
            }

            exportData.add(dto);
        }

        // 3. 创建字节数组输出流
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        // 4. 使用 FastExcel 写入到字节数组
        FastExcel.write(outputStream, OrderExportDTO.class)
                .sheet("订单列表")
                .doWrite(exportData);

        // 5. 设置响应头
        String fileName = "订单导出_" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + ".xlsx";
        String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8).replaceAll("\\+", "%20");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
        headers.setContentDispositionFormData("attachment", encodedFileName);

        return ResponseEntity.ok()
                .headers(headers)
                .body(outputStream.toByteArray());
    }

}
