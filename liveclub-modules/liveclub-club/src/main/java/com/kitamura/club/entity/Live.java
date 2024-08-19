package com.kitamura.club.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.Instant;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "live")
public class Live {

    @Id
    private String id; // ID

    private int liveId; // Live 演出ID

    private int userId; // 发起用户ID

    private String liveTitle; // Live 演出标题

    private String liveDescription; // Live 演出描述

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'", timezone = "GMT")
    private Instant startTime; // 开始时间

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'", timezone = "GMT")
    private Instant endTime; // 结束时间

    private String liveLocationAddress; // 演出地点地址

    private String liveLocationName; // 演出地点名称

    private String liveLink; // Live 链接地址

    private List<Program> programs; // 每个时间段的节目列表

    private String livePicture; // Live 演出宣传图片地址

    private String createBy; // 创建者

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'", timezone = "GMT")
    private Instant createTime; // 创建时间

    private String updateBy; // 更新者

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'", timezone = "GMT")
    private Instant updateTime; // 更新时间

    private String remark; // 备注

    private double ticketPrice; // 演出票价

    private String liveType; // 演出类型

    private String organizer; // 主办方

    private String contactPhone; // 联系电话

    private boolean publicFlag; // 是否公开

    private int audienceLimit; // 观众限制

    private boolean cancelledFlag; // 是否取消
}