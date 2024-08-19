package com.kitamura.club.entity;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.Instant;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "band")
public class Band {

    @Id
    private String id; // 乐队ID

    private String name; // 乐队名称

    private String style; // 乐队音乐风格或风格特征

    private String description; // 乐队描述或简介

    private List<Artist> members; // 乐队成员，由多个艺术家组成

    private Instant createdAt; // 乐队创建时间

    private List<String> photos; // 乐队照片，存储照片地址的数组
}