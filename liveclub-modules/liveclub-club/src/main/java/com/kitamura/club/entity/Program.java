package com.kitamura.club.entity;

import lombok.*;

import java.time.Instant;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Program {

    private String programId; // 节目ID

    private String programName; // 节目名称

    private Instant startTime; // 节目开始时间

    private Instant endTime; // 节目结束时间

    private Band band; // 该时间段的樂隊組合
}