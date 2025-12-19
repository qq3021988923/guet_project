package com.yang.servier.impl;

import com.yang.mapper.OperationLogMapper;
import com.yang.pojo.GuetOperationLog;
import com.yang.servier.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperationLogServiceImpl implements IOperationLogService {

    @Autowired
    private OperationLogMapper operationLogMapper;

    @Override
    @Async  // 异步保存，不影响主业务性能
    public void save(GuetOperationLog log) {
        try {
            operationLogMapper.insert(log);
        } catch (Exception e) {
            // 日志保存失败不影响主业务
            System.err.println("保存操作日志失败: " + e.getMessage());
        }
    }

    @Override
    public List<GuetOperationLog> getPage(int offset, int size, String module, String operation, String username, Integer status) {
        return operationLogMapper.selectPage(offset, size, module, operation, username, status);
    }

    @Override
    public int getCount(String module, String operation, String username, Integer status) {
        return operationLogMapper.selectCount(module, operation, username, status);
    }

    @Override
    public List<GuetOperationLog> getList(String username, String module, String startTime, String endTime) {
        return operationLogMapper.selectList(username, module, startTime, endTime);
    }

    @Override
    public List<GuetOperationLog> getRecent(int limit) {
        return operationLogMapper.selectRecent(limit);
    }

    @Override
    public int cleanOldLogs(int days) {
        return operationLogMapper.deleteByDays(days);
    }

    @Override
    public int clearAll() {
        return operationLogMapper.deleteAll();
    }
}
