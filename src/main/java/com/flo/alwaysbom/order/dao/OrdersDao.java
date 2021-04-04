package com.flo.alwaysbom.order.dao;

import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrdersDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    //결제완료시 ordersVo 저장 !(insert)
    public int insertOrder(OrdersVo vo) {
        System.out.println(">> OrderDao() insertOrder()실행");
        return sqlSessionTemplate.insert("orders-mapper.insertOrder",vo);
    }
    //결제완료시 OitemVo 저장 !
    public int insertOitem(OitemVo oitemVo) {
        System.out.println(">> OrderDao() insertOitems()실행");
        return sqlSessionTemplate.insert("orders-mapper.insertOitem",oitemVo);
    }

    //배송지 저장


    //저장된 배송지 찾기
    public DeliveryInfoVo findAddress(MemberVO vo) {
        System.out.println(">> OrderDao() findAddress()실행");
        System.out.println("받은 membervo : " + vo);
        return sqlSessionTemplate.selectOne("orders-mapper.findDelivery",vo);
    }




    public int getPoint(MemberVO mvo) {
        return sqlSessionTemplate.selectOne("orders-mapper.getPoint",mvo);
    }

    //배송지 저장
    public int saveDelivery(OrdersVo ordersVo) {
        return sqlSessionTemplate.insert("orders-mapper.saveDelivery",ordersVo);
    }
}
