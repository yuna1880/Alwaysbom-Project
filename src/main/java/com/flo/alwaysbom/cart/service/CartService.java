package com.flo.alwaysbom.cart.service;

import com.flo.alwaysbom.cart.vo.CartVo;

import java.util.List;
import java.util.Optional;

public interface CartService {

    List<CartVo> findAllCarts();

    Integer addCart(CartVo cartVo, Integer[] productIds);

    List<CartVo> findCartsByMember(String memberId);

    List<CartVo> findByIdxArray(Integer[] idx);

    Optional<CartVo> findById(Integer idx);
}
