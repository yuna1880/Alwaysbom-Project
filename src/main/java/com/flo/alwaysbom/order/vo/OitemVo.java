package com.flo.alwaysbom.order.vo;

import lombok.*;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OitemVo {
    private Integer idx;
    private Integer ordersIdx;
    private String letterContent;
    private String name;
    private int price;
    private String options;
    private String image;
    private String status;
    private Date requestDate;
    private Date deliveryStartDate;
    private String category;
    private int reviewCheck;

    //비즈니스 로직 관련 데이터..
    private boolean hasLetter;
    private List<OsubsVo> osubsList;
}
