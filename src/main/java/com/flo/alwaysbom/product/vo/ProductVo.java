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
    private Integer discountRate;
    private String image1;
    private String image2;
    private String image3;
    private String content;
    private String delStatus;
    private String soldoutStatus;
}
