package com.yang.mapper;

import com.yang.pojo.GuetOperationLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OperationLogMapper {

    // 插入日志
    int insert(GuetOperationLog log);

    // 分页查询日志
    List<GuetOperationLog> selectPage(@Param("offset") int offset,
                                       @Param("size") int size,
                                       @Param("module") String module,
                                       @Param("operation") String operation,
                                       @Param("username") String username,
                                       @Param("status") Integer status);

    // 查询日志总数
    int selectCount(@Param("module") String module,
                    @Param("operation") String operation,
                    @Param("username") String username,
                    @Param("status") Integer status);

    // 查询日志列表
    List<GuetOperationLog> selectList(@Param("username") String username,
                                       @Param("module") String module,
                                       @Param("startTime") String startTime,
                                       @Param("endTime") String endTime);

    // 查询最近的日志
    List<GuetOperationLog> selectRecent(@Param("limit") int limit);

    // 删除指定天数之前的日志
    int deleteByDays(@Param("days") int days);

    // 删除所有日志
    int deleteAll();
}
