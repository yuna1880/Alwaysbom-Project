package com.flo.alwaysbom.product.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductVo {
    private Integer idx;
    private String category;
    private String name;
    private String subheader;
    private Integer price;
    private int discountRate;
    private String image1;
    private String image2;
    private String image3;
    private String content;
    private String delStatus;
    private String soldoutStatus;
    private String fsize;

    /* 핵심 비즈니스 로직 */
    // 최종 금액 출력
    public Integer getFinalPrice(){
        return (int)(price * (1 - discountRate / 100.0));
    }
}
