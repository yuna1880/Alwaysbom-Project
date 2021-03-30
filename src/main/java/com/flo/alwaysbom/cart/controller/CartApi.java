package com.flo.alwaysbom.cart.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.choice.service.ChoiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class CartApi {

    private final CartService cartService;

    @GetMapping("/api/cart/list")
    public List<CartVo> findAll() {
        return cartService.findAllCarts();
    }

    @PostMapping(value = "/api/cart/add")
    public CartVo addCart(@RequestBody CartVo cartVo) {
        cartService.addCart(cartVo);
        return cartService.findById(cartVo.getIdx()).orElse(null);
    }

    @PostMapping("/api/cart/updateQuantity")
    public CartVo updateQuantity(@RequestBody CartVo cartItem) {
        return cartService.updateQuantity(cartItem);
    }
}
