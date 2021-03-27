package com.flo.alwaysbom.fclass.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ScheduleVo {
    private int idx;
    private int branchIdx;
    private int fclassIdx;
    private Date sdate;
    private int smonth;
    private int sday;
    private String startTime;
    private String endTime;
    private int totalCount;
    private int regCount;

    public int getSmonth() {
        return sdate.toLocalDate().getMonth().getValue();
    }

    public int getSday() {
        return sdate.toLocalDate().getDayOfMonth();
    }
}
