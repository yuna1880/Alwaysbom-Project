package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OsubsVo {
    private Integer idx;
    private Integer oitemIdx;
    private String month;
    private String deliveryDate;
    private String deliveryStatus;
}
