package com.itecho.jige;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j
@SpringBootApplication
@ServletComponentScan
@MapperScan("com.itecho.jige.mapper")
@EnableTransactionManagement
@EnableCaching
public class JigeApplication {
    public static void main(String[] args) {
        SpringApplication.run(JigeApplication.class,args);
        log.info("项目启动成功...");
    }
}
