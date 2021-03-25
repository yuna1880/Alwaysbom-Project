package com.flo.alwaysbom.cart.service;

import com.flo.alwaysbom.cart.vo.CartVo;

import java.util.List;

public interface CartService {

    List<CartVo> findAllCarts();

    Integer addCart(CartVo cartVo, Integer[] productIds);

    List<CartVo> findCartsByMember(String memberId);

}
