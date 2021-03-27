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

    /* 핵심 비즈니스 로직 */
    // 최종 금액 출력
    public Integer getFinalPrice(){
        return (int)(price * (1 - discountRate / 100.0));
    }
}
