package com.yang;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
public class GuetProvideApplication {

    public static void main(String[] args) {
        SpringApplication.run(GuetProvideApplication.class, args);
    }
// nacos 启动命令 去到bin文件cmd  执行--> startup.cmd -m standalone
}
