package com.yang.guetconsumerr.aspect;

import com.alibaba.fastjson.JSON;
import com.yang.annotation.OperationLog;
import com.yang.guetconsumerr.feignService.OperationLogService;
import com.yang.pojo.GuetOperationLog;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import java.lang.reflect.Method;

/**
 * 操作日志切面
 * 拦截带有 @OperationLog 注解的方法，自动记录操作日志
 */
@Aspect
@Component
public class OperationLogAspect {

    @Autowired
    private OperationLogService operationLogService;

    /**
     * 切点：拦截带有 @OperationLog 注解的方法
     */
    @Pointcut("@annotation(com.yang.annotation.OperationLog)")
    public void logPointcut() {}

    /**
     * 环绕通知：在方法执行前后记录日志
     */
    @Around("logPointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        // 创建日志对象
        GuetOperationLog log = new GuetOperationLog();
        
        // 获取注解信息
        MethodSignature signature = (MethodSignature) point.getSignature();
        Method method = signature.getMethod();
        OperationLog annotation = method.getAnnotation(OperationLog.class);
        
        if (annotation != null) {
            log.setModule(annotation.module());
            log.setOperation(annotation.operation());
        }
        
        // 获取请求信息
        try {
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            if (attributes != null) {
                HttpServletRequest request = attributes.getRequest();
                log.setIp(getIpAddress(request));
                
                // 从请求头获取用户信息（前端传递）
                String userId = request.getHeader("X-User-Id");
                String username = request.getHeader("X-Username");
                if (userId != null && !userId.isEmpty()) {
                    try {
                        log.setUserId(Long.parseLong(userId));
                    } catch (NumberFormatException e) {
                        // 忽略解析错误
                    }
                }
                // 解码中文用户名
                if (username != null && !username.isEmpty()) {
                    try {
                        username = java.net.URLDecoder.decode(username, "UTF-8");
                    } catch (Exception e) {
                        // 解码失败使用原值
                    }
                }
                log.setUsername(username != null ? username : "未知用户");
            }
        } catch (Exception e) {
            log.setUsername("系统");
        }
        
        // 获取方法名和参数
        String className = point.getTarget().getClass().getName();
        String methodName = signature.getName();
        log.setMethod(className + "." + methodName + "()");
        
        // 获取请求参数（限制长度，避免过长）
        try {
            Object[] args = point.getArgs();
            if (args != null && args.length > 0) {
                String params = JSON.toJSONString(args);
                if (params.length() > 2000) {
                    params = params.substring(0, 2000) + "...";
                }
                log.setParams(params);
            }
        } catch (Exception e) {
            log.setParams("参数解析失败");
        }
        
        // 执行原方法
        Object result = null;
        try {
            result = point.proceed();
            log.setStatus(1); // 成功
        } catch (Throwable e) {
            log.setStatus(0); // 失败
            log.setErrorMsg(e.getMessage());
            throw e; // 继续抛出异常
        } finally {
            // 异步保存日志（通过Feign调用Provider）
            try {
                operationLogService.save(log);
            } catch (Exception e) {
                System.err.println("保存操作日志失败: " + e.getMessage());
            }
        }
        
        return result;
    }

    /**
     * 获取客户端IP地址
     */
    private String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // 多个代理时取第一个IP
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }
        return ip;
    }
}
