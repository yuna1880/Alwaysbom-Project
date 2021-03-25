package com.flo.alwaysbom.flower.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FlowerVo {
    private int idx;
    private String name;
    private String subheader;
    private int price;
    private String fsize;
    private int discountRate;
    private String image1;
    private String image2;
    private String image3;
    private String content;
    private String delStatus;
    private int freeDelivery;
}
