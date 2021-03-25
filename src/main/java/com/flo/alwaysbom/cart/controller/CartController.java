package com.flo.alwaysbom.cart.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping("/cart/list")
    public String getCart(Model model, String memberId) {
        List<CartVo> list = cartService.findCartsByMember(memberId);

        model.addAttribute("list", list);
        return "cart/list";
    }

    @GetMapping("/cart/order")
    public String order(@RequestBody List<CartVo> list) {
        System.out.println("list = " + list);
        for (CartVo cartVo : list) {
            System.out.println("cartVo = " + cartVo);
            System.out.println("cartVo.getLetter() = " + cartVo.getLetter());
        }
        return "";
    }
    @GetMapping("/cart/order2")
    public String order2(Integer[] idx) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("list = " + list);

        return "";
    }
}
