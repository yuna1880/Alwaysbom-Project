package com.flo.alwaysbom.order.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.service.OrdersService;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes({"orderList"})
public class OrdersController {

    private final OrdersService ordersService;
    private final CartService cartService;
    private final OrdersDao ordersDao;

    // post 가 될 거다....
    //장바구니에 담긴 내용들 가지고 (세션에 저장) -> 편지
    @GetMapping("/order/getLetter")
    public String goLetter(Integer[] idx, Model model) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("장바구니 list = " + list);
        model.addAttribute("orderList", list);
        return "order/letter";
    }

    @GetMapping("/order/sessionExample")
    public String sessionExample(@SessionAttribute("orderList") List<CartVo> list) {
        System.out.println("list = " + list);
        return "order/letter";
    }

    //배송지입력 페이지 -> 결제전 확인 페이지
    @PostMapping("/order/payment")
    public String goPayment(@SessionAttribute("orderList") CartVo cvo ,OrdersVo vo, OitemVo ovo, MemberVO mvo, Model model) {
        System.out.println("orderVo = " + vo);
        System.out.println("oItemVo = " + ovo);
        //id 임시 설정
        mvo.setId("yuna1880");
        //카트세션 가져오기
        System.out.println("cvo =" + cvo);

        //vo, ovo 셋팅


        System.out.println("MemberVo = " + mvo);


        //해당 id 회원 포인트 찾기
        int point = ordersService.getPoint(mvo);
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
        DeliveryInfoVo dvo = ordersService.findAddress(vo);
        System.out.println("값 : " + dvo);
        return dvo;
    }

}
