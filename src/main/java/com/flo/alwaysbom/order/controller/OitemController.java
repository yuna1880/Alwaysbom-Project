package com.flo.alwaysbom.order.controller;

import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.order.service.OitemService;
import com.flo.alwaysbom.order.vo.OitemVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class OitemController {

    private final OitemService oitemService;

    //편지 (letter_contents값 가지고)-> 배송지입력
    @PostMapping("/checkOut")
    public String checkOut(HttpServletRequest request, Integer cart_idx, OitemVo vo, CartVo cvo) {
        HttpSession session = request.getSession();
        System.out.println("vo : " + vo);
        System.out.println("svo : " + cvo);
        // vo가 2개 필요하니,  dto를 만들자.
        session.setAttribute("Oitem",vo);
        session.setAttribute("Cart",cvo);

        return "order/checkout";
    }



}
