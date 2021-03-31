package com.flo.alwaysbom.order.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrdersVo {
    private Integer idx;
    private String memberId;
    private String odate;
    private String receiverName;
    private String receiverPhone;
    private String receiverZipcode;
    private String receiverAddrBase;
    private String receiverAddrDetail;
    private String receiverAddrExtra;
    private String senderName;
    private String payType;
    private Integer payTotal;
    private Integer payDelivery;
    private String payDate;
    private Integer discountGrade;
    private Integer discountPoint;

    //비즈니스 로직 관련 데이터..
    private boolean saveAddress;



}
