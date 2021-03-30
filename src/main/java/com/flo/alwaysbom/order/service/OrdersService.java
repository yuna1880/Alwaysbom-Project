package com.flo.alwaysbom.order.service;

import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OrdersVo;

import java.util.List;

public interface OrdersService {

    void insertOrder(OrdersVo vo);
    void updateOrder(OrdersVo vo);
    void deleteOrder(OrdersVo vo);
    OrdersVo getOrder(OrdersVo vo);

    List<OrdersVo> getOrderList();
    List<OrdersVo> getOrderList(OrdersVo vo);

    DeliveryInfoVo findAddress(MemberVO vo);

    int getPoint(MemberVO mvo);
}
