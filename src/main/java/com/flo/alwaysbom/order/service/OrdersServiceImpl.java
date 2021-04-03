package com.flo.alwaysbom.order.service;


import com.flo.alwaysbom.cart.dao.CartDao;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {

    private final OrdersDao orderDao;
    private final CartDao cartDao;

    //주문완료시 저장
    @Override
    public OrdersVo insertOrder(OrdersVo ordersVo, List<OitemVo> olist) {
        orderDao.insertOrder(ordersVo);

        // 방법 1
        List<OitemVo> list = new ArrayList<>();
        for (OitemVo oitemVo : olist) {
            oitemVo.setOrdersIdx(ordersVo.getIdx());
            orderDao.insertOitem(oitemVo);
            cartDao.removeByIdx(oitemVo.getCartIdx());
            list.add(oitemVo);
        }

        /* 방법 2
        List<OitemVo> list = olist.stream()
                .peek(oitemVo -> {
                    oitemVo.setOrdersIdx(ordersVo.getIdx());
                    orderDao.insertOitem(oitemVo);
                })
                .collect(Collectors.toList());
         */

        ordersVo.setOlist(list);

        //남은 일


        return ordersVo;
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

    
    // 배송지 불러오기
    @Override
    public DeliveryInfoVo findAddress(MemberVO vo) {
        return orderDao.findAddress(vo);
    }

    @Override
    public int getPoint(MemberVO mvo) {
        return orderDao.getPoint(mvo);
    }


    @Override
    public OrdersVo saveDelivery(OrdersVo ordersVo) {
        orderDao.saveDelivery(ordersVo);
        return ordersVo;
    }

   

}
