package com.yang.guetconsumerr.controller;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/config")
@RefreshScope  // 支持配置动态刷新
public class ConfigTestController {

    @Value("${jwt.secret}")
    private String jwtSecret;

    @Value("${jwt.expiration}")
    private Long jwtExpiration;

    // http://localhost:9999/api/config/test
    // http://localhost:8088/consumer/api/config/test
    @GetMapping("/test")
    public Result<Map<String, Object>> testConfig() {
        Map<String, Object> config = new HashMap<>();
        //config.put("port", port);
        config.put("jwtSecret", jwtSecret.substring(0, 20) + "...");
        config.put("jwtExpiration", jwtExpiration);
        config.put("message", "配置来自 Nacos 配置中心");
        return Result.build(config,200,"成功");
    }
}
