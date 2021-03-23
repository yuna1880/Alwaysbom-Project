package com.flo.alwaysbom.front.fclass.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ScheduleVo {
    public int idx;
    public int branchIdx;
    public int fclassIdx;
    public Date sdate;
    public int smonth;
    public int sday;
    public String startTime;
    public String endTime;
    public int totalCount;
    public int regCount;
}
