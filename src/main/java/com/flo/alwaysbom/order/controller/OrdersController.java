package com.flo.alwaysbom.order.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.order.service.OrderPriceService;
import com.flo.alwaysbom.order.vo.*;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.service.OrdersService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes(value = {"ordersVo","oitemList"})
public class OrdersController {

    private final OrderPriceService orderPriceService;
    private final OrdersService ordersService;


    //주문 시작! (받은 list oitemList 세션에 저장)
    @PostMapping("/order/letter")

    public String startOrder(String data, Model model) throws JsonProcessingException {
        System.out.println(">>startOrder() 주문시작!");

        ObjectMapper mapper = new ObjectMapper();
//        List<OitemVo> list = mapper.readValue(data, new TypeReference<List<OitemVo>>() {});
        CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, OitemVo.class);
        List<OitemVo> list = mapper.readValue(data, collectionType);
        list.forEach(System.out::println);

        System.out.println("oitemList : " + list);
        model.addAttribute("oitemList", list);

        return "order/letter";
    }

    //편지 (letter_contents값 가지고)-> 배송지입력
    @PostMapping("/oitem/checkOut")
    public String checkOut(@SessionAttribute("oitemList") List<OitemVo> olist, Model model, String data) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, Letter.class);
        List<Letter> list = mapper.readValue(data, collectionType);

        System.out.println("oitemList : " + olist);

        //편지 내용들 출력해보고, 각 인덱스에 맞는 편지내용 저장!
        for (Letter letter : list) {
            System.out.println("편지 : " + letter.getContent());
            olist.get(letter.getIdx()).setLetterContent(letter.getContent());
        }

        //편지 내용 저장 후 oitemList
        System.out.println("oitemList : " + olist);

        return "order/checkout";
    }

    //배송지입력 후 -> 결제전 확인 페이지
    @PostMapping("/order/payment")
    public String goPayment(@SessionAttribute("oitemList") List<OitemVo> olist , OrdersVo ordersVo, MemberVO mvo, Model model) {

        //세션값 가져오기
        System.out.println("orderVo = " + ordersVo); //orderList
        System.out.println("OitemList = " + olist); //oitemList

        //id 임시 설정
        mvo = MemberVO.builder()
                .id("yuna1880")
                .grade("자스민")
                .point(1000)
                .build();

        model.addAttribute("member", mvo);
        model.addAttribute("oitemList", olist);
        model.addAttribute("orderPrice", orderPriceService.getOrderPrice(olist, mvo));

        ordersVo.setMemberId("yuna1880");

        model.addAttribute("ordersVo", ordersVo); //orderVo 세션
        System.out.println("ordersVo : " + ordersVo);
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

    //주문 전 확인창 (결제 정보 입력) -> 주문 완료
    @PostMapping("/order/complete")
    public String completeOrder (@SessionAttribute("oitemList") List<OitemVo> olist, OrdersVo ordersVo, Model model) {

        System.out.println("OrdersController.completeOrder");
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        System.out.println("oitemList : " + olist);
        System.out.println("orderVo : " + ordersVo);

        //주문상품, 주문자 정보 모두 가지고 DB insert
        ordersService.insertOrder(ordersVo, olist);

        //배송지 저장 눌렀을때 ? -> 저장해주기
        if (ordersVo.isSaveAddress() == true) {
            ordersService.saveDelivery(ordersVo);
        }
        model.addAttribute("ordersVo",ordersVo);
        return "/order/order_ok";
    }

    //주문정보 + 주문한 상품내역 조회
    @PostMapping("/order/findMyOrders")
    public String findOrder(MemberVO vo) {
        return null;
    }





}
