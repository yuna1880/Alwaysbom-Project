package com.flo.alwaysbom.subs.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SubsVo {
    private Integer idx;
    private String name;
    private String subheader;
    private String summary;
    private Integer price;
    private String image1;
    private String image2;
    private String image3;
    private String content;
}
