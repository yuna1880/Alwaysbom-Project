package com.flo.alwaysbom.flower.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FlowerVo {
    private Integer idx;
    private String name;
    private String subheader;
    private Integer price;
    private Integer newPrice;
    private String fsize;
    private Integer discountRate;
    private String image1;
    private String image2;
    private String image3;
    private String content;
    private String delStatus;
    private int freeDelivery;

    /* 핵심 비즈니스 로직 */
    // 무료배송 여부 메세지 출력
    public String getFreeDeliveryMessage() {
        if (freeDelivery == 0) {
            return "";
        } else {
            return "무료배송";
        }
    }
}
