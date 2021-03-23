package com.flo.alwaysbom.fclass.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FclassVo {
    public Integer idx;
    public String category;
    public String name;
    public String subheader;
    public Integer price;
    public Integer discountRate;
    public String image1;
    public String image2;
    public String image3;
    public String content;
    public Integer count;
}
