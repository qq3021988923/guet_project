package com.yang.servier;

import com.yang.pojo.GuetOperationLog;

import java.util.List;

public interface IOperationLogService {

    // 保存日志
    void save(GuetOperationLog log);

    // 分页查询日志
    List<GuetOperationLog> getPage(int offset, int size, String module, String operation, String username, Integer status);

    // 查询日志总数
    int getCount(String module, String operation, String username, Integer status);

    // 查询日志列表
    List<GuetOperationLog> getList(String username, String module, String startTime, String endTime);

    // 查询最近的日志
    List<GuetOperationLog> getRecent(int limit);

    // 清理旧日志
    int cleanOldLogs(int days);

    // 清空所有日志
    int clearAll();
}
