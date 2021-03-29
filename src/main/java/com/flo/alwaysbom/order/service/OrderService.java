package com.flo.alwaysbom.order.service;

import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OrderVo;

import java.util.List;

public interface OrderService {

    void insertOrder(OrderVo vo);
    void updateOrder(OrderVo vo);
    void deleteOrder(OrderVo vo);
    OrderVo getOrder(OrderVo vo);

    List<OrderVo> getOrderList();
    List<OrderVo> getOrderList(OrderVo vo);

    DeliveryInfoVo findAddress(MemberVO vo);

    int getPoint(MemberVO mvo);
}
