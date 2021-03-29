package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OitemVo {
    private Integer idx;
    private Integer ordersIdx;
    private String letterContent;
    private String name;
    private Integer price;
    private String options;
    private String image;
    private String status;
    private String requestDate;
    private String deliveryStartDate;
    private String category;
    private Integer reviewCheck;
}
