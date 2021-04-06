package com.flo.alwaysbom.statistics.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SubsByMonthVo {
    private String month;
    private Integer subsCount;
}
