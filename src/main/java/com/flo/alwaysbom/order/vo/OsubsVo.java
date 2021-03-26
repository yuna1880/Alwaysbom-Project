package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OsubsVo {
    private Integer idx;
    private Integer oitem_idx;
    private String month;
    private String delivery_date;
    private String delivery_status;
}
