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
@Document(collection = "artist")
public class Artist {

    @Id
    private String id; // 艺术家ID

    private String name; // 艺术家姓名

    private String role; // 艺术家角色，如乐手、歌手等

    private String instrument; // 乐器信息，如果是乐手的话

    private int age; // 艺术家年龄

    private String nationality; // 艺术家国籍

    private String description; // 艺术家简介或描述

    private List<String> photoUrls; // 艺术家照片的URL地址列表

    private String line; // Line 账号

    private String facebook; // Facebook 账号

    private String instagram; // Instagram 账号

    private String gender; // 性别

    private String zodiac; // 星座

    private Instant birthdate; // 出生日期

    private List<String> favouriteLivehouses; // 经常去的Livehouse

    private List<Band> favouriteBands; // 喜欢的乐队

    private List<Live> historyLives; // 参加过的演出
}