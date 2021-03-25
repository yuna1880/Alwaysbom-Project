package com.flo.alwaysbom.cart.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.choice.service.ChoiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CartApi {

    private final CartService cartService;

    @GetMapping("/api/cart/list")
    public List<CartVo> findAll() {
        return cartService.findAllCarts();
    }

    @PostMapping("/api/cart/add")
    public Integer addCart(CartVo cartVo, List<Integer> productIds) {
        cartService.addCart(cartVo, productIds);
        System.out.println("cartVo = " + cartVo);
        return cartVo.getIdx();
    }
}
