package com.flo.alwaysbom.fclass.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OclassVo {
    private Integer idx;
    private String memberId;
    private Integer regCount;
    private String payType;
    private String payTotal;
    private Date payDate;
    private Integer discountGrade;
    private Integer discountPoint;
    private String fclassName;
    private String branchName;
    private String branchAddr;
    private String fclassImage;
    private Date scheduleDate;
    private String scheduleStartTime;
    private String scheduleEndTime;
    private Integer fclassCount;
    private String status;
    private Integer reviewCheck;
}
