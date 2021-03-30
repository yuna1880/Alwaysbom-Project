package com.flo.alwaysbom.order.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.cart.vo.Letter;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrderDao;
import com.flo.alwaysbom.order.service.OrderService;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrderVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;
    private final OrderDao orderDao;

    // post 가 될 거다....
    //장바구니에 담긴 내용들 가지고 (세션에 저장) -> 편지
    @GetMapping("/order/getLetter")
    public String goLetter(Integer[] idx, HttpSession session) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("list = " + list);
        session.setAttribute("OrderList", list);
        return "order/letter";
    }

    //배송지입력 페이지 -> 결제전 확인 페이지
    @PostMapping("/order/payment")
    public String goPayment(OrderVo vo, OitemVo ovo, MemberVO mvo, Model model) {
        System.out.println("orderVo = " + vo);
        System.out.println("oItemVo = " + ovo);
        mvo.setId("yuna1880");
        System.out.println("MemverVo = " + mvo);
        //System.out.println("letterList = " + list);

        //해당 id 회원 포인트 찾기
        int point = orderService.getPoint(mvo);

        model.addAttribute("point",point);
        model.addAttribute("vo", vo);
        model.addAttribute("ovo", vo);

        return "order/payment";
    }

    //배송지 찾기
    @PostMapping("/order/findAddress")
    @ResponseBody
    public DeliveryInfoVo findAddress(MemberVO vo) {
        System.out.println("findAddress()");
        vo.setId("yuna1880");
        System.out.println("vo : " + vo);
        DeliveryInfoVo dvo = orderService.findAddress(vo);
        System.out.println("값 : " + dvo);
        return dvo;
        // {memberid : yuna1880}
    }

}
