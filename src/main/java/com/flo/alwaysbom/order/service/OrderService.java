package com.flo.alwaysbom.order.service;

import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.member.MemberVO;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OrderVo;

import java.util.List;

public interface OrderService {


    void insertOrder(OrderVo vo);
    void updateOrder(OrderVo vo);
    void deleteOrder(OrderVo vo);
    OrderVo getOrder(OrderVo vo);

    //letter는 cart -> letter 라서 cartService에서..
    //void getLetter(OrderVo vo);

    List<OrderVo> getOrderList();
    List<OrderVo> getOrderList(OrderVo vo);

    DeliveryInfoVo findAddress(MemberVO vo);
}
