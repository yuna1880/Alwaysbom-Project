package com.flo.alwaysbom.order.dao;

import com.flo.alwaysbom.order.vo.OrderVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public OrderDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
        System.out.println(">> OrderDao() 객체생성");
    }

    //결제완료시 저장 !(insert)
    public int insertOrder(OrderVo vo) {
        System.out.println(">> OrderDao() insertOrder()실행");
        return sqlSessionTemplate.insert("insertOrder",vo);
    }













}
