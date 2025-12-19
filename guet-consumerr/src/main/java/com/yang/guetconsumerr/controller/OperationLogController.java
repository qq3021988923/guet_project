package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.OperationLogService;
import com.yang.pojo.GuetOperationLog;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/log")
public class OperationLogController {

    @Autowired
    private OperationLogService operationLogService;

    /**
     * 分页查询日志
     * GET /api/log/page?page=1&size=10&module=订单管理&operation=新增&username=admin&status=1
     */
    @GetMapping("/page")
    public Result<Map<String, Object>> getPage(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String module,
            @RequestParam(required = false) String operation,
            @RequestParam(required = false) String username,
            @RequestParam(required = false) Integer status) {
        Map<String, Object> result = operationLogService.getPage(page, size, module, operation, username, status);
        return Result.build(result, 200, "查询成功");
    }

    /**
     * 查询日志列表
     */
    @GetMapping("/list")
    public Result<List<GuetOperationLog>> getList(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String module,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        List<GuetOperationLog> list = operationLogService.getList(username, module, startTime, endTime);
        return Result.build(list, 200, "查询成功");
    }

    /**
     * 查询最近的日志
     */
    @GetMapping("/recent")
    public Result<List<GuetOperationLog>> getRecent(@RequestParam(defaultValue = "50") int limit) {
        List<GuetOperationLog> list = operationLogService.getRecent(limit);
        return Result.build(list, 200, "查询成功");
    }

    /**
     * 清理旧日志
     */
    @DeleteMapping("/clean")
    public Result<Integer> cleanOldLogs(@RequestParam(defaultValue = "30") int days) {
        int count = operationLogService.cleanOldLogs(days);
        return Result.build(count, 200, "清理成功，删除" + count + "条记录");
    }

    /**
     * 清空所有日志
     */
    @DeleteMapping("/clear")
    public Result<Integer> clearAll() {
        int count = operationLogService.clearAll();
        return Result.build(count, 200, "清空成功");
    }
}
