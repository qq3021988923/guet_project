package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetOperationLog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "guet-provide", contextId = "operationLogFeign")
public interface OperationLogService {

    @PostMapping("/operationLog/save")
    void save(@RequestBody GuetOperationLog log);

    @GetMapping("/operationLog/page")
    Map<String, Object> getPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "module", required = false) String module,
            @RequestParam(value = "operation", required = false) String operation,
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "status", required = false) Integer status);

    @GetMapping("/operationLog/list")
    List<GuetOperationLog> getList(
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "module", required = false) String module,
            @RequestParam(value = "startTime", required = false) String startTime,
            @RequestParam(value = "endTime", required = false) String endTime);

    @GetMapping("/operationLog/recent")
    List<GuetOperationLog> getRecent(@RequestParam(value = "limit", defaultValue = "50") int limit);

    @DeleteMapping("/operationLog/clean")
    int cleanOldLogs(@RequestParam(value = "days", defaultValue = "30") int days);

    @DeleteMapping("/operationLog/clear")
    int clearAll();
}
