package com.flo.alwaysbom.main.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MainVo {
    private Integer imageNum;
    private String imageName;
    private String link;
    private String orderStandard;
    private Integer fclassIdxBig;
    private Integer fclassIdxSmall;

}
