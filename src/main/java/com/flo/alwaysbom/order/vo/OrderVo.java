package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrderVo {
    private Integer idx;
    private String member_id;
    private String odate;
    private String receiver_name;
    private String receiver_phone;
    private String receiver_zipcode;
    private String receiver_addr_base;
    private String receiver_addr_detail;
    private String receiver_addr_extra;
    private String sender_name;
    private String pay_type;
    private Integer pay_total;
    private Integer pay_delivery;
    private String pay_date;
    private Integer discount_grade;
    private Integer discount_point;
}
