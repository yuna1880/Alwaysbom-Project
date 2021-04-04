package com.flo.alwaysbom.order.service;

import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;

import java.util.List;

public interface OrdersService {

    OrdersVo insertOrder(OrdersVo vo, List<OitemVo> olist);
    void updateOrder(OrdersVo vo);
    void deleteOrder(OrdersVo vo);

    DeliveryInfoVo findAddress(MemberVO vo);

    int getPoint(MemberVO mvo);

    //주문 완료시 저장
    OrdersVo saveDelivery(OrdersVo ordersVo);

    //주문내역 조회
    List<OrdersVo> findByMember(MemberVO vo);


}
