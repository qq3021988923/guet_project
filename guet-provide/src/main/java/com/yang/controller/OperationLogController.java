package com.yang.controller;

import com.yang.pojo.GuetOperationLog;
import com.yang.servier.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/operationLog")
public class OperationLogController {

    @Autowired
    private IOperationLogService operationLogService;

    /**
     * 保存日志（供Consumer调用）
     * POST /operationLog/save
     */
    @PostMapping("/save")
    public void save(@RequestBody GuetOperationLog log) {
        operationLogService.save(log);
    }

    /**
     * 分页查询日志
     * GET /operationLog/page?page=1&size=10&module=订单管理&operation=新增&username=admin&status=1
     */
    @GetMapping("/page")
    public Map<String, Object> getPage(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String module,
            @RequestParam(required = false) String operation,
            @RequestParam(required = false) String username,
            @RequestParam(required = false) Integer status) {
        int offset = (page - 1) * size;
        List<GuetOperationLog> records = operationLogService.getPage(offset, size, module, operation, username, status);
        int total = operationLogService.getCount(module, operation, username, status);
        
        Map<String, Object> result = new HashMap<>();
        result.put("records", records);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return result;
    }

    /**
     * 查询日志列表
     * GET /operationLog/list?username=admin&module=订单管理&startTime=2025-12-01&endTime=2025-12-31
     */
    @GetMapping("/list")
    public List<GuetOperationLog> getList(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String module,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        return operationLogService.getList(username, module, startTime, endTime);
    }

    /**
     * 查询最近的日志
     * GET /operationLog/recent?limit=50
     */
    @GetMapping("/recent")
    public List<GuetOperationLog> getRecent(@RequestParam(defaultValue = "50") int limit) {
        return operationLogService.getRecent(limit);
    }

    /**
     * 清理旧日志
     * DELETE /operationLog/clean?days=30
     */
    @DeleteMapping("/clean")
    public int cleanOldLogs(@RequestParam(defaultValue = "30") int days) {
        return operationLogService.cleanOldLogs(days);
    }

    /**
     * 清空所有日志
     * DELETE /operationLog/clear
     */
    @DeleteMapping("/clear")
    public int clearAll() {
        return operationLogService.clearAll();
    }
}
