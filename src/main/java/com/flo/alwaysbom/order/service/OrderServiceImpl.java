package com.flo.alwaysbom.order.service;


import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrderDao;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OrderVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderDao orderdao;

    @Override
    public void insertOrder(OrderVo vo) {

    }

    @Override
    public void updateOrder(OrderVo vo) {

    }

    @Override
    public void deleteOrder(OrderVo vo) {

    }

    @Override
    public OrderVo getOrder(OrderVo vo) {
        return null;
    }

    @Override
    public List<OrderVo> getOrderList() {
        return null;
    }

    @Override
    public List<OrderVo> getOrderList(OrderVo vo) {
        return null;
    }

    @Override
    public DeliveryInfoVo findAddress(MemberVO vo) {
        return orderdao.findAddress(vo);
    }
}
