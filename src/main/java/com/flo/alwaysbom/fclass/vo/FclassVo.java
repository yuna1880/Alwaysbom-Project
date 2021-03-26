package com.flo.alwaysbom.fclass.vo;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FclassVo {
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
    private Integer count;

    private List<BranchVo> branchList;

    public Integer getFinalPrice(){
        return (int)(price * (1 - discountRate / 100.0));
    }
}
