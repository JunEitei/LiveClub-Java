package com.kitamura.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.kitamura.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 * 
 * @author damao
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class AuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(AuthApplication.class, args);
    }
}
