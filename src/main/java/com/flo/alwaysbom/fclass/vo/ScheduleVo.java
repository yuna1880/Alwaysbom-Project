package com.flo.alwaysbom.fclass.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ScheduleVo {
    private Integer idx;
    private Integer branchIdx;
    private Integer fclassIdx;
    private Date sdate;
    private Integer smonth;
    private Integer sday;
    private String startTime;
    private String endTime;
    private Integer totalCount;
    private Integer regCount;
}
