package com.flo.alwaysbom.order.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.order.dao.OrderDao;
import com.flo.alwaysbom.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;
    private final OrderDao orderDao;

    //장바구니 -> 편지
    @GetMapping("/order/getLetter")
    public String goLetter(Integer[] idx, Model model) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("list = " + list);
        model.addAttribute("cartList",list);

        return "order/letter";
    }

    //배송지입력 페이지 -> 결제확인지 페이지
    @PostMapping("/order/payment")
    public String goPayment() {
        return "order/payment";
    }



}
