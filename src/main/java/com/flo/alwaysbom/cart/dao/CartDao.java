package com.flo.alwaysbom.cart.dao;

import com.flo.alwaysbom.cart.vo.CartVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CartDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public List<CartVo> findAllCarts() {
        return sqlSessionTemplate.selectList("cart.findAll");
    }

    public Integer addCart(CartVo cartVo) {
        sqlSessionTemplate.insert("cart.insertCart", cartVo);
        return cartVo.getIdx();
    }

    public List<CartVo> findCartsByMember(String memberId) {
        return sqlSessionTemplate.selectList("cart.findCartsByMember", memberId);
    }
}
