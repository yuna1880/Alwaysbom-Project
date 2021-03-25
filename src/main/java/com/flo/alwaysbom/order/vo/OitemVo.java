package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OitemVo {
    private Integer idx;
    private Integer orders_idx;
    private String letter_content;
    private String name;
    private Integer price;
    private String options;
    private String image;
    private String status;
    private String request_date;
    private String delivery_start_date;
    private String category;
    private Integer review_check;
}
