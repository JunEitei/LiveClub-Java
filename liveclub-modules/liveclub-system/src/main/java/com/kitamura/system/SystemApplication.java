package com.kitamura.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.kitamura.common.security.annotation.EnableCustomConfig;
import com.kitamura.common.security.annotation.EnableRyFeignClients;
import com.kitamura.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 系统模块
 * 
 * @author damao
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SystemApplication.class, args);
    }
}
