package com.flo.alwaysbom.order.service;


import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {

    private final OrdersDao orderdao;

    @Override
    public void insertOrder(OrdersVo vo) {

    }

    @Override
    public void updateOrder(OrdersVo vo) {

    }
    @Override
    public void deleteOrder(OrdersVo vo) {
    }
    @Override
    public OrdersVo getOrder(OrdersVo vo) {
        return null;
    }

    @Override
    public List<OrdersVo> getOrderList() {
        return null;
    }

    @Override
    public List<OrdersVo> getOrderList(OrdersVo vo) {
        return null;
    }

    @Override
    public DeliveryInfoVo findAddress(MemberVO vo) {
        return orderdao.findAddress(vo);
    }

    @Override
    public int getPoint(MemberVO mvo) {
        return orderdao.getPoint(mvo);
    }
}
