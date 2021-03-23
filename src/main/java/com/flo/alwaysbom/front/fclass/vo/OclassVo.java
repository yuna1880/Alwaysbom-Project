package com.flo.alwaysbom.front.fclass.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OclassVo {
    public int idx;
    public String memberId;
    public int regCount;
    public String payType;
    public String payTotal;
    public java.sql.Date payDate;
    public int discountGrade;
    public int discountPoint;
    public String fclassName;
    public String branchName;
    public String branchAddr;
    public String fclassImage;
    public Date scheduleDate;
    public String scheduleStartTime;
    public String scheduleEndTime;
    public int fclassCount;
    public String status;
    public int reviewCheck;
}
