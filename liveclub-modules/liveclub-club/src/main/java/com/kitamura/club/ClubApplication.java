package com.kitamura.club;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.kitamura.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 文件服务
 * 
 * @author damao
 */
@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class ClubApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(ClubApplication.class, args);
    }
}
